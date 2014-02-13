# Vim Info

Here's the reference for the things I've done to vim, including what plugins are in here.

## Gundo

[Gundo](http://sjl.bitbucket.org/gundo.vim/) visually displays the undo history of vim. I have this bound to F8, but that can be changed in the vimrc file.

## Fugitive

[Fugitive](https://github.com/tpope/vim-fugitive) adds easy access to git commands like status, diff, etc. Below are some of the commands.

1. :Gdiff to bring up the staged version of the file side by side with the working tree version
2. :Gedit (and :Gsplit, :Gvsplit, :Gtabedit, ...) Edit a file in the index and write to it to stage the changes
3. :Gstatus Bring up the output of git status
4. :Gcommit Do a commit
5. :Gblame

## Surround

[Surround](https://github.com/tpope/vim-surround) enables easily changing quotes or tags that are surrounding where the cursor is.

    cs"'      to replace double quotes with a single quote
    cs'<q>    replace single quotes with <q></q> tags
    cst"      replace tags with double "
    cst<p>    replace the current tags with <p></p> tags
    ds"       delete the double quotes

    ysiw]     wrap a word in [] without spaces: [hello]
    ysiw[     wrap a word in [] but with spaces in it: [ hello ]
    yss)      wrap the whole line in ()

## Python

These plugins are helpful for python development.

### PyDoc

[PyDoc](https://github.com/fs111/pydoc.vim) brings up the pydoc for a python module

    :Pydoc sys

### PyFlakes

[PyFlakes](https://github.com/mitechie/pyflakes-pathogen) does the linting for python. It'll highlight unused imports and other fun errors.
