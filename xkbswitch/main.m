// Xkbswitch - console keyboard layout switcher for Mac OS X
//
// The MIT License (MIT)
//
// Copyright (c) 2015 Alexander Myshov
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.


#import <Foundation/Foundation.h>
#import <Carbon/Carbon.h>
#import "xkbswitch.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *layouts = [[NSArray alloc] initWithObjects:
                            @"2SetHangul",
                            @"390Hangul",
                            @"3SetHangul",
                            @"AfghanDari",
                            @"AfghanPashto",
                            @"AfghanUzbek",
                            @"Anjal",
                            @"Arabic",
                            @"Arabic-QWERTY",
                            @"ArabicPC",
                            @"Armenian-HMQWERTY",
                            @"Armenian-WesternQWERTY",
                            @"Australian",
                            @"Austrian",
                            @"Azeri",
                            @"Bangla",
                            @"Bangla-QWERTY",
                            @"Belgian",
                            @"Brazilian",
                            @"British",
                            @"British-PC",
                            @"Bulgarian",
                            @"Bulgarian-Phonetic",
                            @"Byelorussian",
                            @"Canadian",
                            @"Canadian-CSA",
                            @"CangjieKeyboard",
                            @"Cherokee-Nation",
                            @"Cherokee-QWERTY",
                            @"Colemak",
                            @"Croatian",
                            @"Croatian-PC",
                            @"Czech",
                            @"Czech-QWERTY",
                            @"DVORAK-QWERTYCMD",
                            @"Danish",
                            @"Devanagari",
                            @"Devanagari-QWERTY",
                            @"Dutch",
                            @"Dvorak",
                            @"Dvorak-Left",
                            @"Dvorak-Right",
                            @"Estonian",
                            @"Faroese",
                            @"Finnish",
                            @"FinnishExtended",
                            @"FinnishSami-PC",
                            @"French",
                            @"French-numerical",
                            @"GJCRomaja",
                            @"Georgian-QWERTY",
                            @"German",
                            @"Greek",
                            @"GreekPolytonic",
                            @"Gujarati",
                            @"Gujarati-QWERTY",
                            @"Gurmukhi",
                            @"Gurmukhi-QWERTY",
                            @"HNCRomaja",
                            @"Hawaiian",
                            @"Hebrew",
                            @"Hebrew-PC",
                            @"Hebrew-QWERTY",
                            @"Hungarian",
                            @"Icelandic",
                            @"Inuktitut-Nunavut",
                            @"Inuktitut-Nutaaq",
                            @"Inuktitut-QWERTY",
                            @"InuttitutNunavik",
                            @"Irish",
                            @"IrishExtended",
                            @"Italian",
                            @"Italian-Pro",
                            @"Jawi-QWERTY",
                            @"KANA",
                            @"Kannada",
                            @"Kannada-QWERTY",
                            @"Kazakh",
                            @"Khmer",
                            @"Kurdish-Sorani",
                            @"Latvian",
                            @"Lithuanian",
                            @"Macedonian",
                            @"Malayalam",
                            @"Malayalam-QWERTY",
                            @"Maltese",
                            @"Maori",
                            @"Myanmar-QWERTY",
                            @"Nepali",
                            @"NorthernSami",
                            @"Norwegian",
                            @"NorwegianExtended",
                            @"NorwegianSami-PC",
                            @"Oriya",
                            @"Oriya-QWERTY",
                            @"Persian",
                            @"Persian-ISIRI2901",
                            @"Persian-QWERTY",
                            @"Polish",
                            @"PolishPro",
                            @"Portuguese",
                            @"Romanian",
                            @"Romanian-Standard",
                            @"Russian",
                            @"Russian-Phonetic",
                            @"RussianWin",
                            @"Sami-PC",
                            @"Serbian",
                            @"Serbian-Latin",
                            @"Sinhala",
                            @"Sinhala-QWERTY",
                            @"Slovak",
                            @"Slovak-QWERTY",
                            @"Slovenian",
                            @"Spanish",
                            @"Spanish-ISO",
                            @"Swedish",
                            @"Swedish-Pro",
                            @"SwedishSami-PC",
                            @"SwissFrench",
                            @"SwissGerman",
                            @"Tamil99",
                            @"Telugu",
                            @"Telugu-QWERTY",
                            @"Thai",
                            @"Thai-PattaChote",
                            @"Tibetan-QWERTY",
                            @"Tibetan-Wylie",
                            @"TibetanOtaniUS",
                            @"Turkish",
                            @"Turkish-QWERTY",
                            @"Turkish-QWERTY-PC",
                            @"US",
                            @"USExtended",
                            @"USInternational-PC",
                            @"Ukrainian",
                            @"UnicodeHexInput",
                            @"Urdu",
                            @"Uyghur",
                            @"Vietnamese",
                            @"Welsh",
                            @"WubihuaKeyboard",
                            @"WubixingKeyboard",
                            @"ZhuyinBopomofo",
                            @"ZhuyinEten",
                            nil];
        
        int c;
        int argc_init = argc;
        int layout_by_name = 0;
        int layout_by_num = 1;
        int set_mode = 0;
        int get_mode = 0;
        
        while (--argc > 0 && (*++argv)[0] == '-') {
            while ((c = *++argv[0])) {
                switch (c) {
                    case 's':
                        set_mode = 1;
                        break;
                    case 'g':
                        get_mode = 1;
                        break;
                    case 'n':
                        layout_by_num = 1;
                        break;
                    case 'e':
                        layout_by_name = 1;
                        break;
                    case 'l':
                        for (int i = 0; i < [layouts count]; i++) {
                            printf("%s\n", [layouts[i] UTF8String]);
                        }
                        break;
                    default:
                        printf("xkbswitch: illegal option %c\n", c);
                        argc = 0;
                        break;
                }
            }
        }
        
        // if there was no options show help
        if (argc_init == 1) {
            printf("Usage: xkbswitch -g|s [-n|e] [value]\n"
                   "-g get mode\n"
                   "-s set mode\n"
                   "-n setting and getting by numeric mode (default)\n"
                   "-e setting and getting by string mode\n"
                   "-l list all available layouts (their names)\n");
            exit(0);
        }
        
        if (get_mode) {
            if (layout_by_name) {
                char * value = Xkb_Switch_getXkbLayoutAsString();
                printf("%s\n", value);
                free(value);
            } else if (layout_by_num) {
                int value = Xkb_Switch_getXkbLayoutAsNum();
                printf("%d\n", value);
            }
        } else if (set_mode) {
            if (layout_by_name) {
                int result = Xkb_Switch_setXkbLayoutAsString(*argv);
                return result;
            } else if (layout_by_num) {
                // Get the first argument. It is index of wanted keyboard layout
                int wantedSourceIndex = atoi(*argv);
                int result = Xkb_Switch_setXkbLayoutAsNum(wantedSourceIndex);
                return result;
            }
        }
    }
    return 0;
}
