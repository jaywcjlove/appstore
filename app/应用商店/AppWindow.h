//
//  AppWindow.h
//  应用商店
//
//  Created by kenny.wang on 13-3-27.
//  Copyright (c) 2013年 王 楚江. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppWindow : NSWindow{
    BOOL isDrag;
    CGPoint initialLocation;
}

@end
