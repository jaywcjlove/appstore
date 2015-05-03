//
//  ViewTitleBarBtn.m
//  应用商店
//
//  Created by kenny.wang on 13-3-28.
//  Copyright (c) 2013年 王 楚江. All rights reserved.
//

#import "ViewTitleBarBtn.h"
#import "ButtonController.h"
#import <WebKit/WebKit.h>

@implementation ViewTitleBarBtn
@synthesize aboutView;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        th=0;//设置默认Titlebar的高度
        
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect{
    // Drawing code here.
    
}

-(void)openURL:(NSString *)urlString webView:(WebView *)webView{
    [webView setMainFrameURL:urlString];
}

-(void)composeInterface:(NSView *)view windowWidth:(CGFloat)width windowHeight:(CGFloat)height{
    
    aboutView = [[NSView alloc]initWithFrame:NSMakeRect(6, height +50, width -12, height -33)];
    [aboutView setAutoresizingMask:NSViewWidthSizable  | NSViewHeightSizable];
    [aboutView setHidden:NO];
    [aboutView setWantsLayer:YES];
    aboutView.layer.backgroundColor = [[NSColor yellowColor] CGColor];
    //aboutView.layer.backgroundColor=[[NSColor colorWithCalibratedRed:0.9137 green:0.9490 blue:0.9961 alpha:1.0f] CGColor];
    [view addSubview:aboutView];
    
    
    
    
    
    
    NSView *viewGo =[[NSView alloc]initWithFrame:CGRectMake(width-49 , height -th -19, 100, 100)];
    viewGo.autoresizesSubviews = YES;
    viewGo.autoresizingMask = NSViewMinXMargin | NSViewMinYMargin;
    [view addSubview:viewGo];
    
    
    for (int i=0; i<3; i++) {
        ButtonController *btnClose=[[ButtonController alloc]initWithFrame:CGRectMake(i*15 , 0, 14, 14)];
        switch (i) {
            case 0:
                [btnClose setImage:[NSImage imageNamed:@"about"]];
                [btnClose setAlternateImage:[NSImage imageNamed:@"aboutDown"]];
                [btnClose setTag:1];
                //[btnClose.aboutView setHidden:NO];
                btnClose.aboutView  = self;
                break;
            case 1:
                [btnClose setImage:[NSImage imageNamed:@"max"]];
                [btnClose setAlternateImage:[NSImage imageNamed:@"maxDown"]];
                [btnClose setTag:2];
                
                NSLog(@"max Down");
                break;
            case 2:
                [btnClose setImage:[NSImage imageNamed:@"close"]];
                [btnClose setAlternateImage:[NSImage imageNamed:@"closeDown"]];
                [btnClose setTag:3];
                break;
            default:
                break;
        }
        [[btnClose cell] setHighlightsBy:NSContentsCellMask];
        [btnClose setBordered:NO];
        [viewGo addSubview:btnClose];
    }
    
    
    
}



-(void)frameSkinTheme:(NSWindow *)window{
    
    CGFloat w=window.frame.size.width;
    CGFloat h=window.frame.size.height;
    
    NSView *view=[[NSView alloc]initWithFrame:CGRectMake(0, 0,w, h)];
    [window setContentView:view];
    for (int i=0; i<9; i++) {
        NSImageView *imgTl = [[NSImageView alloc]init];
        switch (i) {
            case 0:
                [imgTl setFrame:CGRectMake(0, h-54-th,12 , 54)];
                [imgTl setImage:[NSImage imageNamed:@"frameTopLeft"]];
                imgTl.autoresizingMask    = NSViewMinYMargin;
                [imgTl setImageAlignment:NSImageAlignTopLeft];
                break;
            case 1:
                [imgTl setFrame:CGRectMake(12, h-54-th, w-24, 54)];
                [imgTl setImage:[NSImage imageNamed:@"frameTopCenter"]];
                imgTl.autoresizingMask    = NSViewWidthSizable | NSViewMinYMargin;
                [imgTl setImageScaling:NSImageScaleAxesIndependently];
                break;
            case 2:
                [imgTl setFrame:CGRectMake(w-12, h-54-th, 12, 54)];
                [imgTl setImage:[NSImage imageNamed:@"frameTopRight"]];
                imgTl.autoresizingMask    = NSViewMinXMargin | NSViewMinYMargin;
                [imgTl setImageScaling:NSImageAlignTopRight];
                break;
            case 3:
                [imgTl setFrame:CGRectMake(0,6, 6, h-54-th-6)];
                [imgTl setImage:[NSImage imageNamed:@"frameCenterLeft"]];
                imgTl.autoresizingMask    = NSViewHeightSizable;
                [imgTl setImageScaling:NSImageScaleAxesIndependently];
                break;
            case 4:
                [imgTl setFrame:CGRectMake(w-6, 6, 6, h-54-th-6)];
                [imgTl setImage:[NSImage imageNamed:@"frameCenterRight"]];
                imgTl.autoresizingMask    = NSViewMinXMargin | NSViewHeightSizable;
                [imgTl setImageScaling:NSImageScaleAxesIndependently];
                break;
            case 5:
                [imgTl setFrame:CGRectMake(0, 0, 6, 6)];
                [imgTl setImage:[NSImage imageNamed:@"frameButtomLeft"]];
                imgTl.autoresizingMask    = NSViewMaxYMargin;
                break;
            case 6:
                [imgTl setFrame:CGRectMake(6, 0, w-12, 6)];
                [imgTl setImage:[NSImage imageNamed:@"frameButtomCenter"]];
                imgTl.autoresizingMask    = NSViewWidthSizable;
                [imgTl setImageScaling:NSImageScaleAxesIndependently];
                break;
            case 7:
                [imgTl setFrame:CGRectMake(w-6, 0, 6, 6)];
                [imgTl setImage:[NSImage imageNamed:@"frameButtomRight"]];
                imgTl.autoresizingMask    = NSViewMinXMargin;
                [imgTl setImageScaling:NSImageScaleAxesIndependently];
                break;
            case 8:
                [imgTl setFrame:CGRectMake(6, 6, w-12, h-54-th-6)];
                [imgTl setImage:[NSImage imageNamed:@"frameCC"]];
                imgTl.autoresizingMask    =  NSViewHeightSizable | NSViewWidthSizable;
                [imgTl setImageScaling:NSImageScaleAxesIndependently];
                break;
            default:
                break;
        }
        imgTl.autoresizesSubviews = YES;
        [view addSubview:imgTl];
    }
    
    
    
    WebView *baiWeb = [[WebView alloc] initWithFrame:NSMakeRect(6, 6, w-12, h-54-th-6)];
    [baiWeb setMainFrameURL:@"http://www.baidu.com"];
    baiWeb.autoresizingMask = NSViewHeightSizable | NSViewWidthSizable;
    [view addSubview:baiWeb];
    
    
    
    
    NSTextField *textField=[[NSTextField alloc]initWithFrame:CGRectMake(6, h-52-th, w-12, 25)];
    textField.autoresizesSubviews = YES;
    textField.autoresizingMask = NSViewWidthSizable | NSViewMinYMargin;
    [textField setDrawsBackground:NO];
    [textField setBordered:NO];
    
    [self navigationMenu:view windowWidth:w windowHeight:h];
    
    [self composeInterface:view windowWidth:w windowHeight:h];
}
- (float) titleBarHeight{//计算titleBar的高度
    NSLog(@"1232");
    NSRect frame = NSMakeRect (0, 0, 100, 100);
    NSRect contentRect;
    contentRect = [NSWindow contentRectForFrameRect: frame styleMask: NSTitledWindowMask];
    return (frame.size.height - contentRect.size.height);
}


-(void)navigationMenu:(NSView *)view windowWidth:(CGFloat)width windowHeight:(CGFloat)height{
    
    
    NSView *viewGo =[[NSView alloc]initWithFrame:CGRectMake(11 , height -th -54, width-20, 100)];
    viewGo.autoresizesSubviews = YES;
    viewGo.autoresizingMask =NSViewMaxXMargin | NSViewMinYMargin |NSViewWidthSizable;
    [view addSubview:viewGo];
    
    
    NSTextField *titleName =[[NSTextField alloc]initWithFrame:CGRectMake(0, 29, 111, 23)];
    [titleName setBordered:NO];
    [titleName setEditable:NO];
    [titleName setStringValue:@"应用商店"];
    [titleName setBackgroundColor:[NSColor clearColor]];
    titleName.font = [NSFont boldSystemFontOfSize:14];
    NSColor *rgb = [NSColor colorWithDeviceRed:0.1216 green:0.2314 blue:0.4196 alpha:1];
    titleName.textColor =rgb;
    [viewGo addSubview:titleName];
    
    int i;
    for(i=0;i<6;i++){
        ButtonController *btn01=[[ButtonController alloc]initWithFrame:CGRectMake(i*83, 0, 80, 26)];
        [btn01 setImage:[NSImage imageNamed:@"menuBtn"]];
        
        switch (i) {
            case 0:
                //[btn01.cell setTitle:@"ok"];
                [btn01 setTitle:@"精品推荐"];
                [btn01 setImage:[NSImage imageNamed:@"menuBtnHover"]];
                break;
            case 1:
                [btn01 setTitle:@"热门排行"];
                break;
            case 2:
                [btn01 setTitle:@"软件分类"];
                break;
            case 3:
                [btn01 setTitle:@"装机必备"];
                break;
            case 4:
                [btn01 setTitle:@"论坛"];
                break;
            case 5:
                [btn01 setTitle:@"下载管理"];
                break;
            default:
                break;
        }
        [btn01 setBordered:NO];
        [btn01 setTag:i+4];
        [viewGo addSubview:btn01];
    }
}




@end
