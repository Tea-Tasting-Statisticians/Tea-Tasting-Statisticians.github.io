# Jekyll + Obsidian Writing Workflow

This repo uses Jekyll/Chirpy for publishing and Obsidian for writing.

## Zero-Manual Preview

When you run `bundle exec jekyll serve` (or `bash tools/run.sh`), this repo now auto-converts Obsidian image embeds at build time.

Example:

- `![[스크린샷 2026-02-22 오후 10.28.16.png]]`
- renders as an image from `/img/...` automatically

So you can preview/publish without running the normalizer for every edit.

## Obsidian Setup

Configure Obsidian with the following values:

- `Use [[Wikilinks]]`: `Off`
- `New link format`: `Absolute path in vault`
- `Default location for new attachments`: `In the folder specified below`
- `Attachment folder path`: `img`

With these settings, drag/paste images into a post and Jekyll preview will work automatically.

If you still paste Obsidian embeds like `![[img/스크린샷 2026-02-22 오후 10.28.10.png]]`, that is also supported by the normalizer.

## Authoring Steps (Recommended)

1. Create or open a post in `_posts/`.
2. Drag/paste images in Obsidian.
3. Preview locally:

```bash
bundle exec jekyll serve
```

4. Optional cleanup (only when you want tidy filenames and permanent markdown conversion):

```bash
bash tools/normalize-post-images.sh --post _posts/<your-post>.md
```

If you want conversion but do not want file renaming:

```bash
bash tools/normalize-post-images.sh --post _posts/<your-post>.md --no-rename
```

## Normalized Image Contract

- All post image links should be rooted:
  - `![](/img/<filename>)`
- New pasted image names are normalized to:
  - `YYYY-MM-DD-<post-slug>-NN.<ext>`

Canonical example:

```markdown
![](/img/2026-03-01-neuroscience-01.png)
```

## Useful Options

Dry-run (no file changes):

```bash
bash tools/normalize-post-images.sh --post _posts/<your-post>.md --dry-run
```
