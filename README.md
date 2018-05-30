# enough.css

enough.css is a tiny CSS framework with most of the styling you need for that
blog of yours.

The base stylesheet is **118 bytes** minified. It comes with optional modules
to (minimally) style code blocks, blockquotes and tables. It's responsive by
default, but has a module to decrease font sizes on smaller screens for extra
responsiveness. The whole package is **545 bytes** minified.

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
- Uses a 1.4 em `line-height`
- Makes the body 40 em wide with 1 em left- and right paddings, and centers it
- Adds a 100% `max-width` to images and videos, so they can't overflow.
- Sets image height to `auto` to resize proportionally when width and height
  are set

## enough.code.css

- Uses a 0.8 em size and a 1.4 em line height in `<pre>`, `<code>` and `<kbd>`
  tags
- Uses SFMono (for
  [connoisseurs](https://github.com/jeffkreeftmeijer/enough.css/commit/d96b26347bf55c0061da5e434974191f3a2d67ed))
  or Monaco, as the font in `<pre>`, `<code>`, and `<kbd>` tags, or falls back
  to the system's monospace font
- Adds an x-overflow to `<pre>` tags, so long lines show horizontal scroll bars
- Adds a 1 em padding to `<pre>` tags
- Adds a `ghostwhite` background color to `<pre>` tags

## enough.blockquote.css

- Uses italic type for `<blockquote>` tags

## enough.media.css

- Uses an 0.9em body font size for a maximum body width of 375px (like 4.7"
  iPhones)
- Uses an 0.8em body font size for a maximum body width of 320px (like 4.0"
  iPhones)

## enough.table.css

- Inherits the parent's font size
- Adds a 100% `width` to tables.
- Uses a 0.5em padding in table cells and headers without adding padding on the
  left and right side of the table.
- Collapses the non-existing borders to remove the extra margins around cells
- Left-aligns table headers.

## enough.min.css

```
$ npm install -g csso-cli
$ cat enough.css enough.media.css enough.code.css enough.blockquote.css enough.table.css | csso -o enough.min.css
```
