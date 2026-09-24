import unittest

from obsidian_to_quarto import normalize_body, transform_obsidian_callouts


class ObsidianCalloutTests(unittest.TestCase):
    def test_glossary_has_separate_title_and_table(self):
        source = "> [!abstract]+ 용어 정의\n> | 용어 | 정의 |\n> |---|---|\n> | Pixel | 화소 |"
        result = normalize_body(source)
        self.assertIn('::: {.callout-note collapse="false"}\n## 용어 정의\n\n| 용어 | 정의 |', result)
        self.assertIn("| Pixel | 화소 |\n\n:::", result)
        self.assertNotIn("[!abstract]", result)

    def test_fold_states_and_following_text(self):
        for marker, attributes in [("", ".callout-tip"), ("+", '.callout-tip collapse="false"'), ("-", '.callout-tip collapse="true"')]:
            with self.subTest(marker=marker):
                result = transform_obsidian_callouts(f"> [!tip]{marker} Title\n> - Item\n\nFollowing paragraph")
                self.assertIn("::: {" + attributes + "}", result)
                self.assertIn("- Item\n\n:::\n\n\nFollowing paragraph", result)

    def test_code_examples_and_ordinary_quotes_are_preserved(self):
        for delimiter in ["```", "~~~~"]:
            source = f"{delimiter}markdown\n> [!tip] Literal example\n{delimiter}\n\n> Ordinary quote"
            self.assertEqual(transform_obsidian_callouts(source), source)

    def test_existing_quoted_blank_line_is_supported(self):
        source = "> [!info] Title\n>\n> Body"
        result = transform_obsidian_callouts(source)
        self.assertIn("## Title\n\n\nBody\n\n:::", result)
        self.assertEqual(transform_obsidian_callouts(result).rstrip(), result.rstrip())


if __name__ == "__main__":
    unittest.main()
