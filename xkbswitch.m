
#include <stdio.h>
#include <stdlib.h>
#include <Carbon/Carbon.h>
#include <Foundation/Foundation.h>

enum mode { get, set, list};

void usage(char* name) {
  printf("Usage: %s -g|s|l [-n|e] [value]\n"
      "-g get mode\n"
      "-s set mode\n"
      "-n setting and getting by id mode (default)\n"
      "-e setting and getting by string mode\n"
      "-l list all available layouts (their names)\n", name);
}

int main(int argc, char *argv[]) {
  id pool = [NSAutoreleasePool new];

  if (argc == 1) {
    usage(argv[0]);
    [pool release];
    return 1;
  }

  int c;
  enum mode m = get;
  CFStringRef by = kTISPropertyInputSourceID; // source id

  while (--argc > 0 && (*++argv)[0] == '-') {
    while ((c = *++argv[0])) {
      switch (c) {
        case 'g': m = get; break;
        case 's': m = set; break;
        case 'l': m = list; break;
        case 'n': by = kTISPropertyInputSourceID; break;
        case 'e': by = kTISPropertyLocalizedName; break;
        case 'h':
        case '?':
        default:
          usage(argv[0]);
          [pool release];
          return 1;
      }
    }
  }
  const char* aim = argv[0];


  if (m == list) {
    NSArray *inputSources = [(NSArray *)TISCreateInputSourceList(NULL, 0) autorelease];
    for (NSObject *inputSource in inputSources) {
      NSString *prop = TISGetInputSourceProperty((TISInputSourceRef)inputSource, by);
      printf("%s\n",[prop UTF8String]);
    }
  } else if (m == get) {
    TISInputSourceRef inputSource = TISCopyCurrentKeyboardInputSource();
    NSString *prop = TISGetInputSourceProperty(inputSource, by);
    printf("%s\n",[prop UTF8String]);
    CFRelease(inputSource);
  } else if (m == set) {
    if (by == kTISPropertyLocalizedName) {
      fprintf(stderr, "not support set by name, please use -n\n");
      return 1;
    }
    NSString *inputSourceID = [NSString stringWithUTF8String:aim];
    NSDictionary *properties = [NSDictionary dictionaryWithObject:inputSourceID
                                                           forKey:(NSString *)kTISPropertyInputSourceID];
    NSArray *inputSources = [(NSArray *)TISCreateInputSourceList((CFDictionaryRef)properties, true) autorelease];
    if ([inputSources count] == 0) {
      fprintf(stderr,"Specified input source \"%s\" not found\n", aim);
      [pool release];
      return 1;
    }
    TISInputSourceRef inputSource = (TISInputSourceRef)[inputSources objectAtIndex:0];
    TISSelectInputSource(inputSource);
  }

  [pool release];
  return 0;
}

