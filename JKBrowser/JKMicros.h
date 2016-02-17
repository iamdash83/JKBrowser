//
//  JKMicros.h
//  JKBrowser
//
//  Created by renjinkui on 16/2/17.
//  Copyright © 2016年 renjinkui. All rights reserved.
//

#ifndef JKMicros_h

#ifdef DEBUG
#define JKDBG(...) NSLog(__VA_ARGS__)
#else
#define JKDBG(...)
#endif

#define alert(msg) do {\
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];\
    [alert show];\
}while(0)


#endif /* JKMicros_h */
