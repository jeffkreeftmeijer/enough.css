# enough.css

enough.css is a tiny (374B minified) CSS style sheet with most of the styling you'll need for that blog of yours. I use it on [mine](https://jeffkreeftmeijer.com), and it'd make http://motherfuckingwebsite.com look like this:

![motherfuckingwebsite.com with enough.css](https://gist.github.com/jeffkreeftmeijer/6d0d7e76064b4db628a0ad9b7fcf3fee/raw/motherfuckingwebsite.png)

## enough.css

- Increases the font size to 18px
- Uses `-apple-system` if available, or falls back to a sans-serif font
- Uses a `line-height` of 1.4 ems for body text, but doesn't touch headings
- Makes the body 40 ems wide with a padding of 1 em, and centers it
- Adds a 100% `max-width` to images and videos, so they can't overflow

## enough.code.css

- Uses an 0.8 em size and Monaco as the font in `<code>` tags, or falls back to a monospace font
- Wraps lines in `<pre>` tags
- Adds a 1 em padding to `<pre>` tags
- Adds a `ghostwhite` background color to `<pre>` tags

## enough.kbd.css

- Uses an 0.8 em size, and inherits the font-family from the body for `<kbd>` tags
- Adds a rounded, 1 pixel `lightgrey` border for `kbd` tags
- Adds padding to make single-letter `kbd` tags square-ish

## enough.blockquote.css

- Uses `dimgray` as the font color for `<blockquote`> tags
- Uses italic type for `<blockquote`> tags

## enough.min.css

```
$ npm install -g csso-cli
$ cat enough.css enough.code.css enough.kbd.css enough.blockquote.css | csso -o enough.min.css
```

## License

MIT. Please [let me know](https://gist.github.com/jeffkreeftmeijer/362cfd02b8e9f73a435b13e763f28423#comments) if you use it for anything!
