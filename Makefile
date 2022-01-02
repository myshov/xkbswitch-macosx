all: xkbswitch
# https://developer.apple.com/documentation/apple-silicon/building-a-universal-macos-binary

xkbswitch-x86: xkbswitch.m
	$(CC) -o $@ -Wall $< -target x86_64-apple-macos10.9 -framework Carbon -framework Foundation

xkbswitch-arm: xkbswitch.m
	$(CC) -o $@ -Wall $< -target arm64-apple-macos11 -framework Carbon -framework Foundation

xkbswitch: xkbswitch-x86 xkbswitch-arm
	lipo -create -output $@ $^
