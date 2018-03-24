//
//  xkbswitch.m
//  xkbswitch
//
//  Created by Ilya Arkhanhelsky on 3/24/18.
//  Copyright © 2018 Alexander Myshov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Carbon/Carbon.h>

OSStatus set_by_name(const char* name, const NSString* prefix) {
    NSString *macosx_layout_name;
    macosx_layout_name = [prefix stringByAppendingString:[NSString stringWithUTF8String:name]];
    NSArray* sources = CFBridgingRelease(TISCreateInputSourceList((__bridge CFDictionaryRef)@{ (__bridge NSString*)kTISPropertyInputSourceID :  macosx_layout_name}, FALSE));
    TISInputSourceRef source = (__bridge TISInputSourceRef)sources[0];
    OSStatus status = TISSelectInputSource(source);
    return status;
}

int Xkb_Switch_setXkbLayoutAsString( const char* name ) {
    OSStatus status = set_by_name(name, @"com.apple.keylayout.");
    if (status != noErr) {
        printf("There is no active layout with name in the default prefix \"%s\"\n", name);
        printf("Trying with the org.unknown.keylayout prefix...\n");
        status = set_by_name(name, @"org.unknown.keylayout.");
        if (status != noErr) {
            printf("Unable to find an active layout with this name.\n");
            return 1;
        }
    }
    return 0;
}

int Xkb_Switch_setXkbLayoutAsNum(int id) {
    // Get enabled keyboard layouts list
    CFArrayRef sourceList = (CFArrayRef) TISCreateInputSourceList (NULL, false);
    // Get wanted keyboard layout by index
    TISInputSourceRef wantedSource = (TISInputSourceRef) CFArrayGetValueAtIndex(sourceList, id);
    
    // If a keyboard layout with the index does not exist
    if (!wantedSource) {
        printf("%d", -1);
        return 1;
    }
    
    // Switch to wanted keyboard layout
    TISSelectInputSource(wantedSource);
    
    return 0;
}

const char * Xkb_Switch_setXkbLayout( const char * param ) {
    // This function is implemented to keep backward compatibility
    char* arguments = malloc(sizeof(param));
    strcpy(arguments, param);
    bool asNum = true; // Use numeric mode by default
    // Expect no more than 2 arguments in param line:
    // - optional option key -n / -e
    // - value
    char* token = strtok(arguments, " ");
    if (strcmp("-n", token) == 0) {
        strtok(NULL, " "); // go to next token
    } else if (strcmp("-e", token) == 0) {
        asNum = false;
        strtok(NULL, " "); // go to next token
    }
    
    int result;
    if (asNum) {
        result = Xkb_Switch_setXkbLayoutAsNum(atoi(token));
    } else {
        result = Xkb_Switch_setXkbLayoutAsString(token);
    }
    
    free(arguments);
    return result == 0 ? "0" : "1";
}

int Xkb_Switch_getXkbLayoutAsNum()
{
    // Get enabled keyboard layouts list
    CFArrayRef sourceList = (CFArrayRef) TISCreateInputSourceList (NULL, false);
    // Get current keyborad layout
    TISInputSourceRef currentSource =  TISCopyCurrentKeyboardInputSource();
    long sourceCount = CFArrayGetCount(sourceList);
    // Search an index of the keyboard layout
    for (int i = 0; i < sourceCount; i++)
        // If the index is found
        if (TISGetInputSourceProperty((TISInputSourceRef) CFArrayGetValueAtIndex(sourceList, i), kTISPropertyLocalizedName) == TISGetInputSourceProperty(currentSource, kTISPropertyLocalizedName)) {
            return i;
        }
    return -1;
}

const char * Xkb_Switch_getXkbLayoutAsString()
{
    char* result = malloc(128);
    // get current keyboard layout by name
    TISInputSourceRef current_source = TISCopyCurrentKeyboardInputSource();
    NSString *s = (__bridge NSString *)(TISGetInputSourceProperty(current_source, kTISPropertyInputSourceID));
    // get last part of string (without com.apple.keylayout.)
    NSUInteger last_dot_num = [s rangeOfString:@"." options:NSBackwardsSearch].location;
    NSString *substring = [s substringFromIndex:last_dot_num + 1];
    sprintf(result, "%s", [substring UTF8String]);
    return result;
}

const char * Xkb_Switch_getXkbLayout( const char * param )
{
    // This function is implemented to keep backward compatibility
    char* arguments = malloc(sizeof(param));
    strcpy(arguments, param);
    bool asNum = true; // Use numeric mode by default
    // Expect no more than 1 argument in param line:
    // - optional option key -n / -e
    char* token = strtok(arguments, " ");
    if (token) {
        if (strcmp("-e", token) == 0) {
            asNum = false;
        }
    }
    free(arguments);
    
    int result;
    if (asNum) {
        result = Xkb_Switch_getXkbLayoutAsNum();
        char* str = malloc(16);
        sprintf(str, "%d", result);
        return str;
    } else {
        return Xkb_Switch_getXkbLayoutAsString();
    }
}

