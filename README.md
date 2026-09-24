# Tea Tasting Statisticians

Quarto-based blog for biostatistics, regulatory science, and real-world evidence.

## Local development

1. Install [Quarto](https://quarto.org/docs/get-started/).
2. Render the site:

```bash
quarto render
```

3. Preview locally:

```bash
quarto preview
```

Edit post sources in `_posts/YYYY-MM-DD-title.md`. The pre-render hook generates
`posts/title/index.md`; edits to generated files can be overwritten on the next
render. Obsidian callouts (`> [!info]`, `> [!tip]`, `> [!abstract]+`) are converted
to Quarto callouts, including tables and expanded (`+`) or collapsed (`-`) states.
Keep a quoted blank line (`>`) between a callout title and its table in the source.

Run converter checks with `python3 -B -m unittest discover -s scripts -p 'test_*.py'`.

## Responsive layout

Quarto's grid in `_quarto.yml` uses 220px navigation and margin columns.
The full layout is centered and capped at 1400px by `--blog-layout-width` in
`styles.css`, with the header and footer aligned to the same width. On smaller
screens it fills the available width. On large monitors the unused space is
balanced on both sides rather than appearing after the right sidebar.
Inside this container, `mozilla.scss` lets the body fill the space between
sidebars while preserving Quarto's named grid lines and outer padding.
The 960px `body-width` remains a base for Quarto's smaller layouts. Tablet and
mobile breakpoints remain native to Quarto.

`styles.css` handles fluid headings and logo sizing, wrapping long titles,
scrollable tables and equations, and stacked post listings below 768px.
On phones, the LinkedIn share link moves into the page flow to avoid covering
content. `mozilla.scss` controls the compact navbar padding.

For visual review, preview the home page, post listing, and an article with
tables at 375px, 768px, 1024px, 1440px, and 1920px widths. Check navigation,
search, category filters, wide content, and 200% browser zoom.

## Deployment

- Primary hosting: Netlify (production build from `main`)
- Build command: `quarto render`
- Publish directory: `_site`
- Canonical domain: `https://tea-tasting-statisticians.com`
- `www` redirects to apex via Netlify redirect rules in `netlify.toml`

## GitHub Pages role

GitHub Pages is used only as a redirect endpoint for `tea-tasting-statisticians.github.io`.
The redirect content and workflow live in:

- `gh-pages-redirect/`
- `.github/workflows/pages-redirect.yml`

## Theme attribution

The Quarto styling in `mozilla.scss` and `styles.css` is adapted from:

- <https://github.com/dkapitan/dkapitan.github.io>

Adapted files are annotated with MPL-2.0 attribution comments.

## Copyright

Copyright &copy; 2026 Tea Tasting Statisticians
