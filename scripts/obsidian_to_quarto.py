#!/usr/bin/env python3

from __future__ import annotations

import re
import sys
from datetime import date
from pathlib import Path
from urllib.parse import quote

try:
    import yaml
except ModuleNotFoundError:
    yaml = None


LANGUAGE_TAGS = {
    "ENG": "lang-eng",
    "KOR": "lang-kor",
}

ORDERED_METADATA_KEYS = (
    "title",
    "date",
    "categories",
    "tags",
    "author",
    "format",
    "toc",
    "comments",
)

KEY_LINE_RE = re.compile(r"^([A-Za-z_][A-Za-z0-9_-]*)\s*:\s*(.*)$")
ISO_DATE_RE = re.compile(r"^\d{4}-\d{2}-\d{2}$")


def split_frontmatter(text: str) -> tuple[str, str]:
    match = re.match(r"^---\s*\n(.*?)\n---\s*\n?(.*)$", text, re.S)
    if not match:
        raise ValueError("Expected YAML front matter at the start of the file")

    frontmatter, body = match.groups()
    return frontmatter, body


def preprocess_frontmatter(frontmatter: str) -> str:
    normalized_lines = []

    for line in frontmatter.splitlines():
        match = re.match(r"^(\w+)\s*:\s*(.*)$", line)
        if not match:
            normalized_lines.append(line)
            continue

        key, value = match.groups()

        if key == "title" and value and not value.startswith(("'", '"')):
            value = value.replace('"', '\\"')
            normalized_lines.append(f'{key}: "{value}"')
            continue

        if key == "author" and value.startswith("<") and value.endswith(">"):
            normalized_lines.append(f"{key}: {value[1:-1]}")
            continue

        normalized_lines.append(f"{key}: {value}")

    return "\n".join(normalized_lines)


def strip_inline_comment(value: str) -> str:
    in_single = False
    in_double = False
    bracket_depth = 0
    previous = ""

    for index, char in enumerate(value):
        if char == "'" and not in_double:
            if in_single and index + 1 < len(value) and value[index + 1] == "'":
                previous = char
                continue
            in_single = not in_single
        elif char == '"' and not in_single and previous != "\\":
            in_double = not in_double
        elif not in_single and not in_double:
            if char == "[":
                bracket_depth += 1
            elif char == "]":
                bracket_depth = max(0, bracket_depth - 1)
            elif char == "#" and bracket_depth == 0 and (index == 0 or value[index - 1].isspace()):
                return value[:index].rstrip()

        previous = char

    return value.rstrip()


def dedent_block(lines: list[str]) -> list[str]:
    nonempty = [line for line in lines if line.strip()]
    if not nonempty:
        return []

    indent = min(len(line) - len(line.lstrip(" ")) for line in nonempty)
    return [line[indent:] if line.strip() else "" for line in lines]


def split_sections(lines: list[str]) -> list[tuple[str, str, list[str]]]:
    sections: list[tuple[str, str, list[str]]] = []
    current_key: str | None = None
    current_value = ""
    current_block: list[str] = []

    for line in lines:
        match = KEY_LINE_RE.match(line)
        if match and not line.startswith("- "):
            if current_key is not None:
                sections.append((current_key, current_value, current_block))
            current_key = match.group(1)
            current_value = match.group(2)
            current_block = []
            continue

        if current_key is None:
            raise ValueError(f"Unable to parse front matter line: {line}")

        current_block.append(line)

    if current_key is not None:
        sections.append((current_key, current_value, current_block))

    return sections


def parse_scalar(value: str):
    text = strip_inline_comment(value).strip()

    if not text:
        return ""

    if text.startswith("[") and text.endswith("]"):
        return parse_flow_list(text)

    lowered = text.lower()
    if lowered == "true":
        return True
    if lowered == "false":
        return False
    if lowered in {"null", "~"}:
        return None
    if ISO_DATE_RE.match(text):
        return date.fromisoformat(text)

    if text.startswith("'") and text.endswith("'"):
        return text[1:-1].replace("''", "'")

    if text.startswith('"') and text.endswith('"'):
        unescaped = text[1:-1]
        unescaped = unescaped.replace('\\"', '"')
        unescaped = unescaped.replace("\\\\", "\\")
        return unescaped

    return text


def parse_flow_list(value: str) -> list:
    text = strip_inline_comment(value).strip()
    if not (text.startswith("[") and text.endswith("]")):
        raise ValueError(f"Expected flow list, received: {value}")

    inner = text[1:-1]
    items = []
    current = []
    in_single = False
    in_double = False
    previous = ""

    for index, char in enumerate(inner):
        if char == "'" and not in_double:
            if in_single and index + 1 < len(inner) and inner[index + 1] == "'":
                current.append(char)
                previous = char
                continue
            in_single = not in_single
        elif char == '"' and not in_single and previous != "\\":
            in_double = not in_double
        elif char == "," and not in_single and not in_double:
            item = "".join(current).strip()
            if item:
                items.append(parse_scalar(item))
            current = []
            previous = char
            continue

        current.append(char)
        previous = char

    tail = "".join(current).strip()
    if tail:
        items.append(parse_scalar(tail))

    return items


def parse_block_list(lines: list[str]) -> list:
    items = []

    for line in lines:
        stripped = line.lstrip()
        if not stripped or not stripped.startswith("- "):
            continue
        items.append(parse_scalar(stripped[2:]))

    return items


def parse_mapping(lines: list[str]) -> dict:
    metadata = {}

    for key, inline_value, block_lines in split_sections(lines):
        inline_value = inline_value.rstrip()
        nonempty_block_lines = [line for line in block_lines if line.strip()]

        if inline_value:
            if inline_value.lstrip().startswith("["):
                combined = "\n".join([inline_value] + [line.strip() for line in nonempty_block_lines])
                metadata[key] = parse_flow_list(combined)
                continue

            if nonempty_block_lines:
                folded = " ".join([inline_value] + [line.strip() for line in nonempty_block_lines])
                metadata[key] = parse_scalar(folded)
                continue

            metadata[key] = parse_scalar(inline_value)
            continue

        if not nonempty_block_lines:
            metadata[key] = None
            continue

        if all(line.lstrip().startswith("- ") for line in nonempty_block_lines):
            metadata[key] = parse_block_list(nonempty_block_lines)
            continue

        metadata[key] = parse_mapping(dedent_block(block_lines))

    return metadata


def dump_scalar(value) -> str:
    if isinstance(value, bool):
        return "true" if value else "false"

    text = str(value)
    if ISO_DATE_RE.match(text):
        return text

    if (
        text
        and text == text.strip()
        and "\n" not in text
        and "#" not in text
        and ": " not in text
        and not text.startswith(("-", "?", "@", "`", "{", "[", "!", "&", "*", ",", "|", ">", "%", "'", '"'))
        and not text.endswith(":")
        and text.lower() not in {"true", "false", "null", "~"}
    ):
        return text

    return "'" + text.replace("'", "''") + "'"


def wrap_scalar_line(prefix: str, text: str, continuation_prefix: str, *, preserve_trailing_space: bool = False) -> list[str]:
    if len(prefix + text) <= 80 or " " not in text.strip():
        return [prefix + text]

    tokens = re.findall(r"\S+\s*", text)
    lines = []
    current = prefix

    for token in tokens:
        candidate = current + token
        if current == prefix or len(candidate.rstrip()) <= 80:
            current = candidate
            continue

        lines.append(current.rstrip())
        current = continuation_prefix + token

    if preserve_trailing_space:
        lines.append(current)
    else:
        lines.append(current.rstrip())

    return lines


def dump_value(key: str, value, indent: int = 0) -> list[str]:
    prefix = " " * indent

    if isinstance(value, dict):
        lines = [f"{prefix}{key}:"]
        for child_key, child_value in value.items():
            lines.extend(dump_value(child_key, child_value, indent + 2))
        return lines

    if isinstance(value, list):
        lines = [f"{prefix}{key}:"]
        item_prefix = " " * indent
        for item in value:
            lines.append(f"{item_prefix}- {dump_scalar(item)}")
        return lines

    rendered = dump_scalar(value)
    line_prefix = f"{prefix}{key}: "
    continuation_prefix = " " * (indent + 2)

    if rendered.startswith("'") and rendered.endswith("'"):
        wrapped = wrap_scalar_line(
            line_prefix + "'",
            rendered[1:-1],
            continuation_prefix,
            preserve_trailing_space=True,
        )
        wrapped[-1] = wrapped[-1] + "'"
        return wrapped

    return wrap_scalar_line(line_prefix, rendered, continuation_prefix)


def load_metadata(path: Path) -> tuple[dict, str]:
    frontmatter, body = split_frontmatter(path.read_text())
    metadata = parse_mapping(preprocess_frontmatter(frontmatter).splitlines()) or {}
    return metadata, body


def ensure_list(value) -> list[str]:
    if value is None:
        return []
    if isinstance(value, list):
        return [str(item) for item in value]
    return [str(value)]


def normalize_author(author) -> str | None:
    if author is None:
        return None

    text = str(author).strip()
    if text.startswith("<") and text.endswith(">"):
        text = text[1:-1].strip()

    return text or None


def ensure_html_format(metadata: dict) -> dict | None:
    format_value = metadata.get("format")

    if format_value is None:
        format_value = {}
    elif isinstance(format_value, str):
        format_value = {format_value: {}}
    elif not isinstance(format_value, dict):
        return None

    html_value = format_value.get("html")

    if html_value is None:
        html_value = {}
    elif not isinstance(html_value, dict):
        return None

    format_value["html"] = html_value
    metadata["format"] = format_value
    return html_value


def normalize_categories_and_tags(source_meta: dict, target_meta: dict) -> tuple[list[str], list[str]]:
    if target_meta.get("categories"):
        categories = ensure_list(target_meta.get("categories"))
        tags = ensure_list(target_meta.get("tags"))
        return categories, tags

    categories = ensure_list(source_meta.get("categories"))
    tags = ensure_list(source_meta.get("tags"))

    normalized_categories = []
    extra_tags = []

    for category in categories:
        lang_tag = LANGUAGE_TAGS.get(category)
        if lang_tag:
            extra_tags.append(lang_tag)
            continue
        normalized_categories.append(category)

    seen_tags = set()
    normalized_tags = []

    for tag in extra_tags + tags:
        if tag in seen_tags:
            continue
        normalized_tags.append(tag)
        seen_tags.add(tag)

    return normalized_categories, normalized_tags


def transform_obsidian_embeds(body: str) -> str:
    def replace_embed(match: re.Match[str]) -> str:
        target = match.group(1).strip()
        alt = (match.group(2) or "").strip()
        encoded_target = quote(target, safe="/.-_()")
        alt_text = alt if alt and not alt.isdigit() else ""
        return f"![{alt_text}](/img/{encoded_target})"

    return re.sub(r"!\[\[([^\]|]+)(?:\|([^\]]+))?\]\]", replace_embed, body)


def normalize_standalone_image_spacing(body: str) -> str:
    source_lines = body.splitlines()
    lines = []
    in_fence = False

    for index, line in enumerate(source_lines):
        stripped = line.strip()

        if stripped.startswith("```"):
            in_fence = not in_fence
            lines.append(line)
            continue

        if in_fence:
            lines.append(line)
            continue

        # Pandoc merges a standalone image and the following text/list into a
        # single paragraph if there is no blank line after the image.
        if re.match(r"^!\[[^\]]*\]\([^)]+\)(?:\{[^}]+\})?\s*$", line):
            if lines and lines[-1].strip():
                lines.append("")

            lines.append(line)

            next_line = source_lines[index + 1] if index + 1 < len(source_lines) else ""
            if next_line.strip():
                lines.append("")

            continue

        lines.append(line)

    return "\n".join(lines)


def transform_inline_display_math(body: str) -> str:
    source_lines = body.splitlines()
    lines = []
    in_fence = False

    for index, line in enumerate(source_lines):
        stripped = line.strip()

        if stripped.startswith("```"):
            in_fence = not in_fence
            lines.append(line)
            continue

        if in_fence or "$$" not in line:
            lines.append(line)
            continue

        block_match = re.match(r"^(\s*)\$\$([^\n$]+?)\$\$\s*$", line)
        if block_match:
            indent, expression = block_match.groups()

            if not indent and lines and lines[-1].strip():
                lines.append("")

            lines.append(f"{indent}$$")
            lines.append(f"{indent}{expression.strip()}")
            lines.append(f"{indent}$$")

            next_line = source_lines[index + 1] if index + 1 < len(source_lines) else ""
            if not indent and next_line.strip():
                lines.append("")

            continue

        outside_text = re.sub(r"\$\$([^\n$]+?)\$\$", "", line).strip()
        if outside_text:
            line = re.sub(r"\$\$([^\n$]+?)\$\$", r"$\1$", line)

        lines.append(line)

    return "\n".join(lines)


def normalize_body(body: str) -> str:
    text = body.replace("\u200b", "")
    text = transform_obsidian_embeds(text)
    text = normalize_standalone_image_spacing(text)
    text = transform_inline_display_math(text)
    return text


def body_contains_math(body: str) -> bool:
    return bool(re.search(r"\$[^$\n]+\$|\$\$|\\\(|\\\[|\\begin\{", body))


def dump_metadata(metadata: dict) -> str:
    ordered = {}

    for key in ORDERED_METADATA_KEYS:
        if key in metadata and metadata[key] not in (None, [], ""):
            ordered[key] = metadata[key]

    for key, value in metadata.items():
        if key not in ordered and value not in (None, [], ""):
            ordered[key] = value

    if yaml is not None:
        return yaml.safe_dump(
            ordered,
            allow_unicode=True,
            sort_keys=False,
            default_flow_style=False,
        ).strip()

    lines = []
    for key, value in ordered.items():
        lines.extend(dump_value(key, value))
    return "\n".join(lines).strip()


def main() -> int:
    if len(sys.argv) != 3:
        raise SystemExit("Usage: obsidian_to_quarto.py <source> <target>")

    source = Path(sys.argv[1])
    target = Path(sys.argv[2])

    source_meta, source_body = load_metadata(source)
    target_meta = {}

    if target.exists():
        try:
            target_meta, _ = load_metadata(target)
        except Exception:
            target_meta = {}

    body = normalize_body(source_body).strip() + "\n"

    categories, tags = normalize_categories_and_tags(source_meta, target_meta)

    merged_meta = dict(source_meta)
    for key, value in target_meta.items():
        if key not in merged_meta:
            merged_meta[key] = value

    merged_meta["categories"] = categories
    merged_meta["tags"] = tags

    author = normalize_author(merged_meta.get("author"))
    if author:
        merged_meta["author"] = author

    needs_math = bool(merged_meta.get("math") or target_meta.get("math") or body_contains_math(body))
    merged_meta.pop("math", None)

    if needs_math:
        html_format = ensure_html_format(merged_meta)
        if html_format is not None:
            html_format.setdefault("html-math-method", "mathjax")

    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_text(f"---\n{dump_metadata(merged_meta)}\n---\n\n{body}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
