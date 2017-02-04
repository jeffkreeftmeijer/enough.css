# enough.css

enough.css is a tiny (197B minified) CSS style sheet with most of the styling you'll need for that blog of yours. It'd make http://motherfuckingwebsite.com look like this:

![motherfuckingwebsite.com with readable.css](https://gist.github.com/jeffkreeftmeijer/6d0d7e76064b4db628a0ad9b7fcf3fee/raw/motherfuckingwebsite.png)

## Features

- Increases the font size to 18px
- Uses `-apple-system` if available, or falls back to a sans-serif font
- Uses a `line-height` of 1.4 ems for body text, but doesn't touch headings
- Makes the body 40 ems wide with a padding of 1 em, and centers it
- Adds a 100% `max-width` to images, so they can't overflow

## enough.code.css

- Uses an 0.8 em size and Monaco as the font in `<code>` tags, or falls back to a monospace font
- Wraps lines in `<pre>` tags
