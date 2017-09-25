# enough.css

enough.css is a tiny (457B minified) CSS style sheet with most of the styling
you'll need for that blog of yours.

> Websites aren't broken by default, they are functional, high-performing, and
> accessible. You break them.
&mdash; [http://motherfuckingwebsite.com](http://motherfuckingwebsite.com)

![motherfuckingwebsite.com with enough.css](https://gist.github.com/jeffkreeftmeijer/6d0d7e76064b4db628a0ad9b7fcf3fee/raw/motherfuckingwebsite.png)

It's an experiment to see how little CSS a blog can get away with while still
looking good and being readable on big and small screens. It styles pages
without having to add extra markup like wrapper `<div>`s and CSS classes.

Besides the base style sheet, it comes modules for styling specific
tags. These are included in `enough.min.css` by default, but you can build your
own to save some bytes if your project doesn't need everything.

Some of the rules are duplicated across modules so they don't depend on each
other, but [csso](https://github.com/css/csso) takes them out when minifying.

## enough.css

- Increases the font size to 18px
- Uses `system-ui` if available, or falls back to a sans-serif font
- Uses a 1.4 em `line-height` for body text, but doesn't touch headings
- Makes the body 40 em wide with a padding of 1 em, and centers it
- Adds a 100% `max-width` to images and videos, so they can't overflow

## enough.code.css

- Uses a 0.8 em size and a 1.4 em line height in `<pre>`, `<code>` and `<kbd>`
  tags
- Uses SFMono (for
  [connoisseurs](https://github.com/jeffkreeftmeijer/enough.css/commit/d96b26347bf55c0061da5e434974191f3a2d67ed))
  or Monaco, as the font in `<pre>`, `<code>`, and `<kbd>` tags, or falls back
  to the system's monospace font.
- Adds an x-overflow to `<pre>` tags, so long lines show horizontal scroll bars
- Adds a 1 em padding to `<pre>` tags
- Adds a `ghostwhite` background color and a 3 pixel border radius to `<pre>`,
  `<code>` and `<kbd>` tags

## enough.blockquote.css

- Uses `dimgray` as the font color for `<blockquote>` tags
- Uses italic type for `<blockquote`> tags

## enough.media.css

- Uses an 0.9em body font size for a maximum body width of 375px (like 4.7"
  iPhones)
- Uses an 0.8em body font size for a maximum body width of 320px (like 4.0"
  iPhones)

## enough.min.css

```
$ npm install -g csso-cli
$ cat enough.css enough.media.css enough.code.css enough.kbd.css enough.blockquote.css | csso -o enough.min.css
```
