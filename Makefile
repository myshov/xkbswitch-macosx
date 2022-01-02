all: xkbswitch

xkbswitch: xkbswitch.m
	gcc -o $@ -Wall $< -framework Carbon -framework Foundation
