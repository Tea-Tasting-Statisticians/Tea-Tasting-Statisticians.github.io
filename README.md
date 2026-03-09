# Tea Tasting Statisticians

Quarto-based blog for biostatistics, regulatory science, and real-world evidence.

## Post authoring

- Write new posts as single files in `_posts/` (`.md` or `.qmd`).
- Keep `date:` in front matter (used for publish date/sorting).
- Quarto runs `tools/sync-posts-from-jekyll.sh` before render and syncs them to `posts/<slug>/index.*`.
- Production URLs stay under `/posts/<slug>/`.

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
