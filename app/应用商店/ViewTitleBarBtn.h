//
//  ViewTitleBarBtn.h
//  应用商店
//
//  Created by kenny.wang on 13-3-28.
//  Copyright (c) 2013年 王 楚江. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface ViewTitleBarBtn : NSView{
    CGFloat th;
}

@property(nonatomic,strong) NSImage *rolloverImage;
@property(nonatomic,strong) NSView  *aboutView;


-(void)composeInterface:(NSView *)view windowWidth:(CGFloat)width windowHeight:(CGFloat)height;
-(void)frameSkinTheme:(NSWindow *)window;


-(void)openURL:(NSString *)urlString webView:(WebView *)webView;


@end
