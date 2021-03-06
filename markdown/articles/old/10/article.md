---

__Advertisement :)__

- __[pica](https://nodeca.github.io/pica/demo/)__ \- high quality and fast image
resize in browser.
- __[babelfish](https://github.com/nodeca/babelfish/)__ \- developer friendly
i18n with plurals support and easy syntax.

You will like those projects!
---

# h1 Heading 8-)

## h2 Heading

### h3 Heading

#### h4 Heading

##### h5 Heading

###### h6 Heading

## Horizontal Rules

---

---

---

## Typographic replacements

Enable typographer option to see result.

(c) (C) (r) (R) (tm) (TM) (p) (P) +-

test.. test... test..... test?..... test!....

!!! ??? , -- ---

We should be using \-\- to make use of a dash like -- instead of \-

"Smartypants, double quotes" and 'single quotes'

## Emphasis

**This is bold text**

**This is bold text**

_This is italic text_

_This is italic text_

~~Strikethrough~~

## Blockquotes

> Blockquotes can also be nested...
>
> > ...by using additional greater-than signs right next to each other...
> >
> > > ...or with spaces between arrows.

## Lists

Unordered

- Create a list by starting a line with `+`, `-`, or `*`
- Sub-lists are made by indenting 2 spaces:
  - Marker character change forces new list start:
    - Ac tristique libero volutpat at
    * Facilisis in pretium nisl aliquet
    - Nulla volutpat aliquam velit
- Very easy!

- Create list:
  - This is part of the list
  - This is also part of the list
  - This is also part of the list
  - This is also part of the list

Ordered

1. Lorem ipsum dolor sit amet
2. Consectetur adipiscing elit
3. Integer molestie lorem at massa
4. You can use sequential numbers...
5. ...or keep all the numbers as `1.`

Start numbering with offset:

3. foo
4. bar

Know you actually can start from an offset with pandoc.
But the down fall of pandoc is that is very large compared
to something like markdowna and it is reflected in how long it
takes to acutally convert all of the files into html

## Code

Inline `code`

Indented code

    // Some comments
    line 1 of code
    line 2 of code
    line 3 of code

Block code "fences"

```
Sample text here...
```

Syntax highlighting

```js
var foo = function (bar) {
  return bar++;
};
// This will be the longest comment I will ever write in my life I'm telling you it is definitely the longest.
console.log(foo(5));
```

```c
void
main(int argc, char **argv)
{
  return 0;
}
```

## Tables

| Option | Description                                                               |
| :----- | :------------------------------------------------------------------------ |
| data   | path to data files to supply the data that will be passed into templates. |
| engine | engine to be used for processing templates. Handlebars is the default.    |
| ext    | extension to be used for dest files.                                      |

Right aligned columns

| Option |                                                               Description |
| -----: | ------------------------------------------------------------------------: |
|   data | path to data files to supply the data that will be passed into templates. |
| engine |    engine to be used for processing templates. Handlebars is the default. |
|    ext |                                      extension to be used for dest files. |

## Links

[link text](http://dev.nodeca.com)

[link with title](http://nodeca.github.io/pica/demo/ "title text!")

Autoconverted link https://github.com/nodeca/pica (enable linkify to see)

## Images

![Minion](https://octodex.github.com/images/minion.png)
![Stormtroopocat](https://octodex.github.com/images/stormtroopocat.jpg "The Stormtroopocat")

Like links, Images also have a footnote style syntax

![Alt text][id]

With a reference later in the document defining the URL location:

[id]: https://octodex.github.com/images/dojocat.jpg "The Dojocat"

## Plugins

The killer feature of `markdown-it` is very effective support of

## Superscript

- 19^th^
- H~2~0

### Footnotes

Footnote 1 link[^first].

Footnote 2 link[^second].

Duplicated footnote reference[^second].

You have a footnote refering to more than one reference.

[^first]: Footnote **can have markup**

    and multiple paragraphs.

[^second]: Footnote text.

### [Definition lists](https://github.com/markdown-it/markdown-it-deflist)

Term 1

: Definition 1
with lazy continuation.

Term 2 with _inline markup_

: Definition 2

        { some code, part of Definition 2 }

    Third paragraph of definition 2.

_Compact style:_

Term 1
~ Definition 1

Term 2
~ Definition 2a
~ Definition 2b

This is a compact way of writing definitions meaning they actually take up
less space with regards to the number of spaces they need from the left
margin of the page.

### [Abbreviations](https://github.com/markdown-it/markdown-it-abbr)

This is HTML abbreviation example.

It converts "HTML", but keep intact partial entries like "xxxHTMLyyy" and so on.

\*[HTML]: Hyper Text Markup Language

This really does not work and it is very pointless in my opinion it is really not
going to improve the lives of the writers.

### [Custom containers](https://github.com/markdown-it/markdown-it-container)

::: warning
I ended up removing what was written here because I
ended up pressing undo when I was trying to do something
else. Poof.

But again as I was saying, this feature will be very useful in
making custom properties which the writers can access.
:::

\\[
x = \\frac{a}{b}
\\]
