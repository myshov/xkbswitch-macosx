#Xkbswitch

Console keyboard layout switcher for Mac OS X

##Usage: 
xkbswitch -g|s [-n|e] [value]
where
-g - get mode
-s - set mode
-n - setting and getting with numeric mode (default)
-e - setting and getting with string mode
-l - list all available keyboard layouts (their names)

##Examples:
####setting:
$ ./xkbswitch -se RussianWin
$ ./xkbswitch -se US
$ ./xkbswitch -s 2
$ ./xkbswitch -s 1

####getting:
$ ./xkbswitch -ge 
$ ./xkbswitch -g

##License
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
