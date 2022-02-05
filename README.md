======

Note: xkbswitch-macosx original code is garbarge, there is 
https://github.com/minoki/InputSourceSelector earlier and better, so i modify
it's code to compatible with xkbswitch's api

# Xkbswitch-macosx

Console keyboard layout switcher for Mac OS X.

The utility for switching current layout in terminal. You can use it whenever you need
that functionality (for example, for tmux statusline when one is running in fullscreen
terminal). Also you can use it as auxilary utility for [vim-xkbswitch](https://github.com/lyokha/vim-xkbswitch) plugin for
changing the keyboard layout in Mac&nbsp;OS&nbsp;X. The utility should work on all versions
of Mac OS X since 10.6.

## Vim integration
For integration with vim-xkbswitch you need to install this [library](https://github.com/myshov/libxkbswitch-macosx) and follow instructions from there.

## Installation
For installation put executable file from bin directory in any directory in your $PATH
variable. For example you can put it into  `/usr/local/bin` with this command (if source
files of utility in your `Download` directory):
```shell
$ cp ~/Download/xkbswitch-macosx/bin/xkbswitch /usr/local/bin
```
## Usage:
```
xkbswitch -g|s [-n|e] [value]
where:
-g - get number of layout
-s - set layout by number of list of layouts
-n - code mode (default mode)
-e - string mode (combine it with -g|s to get current layout name or set layouts by its name)
-l - list all available keyboard layouts (their names)
```

## Examples:
#### set layout:
```shell
$ ./xkbswitch -se RussianWin
$ ./xkbswitch -se US
$ ./xkbswitch -s 2
$ ./xkbswitch -s 1
```

#### get current layout:
```shell
$ ./xkbswitch -ge
$ ./xkbswitch -g
```

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

