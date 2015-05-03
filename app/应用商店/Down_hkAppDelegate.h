//
//  Down_hkAppDelegate.h
//  应用商店
//
//  Created by kenny.wang on 13-3-27.
//  Copyright (c) 2013年 王 楚江. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface Down_hkAppDelegate : NSObject <NSApplicationDelegate>{


    NSStatusItem *trayItem;


}

@property (assign) IBOutlet NSWindow *window;

@end
