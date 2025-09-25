# Principles
- No JavaScript (only native HTML page interactivity)
- No custom fonts, use a range of [system fonts](https://modernfontstacks.com)
- Use MathML for math rendering
- Just raw HTML

## Writing Posts
In practice, I use [pandoc](https://pandoc.org) to take my Obsidian notes and convert them to HTML.
In the process it also renders Latex as MathML!
To generate HTML posts from Markdown, run:
```bash
pandoc \
    --from markdown \
    --to html5 \
    --standalone \
    --toc \
    --no-highlight \
    --variable css=tufte.css \
    --data-dir ./pandoc/ \
    --mathml \
    --output ./posts/post1.html \
    post1.md
```

To use highlighting, replace `--no-highlight` with `--highlight-style ./pandoc/onelight.theme`.
For now, I'm not using it because the bundled CSS is way too large for my use cases and because it's a bit tricky to configure using one color scheme for light mode and one for dark mode (given we're generating the HTML files with pandoc).
