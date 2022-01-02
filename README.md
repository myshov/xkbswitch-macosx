

Note: xkbswitch-macosx original code is garbarge, there is 
https://github.com/minoki/InputSourceSelector earlier and better, so i modify
it's code to compatible with xkbswitch's api

# Xkbswitch-macosx

Console keyboard layout switcher for Mac OS X.

The utility for switching current layout in terminal. You can use it whenever you need
support Apple Silicon

## Vim integration
For integration with vim-xkbswitch you need to install this [library](https://github.com/myshov/libxkbswitch-macosx) and follow instructions from there.

`make`

## Usage

```
> xkbswitch -l
com.apple.keylayout.ABC
im.rime.inputmethod.Squirrel.Rime

> xkbswitch -g
com.apple.keylayout.ABC

> xkbswitch -s im.rime.inputmethod.Squirrel.Rime
```

## Vim integration

1. [vim-barbaric](https://github.com/rlue/vim-barbaric)
2. [vim-xkbswitch](https://github.com/lyokha/vim-xkbswitch)

## Installation

see [Release](https://github.com/xiehuc/xkbswitch-macosx/releases) Page

## License
The MIT License (MIT)

Copyright (c) 2015 Alexander Myshov

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

