//
//  AppWindow.m
//  应用商店
//
//  Created by kenny.wang on 13-3-27.
//  Copyright (c) 2013年 王 楚江. All rights reserved.
//

#import "AppWindow.h"

@implementation AppWindow

-(void)awakeFromNib{
    [self setStyleMask:NSResizableWindowMask];//去掉TitleBar
    [self setOpaque:NO];/*窗口透明*/
    [self setBackgroundColor:[NSColor clearColor]];//清除背景颜色
    //[self isAutodisplay];
    
}

//---鼠标拖拽 start----------------------------------------------------------------
- (BOOL)canBecomeKeyWindow {
    return YES;
}
- (void)mouseDown:(NSEvent *)theEvent{
    isDrag = YES;
    
    NSRect  windowFrame = [self frame];
    initialLocation = [NSEvent mouseLocation];
    
    initialLocation.x -= windowFrame.origin.x;
    initialLocation.y -= windowFrame.origin.y;
    
    
    
    if([theEvent clickCount] == 1) {
        NSLog(@"111");
    }else if([theEvent clickCount] == 2){
        //[self changeWindowSize];
        NSLog(@"222");
    }
}

- (void)mouseUp:(NSEvent *)theEvent
{
    isDrag = NO;
}
//-------------------------------------------------------------------------
- (void)mouseDragged:(NSEvent *)theEvent
{
    if (!isDrag)
    {
        return;
    }
    NSPoint currentLocation;
    NSPoint newOrigin;
    
    NSRect  screenFrame = [[NSScreen mainScreen] frame];
    NSRect  windowFrame = [self frame];
    
    currentLocation = [NSEvent mouseLocation];
    newOrigin.x = currentLocation.x - initialLocation.x;
    newOrigin.y = currentLocation.y - initialLocation.y;
    
    // Don't let window get dragged up under the menu bar
    if( (newOrigin.y+windowFrame.size.height) > (screenFrame.origin.y+screenFrame.size.height) ){
		newOrigin.y=screenFrame.origin.y + (screenFrame.size.height-windowFrame.size.height);
    }
    [self setFrameOrigin:newOrigin];
    
    // NSEvent doub;//clickCount
}
//---鼠标拖拽 end----------------------------------------------------------------



@end
