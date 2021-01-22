# Welcome

Welcome to your wiki! This is the default page we've installed for your convenience. Go ahead and edit it.

## Wiki features

This wiki uses the [Markdown](http://daringfireball.net/projects/markdown/) syntax. The [Mastering Markdown tutorial](https://guides.github.com/features/mastering-markdown/) shows how various elements are rendered.

The wiki itself is actually a git repository, which means you can clone it, edit it locally/offline, add images or any other file type, and push it back to us. It will be live immediately.

Go ahead and try:

```
$ git clone git@github.com:cmelab/getting-started.git
```

Wiki pages are normal files, with the .md extension. You can edit and create pages locally.

## Syntax highlighting

You can also highlight snippets of text (we use the excellent [Pygments](http://pygments.org/) library).

```python

def wiki_rocks(text):
    formatter = lambda t: "funky"+t
    return formatter(text)
```

You can check out the source of this page to see how that's done, and make sure to bookmark [the vast library of Pygment lexers](http://pygments.org/docs/lexers/) we accept the 'short name' or the 'mimetype' of anything in there.

Have fun!
