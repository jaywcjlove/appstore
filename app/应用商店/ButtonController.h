//
//  ButtonController.h
//  应用商店
//
//  Created by kenny.wang on 13-3-29.
//  Copyright (c) 2013年 王 楚江. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>

@class ViewTitleBarBtn;

@interface ButtonController : NSButton<NSWindowDelegate,NSAnimationDelegate>{    
    NSTrackingArea  *trackingArea;
    BOOL    animations;
    BOOL    sheetPanel;
}
@property (nonatomic, strong) NSImage *activeImage;
@property (nonatomic, strong) ViewTitleBarBtn * aboutView;
@property (nonatomic, strong) NSPanel *sheet;

- (void)buttonTaped:(NSButton *)button;

@end
