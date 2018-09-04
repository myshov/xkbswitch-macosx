//
//  xkbswitch.h
//  xkbswitch
//
//  Created by Ilya Arkhanhelsky on 3/24/18.
//  Copyright © 2018 Alexander Myshov. All rights reserved.
//

#ifndef xkbswitch_h
#define xkbswitch_h

const char* Xkb_Switch_setXkbLayout( const char * param );
int Xkb_Switch_setXkbLayoutAsNum(int id);
int Xkb_Switch_setXkbLayoutAsString( const char* name );

char * Xkb_Switch_getXkbLayout( const char * param );
int Xkb_Switch_getXkbLayoutAsNum();
char * Xkb_Switch_getXkbLayoutAsString();

#endif /* xkbswitch_h */
