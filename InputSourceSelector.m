// An utility to manipulate Input Sources.
// Copyright (c) 2012 ARATA Mizuki
#include <stdio.h>
#include <stdlib.h>
#include <Carbon/Carbon.h>
#include <Foundation/Foundation.h>
int main(int argc, char const * const * argv) {
    id pool = [NSAutoreleasePool new];
    if (argc > 1 && (strcmp(argv[1],"list") == 0
                     || strcmp(argv[1],"list-enabled") == 0)) {
        Boolean listAll = strcmp(argv[1],"list") == 0;
        NSArray *inputSources = [(NSArray *)TISCreateInputSourceList(NULL,listAll) autorelease];
        for (NSObject *inputSource in inputSources) {
            NSString *inputSourceID = TISGetInputSourceProperty((TISInputSourceRef)inputSource, kTISPropertyInputSourceID);
            NSString *localizedName = TISGetInputSourceProperty((TISInputSourceRef)inputSource, kTISPropertyLocalizedName);
            printf("%s (%s)\n",[inputSourceID UTF8String],[localizedName UTF8String]);
        }
    } else if (argc > 1 && (strcmp(argv[1],"current") == 0
                            || strcmp(argv[1],"current-layout") == 0)) {
        TISInputSourceRef inputSource
            = strcmp(argv[1],"current-layout") == 0
                ? TISCopyCurrentKeyboardLayoutInputSource()
                : TISCopyCurrentKeyboardInputSource();
        NSString *inputSourceID = TISGetInputSourceProperty(inputSource, kTISPropertyInputSourceID);
        NSString *localizedName = TISGetInputSourceProperty(inputSource, kTISPropertyLocalizedName);
        printf("%s (%s)\n",[inputSourceID UTF8String],[localizedName UTF8String]);
        CFRelease(inputSource);
    } else if (argc > 2 && (strcmp(argv[1],"enable") == 0
                            || strcmp(argv[1],"disable") == 0
                            || strcmp(argv[1],"select") == 0
                            || strcmp(argv[1],"deselect") == 0)) {
        NSString *inputSourceID = [NSString stringWithUTF8String:argv[2]];
        NSDictionary *properties = [NSDictionary dictionaryWithObject:inputSourceID
                                                               forKey:(NSString *)kTISPropertyInputSourceID];
        NSArray *inputSources = [(NSArray *)TISCreateInputSourceList((CFDictionaryRef)properties, true) autorelease];
        if ([inputSources count] == 0) {
            fprintf(stderr,"Specified input source \"%s\" not found\n", argv[2]);
            [pool release];
            return 1;
        }
        TISInputSourceRef inputSource = (TISInputSourceRef)[inputSources objectAtIndex:0];
        if (strcmp(argv[1],"enable") == 0) {
            TISEnableInputSource(inputSource);
        } else if (strcmp(argv[1],"disable") == 0) {
            TISDisableInputSource(inputSource);
        } else if (strcmp(argv[1],"select") == 0) {
            TISSelectInputSource(inputSource);
        } else if (strcmp(argv[1],"deselect") == 0) {
            TISDeselectInputSource(inputSource);
        }
    } else {
        const char usage[]
          = "Usage:\n"
            "   %s [command]\n\n"
            "Available commands:\n"
            "   list                        Lists currently installed input sources.\n"
            "   list-enabled                Lists currently enabled input sources.\n"
            "   current                     Prints currently selected input source.\n"
            "   current-layout              Prints currently used keyboard layout.\n"
            "   enable [input source ID]    Enables specified input source.\n"
            "   disable [input source ID]   Disables specified input source.\n"
            "   select [input source ID]    Selects specified input source.\n"
            "   deselect [input source ID]  Deselects specified input source.\n";
        fprintf(stderr,usage,argv[0]);
    }
    [pool release];
    return 0;
}
