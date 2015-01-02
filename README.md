#Xkbswitch-macosx

Console keyboard layout switcher for Mac OS X

##Usage: 
xkbswitch -g|s [-n|e] [value]<br/>
where<br/>
-g - get mode<br/>
-s - set mode<br/>
-n - setting and getting with numeric mode (default)<br/>
-e - setting and getting with string mode<br/>
-l - list all available keyboard layouts (their names)<br/>

##Examples:
####setting:
$ ./xkbswitch -se RussianWin<br/>
$ ./xkbswitch -se US<br/>
$ ./xkbswitch -s 2<br/>
$ ./xkbswitch -s 1<br/>

####getting:
$ ./xkbswitch -ge <br/>
$ ./xkbswitch -g<br/>

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
