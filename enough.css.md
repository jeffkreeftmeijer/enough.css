
# enough.css

enough.css is a tiny (**307 bytes**) CSS framework with most of the styling you need for that blog of yours.

> Websites aren't broken by default, they are functional, high-performing, and accessible. You break them. &#x2014; <http://motherfuckingwebsite.com>

[![img](./screenshot.png)](https://jeffkreeftmeijer.github.io/enough.css/)

It's an experiment to see how little CSS a blog can get away with while still looking good and being readable on big and small screens. It styles pages without having to add extra markup like wrapper `<div>`​s and CSS classes.


# Table of Contents

-   [Features](#orgab78e61)
    -   [Font](#org8e4c22c)
    -   [Body width and padding](#orga9a13cf)
    -   [Image and video widths](#orge96ad07)
    -   [Code](#org671b182)
    -   [Tables](#orgd46737e)
-   [Contributing](#orgcb34b3c)
    -   [Minification](#org9f2d669)
    -   [Git pre-commit hook](#orgc14839d)
    -   [Generating the Markdown README](#org3dfc112)


<a id="orgab78e61"></a>

# Features


<a id="org8e4c22c"></a>

## Font

Most, if not all, browsers default to *Times New Roman* as the typeface, with a font size of 16 pixels and a line height of 125 %. Enough.css produces larger, responsive text in a modern typeface, with more spacing between lines:

```css
html{
  font: clamp(16px, 2.2vw, 22px)/1.5 system-ui, sans-serif;
}
```

Smaller font sizes are great for 14″ monitors with low resolutions, but produce text that's uncomfortable to read on modern displays. Enough.css uses CSS's `clamp()` function to produce a font size that matches 2.2% of the viewport width with a 16-pixel minimum and a 22 pixel maximum. In practice, this means a 16 pixel font size for phones, maximum screen usage on tablets and a responsive font size that's configurable by resizing the window on desktop.

The preferred font family is *system-ui*, which points to the operating system's default font. This produces text in Apple's *San Fransisco* font on macOS and iOS, and falls back to a sans-serif font on other platforms.

Finally, the line height is 150 %, producing a 33 pixel line height for 22 pixel body text.


<a id="orga9a13cf"></a>

## Body width and padding

Enough.css adds a maximum width to pages to keep lines from running too long, with padding that ensures there's always some space between the text and the sides of the page, even if the window is resized:

```css
body{
  margin: auto;
  padding: 0 2em;
  max-width: 40em;
}
```

A 40 em page width produces an 880-pixel wide page if for a 22 pixel font size, fitting around 85 characters per line. A 2 em padding is added to the sides, which produces 44 pixels on each size for a 22 pixel font size, which are added to the page's width.

If the window is wider than 968 pixels, the side paddings increase to keep the body in the center of the window. If the window is narrower, the body also becomes narrower. The padding remains at 2 em, but reduces in size because of responsive font sizing.


<a id="orge96ad07"></a>

## Image and video widths

To keep images and video tags from overflowing and producing horizontal scroll bars, enough.css caps their widths to 100 % of the body width:

```css
img, video{
  max-width: 100%;
  height: auto;
}
```

Doing this automatically scales images and videos down to fit the page. Setting an automatic height makes sure the images or videos keep their aspect ratio, even if they're resized.


<a id="org671b182"></a>

## Code

Code, either in `<code>` tags, `<kbd>` tags, or `<pre>` blocks, uses a different typeface, a smaller font, and scroll bars when overflowing:

```css
code,kbd,pre{
  font: 0.85rem ui-monospace, SFMono-Regular, Monaco, monospace;
}

pre{
  overflow: auto;
}
```

Enough.css switches code elements to the *ui-monospace* font family, which is Apple's *SF Mono* font in Safari on macOS and iOS. For other browsers, *SFMono-Regular* (works on Chrome on macOS) and *Monaco* are tried before falling back to the default monospace font.

The font size is reduced to 0.85 *rem*. The rem unit is used instead of em because it's relative to the font size set for the main `html` tag instead of the containing element. This makes sure the font size for code is always 85 % of the size for body text, even if a code block is nested in a `<pre>` tag.

The font size for code is smaller to make it fit better in the flow of body text, but also to have enough room for code blocks within the width of the page body. The 0.85 rem size gives enough space for roughly 74 characters on bigger screens, and 36 characters on 375-pixel wide phones.

If a code block doesn't fit the page body, a scroll bar is displayed instead of overflowing.


<a id="orgd46737e"></a>

## Tables

Tables take the full width of the page and have collapsed borders around each cell. Each cell also has a slight padding to give the data some breathing room:

```css
table{
  border-collapse: collapse;
  width: 100%;
}

td, th{
  padding: 0.5em;
  border: 1px solid;
}
```

By default, the width of tables is based on their contents. Enough.css stretches tables to have them fill the page width.

Each table cell has a 1-pixel solid border, without a set color. Omitting the color reuses the body text color, which is black by default. The *border-collapse* property is used to combine the borders of adjacent cells.


<a id="orgcb34b3c"></a>

# Contributing


<a id="org9f2d669"></a>

## Minification

A minified version of enough.css is bundled in *enough.min.css* It's generated by passing the source file through [PostCSS](https://postcss.org), which is configured to use [cssnano](https://cssnano.co). Use NPM's install command to install the dependencies:

```shell
npm install
```

Then, minify enough.css through npx:

```shell
npx postcss enough.css > enough.min.css
```


<a id="orgc14839d"></a>

## Git pre-commit hook

The minified version of enough.css should always be kept up to date. As a convenience, it's recommended to set up the minification command as a git pre commit hook. A script for this is prepared in [`scripts/pre-commit`](scripts/pre-commit). To enable it as a pre-commit hook, symlink to it from git's hooks directory:

```shell
(cd .git/hooks && ln -s ../../scripts/pre-commit)
```

With the pre-commit hook set up, the minification command will be automatically run before changes are committed. To commit a change without running the hook, use the `--no-verify` flag.


<a id="org3dfc112"></a>

## Generating the Markdown README

The main Org file is exported to Markdown for compatibility with Github, which is then symlinked as `README.md` to show on the repository's public page.

```shell
emacs --batch --load scripts/generate-markdown.el --funcall enough.css/generate-markdown
```

A GitHub workflow regenerates the Markdown whenever the main or develop branch receive changes. Therefor, local changes to the Markdown file shouldn't be pushed to the remote repository.

---

-   [Interactive Demo™](https://jeffkreeftmeijer.github.io/enough.css)
-   [Code](https://github.com/jeffkreeftmeijer/enough.css)