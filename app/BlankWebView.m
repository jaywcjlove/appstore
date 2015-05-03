//
//  BlankWebView.m
//  应用商店
//
//  Created by kacper.wang on 14-9-4.
//  Copyright (c) 2014年 王 楚江. All rights reserved.
//

#import "BlankWebView.h"
#import "Down_hkAppDelegate.h"

@implementation BlankWebView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}


-(void)awakeFromNib{
    
//    WebView *webViews = [(AppWindow *)self.superview.window webView];
    
    NSWindow * window = [(Down_hkAppDelegate *)self.superview.window self ];
    
    NSLog(@"001关于我们");
    
//    
//    WebView *baiWeb = [[WebView alloc] initWithFrame:NSMakeRect(0, 0, window.self.frame.size.width, window.self.frame.size.height)];
//    [baiWeb setMainFrameURL:@"http://www.baidu.com"];
//    [window setContentView:baiWeb];

}

@end
