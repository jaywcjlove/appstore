//
//  ButtonController.m
//  应用商店
//
//  Created by kenny.wang on 13-3-29.
//  Copyright (c) 2013年 王 楚江. All rights reserved.
//

#import "ButtonController.h"
#import "AppWindow.h"
#import "ViewTitleBarBtn.h"

@implementation ButtonController


@synthesize aboutView,activeImage;

- (id)initWithFrame:(NSRect)frame
{
    NSLog(@"123123123123呀呀呀呀呀呀呀呀呀呀呀呀呀");
    self = [super initWithFrame:frame];
    if (self) {
        
        //NSLog(@"%ld  NNNN",(long)self.tag);
        NSLog(@"ss%@",self);

        animations=true;
        sheetPanel=true;
        
//      Initialization code here
//      [self setButtonType:NSMomentaryChangeButton];
//      [self.cell setHighlightsBy:NSContentsCellMask];
//      [self setBezelStyle:NSBezelBorder];
        
        
    }
    
    return self;
}


- (void)updateTrackingAreas {
    [super updateTrackingAreas];
    //响应mouseEnter
    NSTrackingArea * trackArea = [[NSTrackingArea alloc] initWithRect:NSInsetRect(self.bounds, -4, -4)
                                                              options:NSTrackingMouseEnteredAndExited  | NSTrackingActiveAlways
                                                                owner:self
                                                             userInfo:nil];
    [self addTrackingArea:trackArea];
    
//    
//    if (self.tag == 4) {
//        NSButton *button = (NSButton *)self;
//        [button setImage:[NSImage imageNamed:@"menuBtnHover"]];
//    }
    
}

//- (void)viewDidEndLiveResize {
//    NSLog(@"adfasdf1111");
//    [super viewDidEndLiveResize];
//}

-(void)mouseEntered:(NSEvent *)theEvent{
    switch (self.tag) {
        case 1:
            [self setImage:[NSImage imageNamed:@"aboutHover"]];
            break;
        case 2:
            [self setImage:[NSImage imageNamed:@"maxhover"]];
            break;
        case 3:
            [self setImage:[NSImage imageNamed:@"closeHover"]];
            break;
        default:
            break;
    }
    
}


-(void)mouseDown:(NSEvent *)theEvent{
    switch (self.tag) {
        case 1:
            [self setImage:[NSImage imageNamed:@"aboutDown"]];
            break;
        case 2:
            [self setImage:[NSImage imageNamed:@"maxDown"]];
            break;
        case 3:
            [self setImage:[NSImage imageNamed:@"closeDown"]];
            break;
        default:
            break;
    }
}

-(void)animation:(id)sender{
    
    NSMutableArray *theAnimItemsContent = [NSMutableArray array];
    NSView *view=self.aboutView.aboutView;
    NSDictionary *itemAnim;
    
    
    if (animations==true){
        //每一个子元素的动画
        itemAnim = [NSDictionary dictionaryWithObjectsAndKeys:
                                  view,NSViewAnimationTargetKey,
                                  [NSValue valueWithRect:NSMakeRect(6, 6, [view bounds].size.width, [view bounds].size.height)],NSViewAnimationEndFrameKey,nil];
        [theAnimItemsContent addObject:itemAnim];
        animations=false;
    }else{
        //每一个子元素的动画
        itemAnim = [NSDictionary dictionaryWithObjectsAndKeys:
                    view,NSViewAnimationTargetKey,
                    [NSValue valueWithRect:NSMakeRect(6, [view bounds].size.height+50, [view bounds].size.width, [view bounds].size.height)],NSViewAnimationEndFrameKey,nil];
        [theAnimItemsContent addObject:itemAnim];
        animations=true;
    }
    
    NSViewAnimation *anim = [[NSViewAnimation alloc] initWithViewAnimations:theAnimItemsContent];
    [anim setDelegate:self];
    [anim setDuration:0.3];
    [anim startAnimation];
}
-(void)mouseUp:(NSEvent *)theEvent{
    
    switch (self.tag) {
        case 1:
            [self setImage:[NSImage imageNamed:@"aboutHover"]];
            NSLog(@"001关于我们");
            [self animation:self];
            
            
//            NSString *resourcesPath = [[NSBundle mainBundle] resourcePath];
//            NSString *htmlPath = [resourcesPath stringByAppendingFormat:@"/error/index.html"];
//            [[webView mainFrame] loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:htmlPath]]];
            
            
            break;
        case 2:
            [self setImage:[NSImage imageNamed:@"maxhover"]];
            //NSLog(@"最大化");
            [self changeWindowSize];
            
            break;
        case 3:
            [self setImage:[NSImage imageNamed:@"closeHover"]];
            //[NSApp hide:theEvent];
            [NSApp terminate:theEvent];
            break;
        case 4:
            //[self setImage:[NSImage imageNamed:@"menuBtnHover"]];
            
            break;
        default:
            break;
    }
    
    if (9<=(long)self.tag<=4) {
        NSLog(@"%ld 点中当前按钮 number",(long)self.tag);
        [self menuShowEvent];
    }
}

-(void)mouseExited:(NSEvent *)theEvent{
    switch (self.tag) {
        case 1:
            [self setImage:[NSImage imageNamed:@"about"]];
            break;
        case 2:
            [self setImage:[NSImage imageNamed:@"max"]];
            break;
        case 3:
            [self setImage:[NSImage imageNamed:@"close"]];
            break;
        default:
            break;
    }
}
-(void)mouseDragged:(NSEvent *)theEvent{
    NSLog(@"12222");
}

-(void)changeWindowSize{
    NSLog(@"changeWindowSize");
    
//    
//    NSRect screenRect;
//    NSArray *screenArray = [NSScreen screens];
//    NSUInteger screenCount =[screenArray count];
//    unsigned index = 0;

}


-(void)menuShowEvent{
    
    NSButton *button = (NSButton *)self;
    //NSColor *color;
    //NSLog(@"%ldlasdfasd",(long)self.tag);
    
    if (self.tag>3&&self.tag<10) {
        for (int i = 4; i <= 9; i++){
            if (self.tag != i){
                NSLog(@"日日日日%ld",(long)self.tag);
                button =[[self.window contentView] viewWithTag:i];
                [button setImage:[NSImage imageNamed:@"menuBtn"]];
                
                //            NSColor *color=[NSColor colorWithCalibratedRed:0.2118 green:0.2353 blue:0.4157 alpha:1.0f];
                //            [self setButtonTextColor:button Color:color];
                
            }else{
                NSLog(@"大丰收");
                [self setImage:[NSImage imageNamed:@"menuBtnHover"]];
            }
        }
    }
}
-(void)setButtonTextColor:(NSButton *)button Color:(NSColor *)color{
    NSLog(@"4444");
    NSMutableParagraphStyle *ps = [[[NSMutableParagraphStyle alloc] init] autorelease];
    [ps setAlignment:NSCenterTextAlignment];
    NSDictionary *textDictionary=[NSDictionary dictionaryWithObjectsAndKeys:color,NSForegroundColorAttributeName,ps,NSParagraphStyleAttributeName, nil];
    NSMutableAttributedString *buttonString = [[[NSMutableAttributedString alloc] initWithString:self.title attributes:textDictionary] autorelease];
    [self setAttributedTitle:buttonString];
}


-(void)createAboutWindow:(id)sender{//生成窗口
    NSLog(@"111111");
    NSWindow *window=[[NSWindow alloc] initWithContentRect:NSMakeRect(0, 0, 500, 140)
                                                 styleMask:NSTitledWindowMask|NSClosableWindowMask
                                                   backing:NSBackingStoreBuffered
                                                     defer:YES];
    [window center];
    [window setTitle:@"Window 3"];
    NSWindowController *wc=[[NSWindowController alloc] initWithWindow:window];
    [wc showWindow:sender];
    [wc.window center];
    [window release];
    
    
//    NSWindow * windows=[[NSWindow alloc] initWithContentRect:NSMakeRect(0, 0, 190, 110)
//                                                 styleMask:NSTitledWindowMask|NSClosableWindowMask
//                                                   backing:NSBackingStoreBuffered
//                                                     defer:YES];
//    [windows center];
//    [windows setTitle:@"Window 4"];
//    [windows orderFront:sender];

    
}

-(void)quitApp:(id)sender{
    NSLog(@"2222");

}

-(void)buttonTaped:(NSButton *)button{
    NSLog(@"3333");

}

@end
