//
//  Down_hkAppDelegate.m
//  应用商店
//
//  Created by kenny.wang on 13-3-27.
//  Copyright (c) 2013年 王 楚江. All rights reserved.
//

#import "Down_hkAppDelegate.h"
#import "ViewTitleBarBtn.h"

#import "AppWindow.h"

@implementation Down_hkAppDelegate
@synthesize window=_window;

- (void)dealloc
{
    [super dealloc];
}
-(void)awakeFromNib{
    [_window setMinSize:CGSizeMake(550, 400)];
    
    

    
}
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    
    
    ViewTitleBarBtn *theme=[[ViewTitleBarBtn alloc]init];
    [theme frameSkinTheme:_window];
    
    
    //[[self window] setMovableByWindowBackground:YES];
    
    
//AppWindow *win = [[AppWindow alloc]init];
//NSWindowController * windowController = [[[AppWindow alloc] initWithWindowNibName:@"AppWindow"] autorelease];
//NSWindow * sheet = [windowController window];
//_window set
    
    
    NSZone *zone = [NSMenu menuZone];
    NSMenu *menu = [[[NSMenu allocWithZone:zone] init] autorelease];
    NSMenuItem *item;
    
    item = [menu addItemWithTitle:@"Testing" action:@selector(testAction:) keyEquivalent:@""];
    [item setTarget:self];
    
    item = [menu addItemWithTitle:@"退出商店" action:@selector(quitAction:) keyEquivalent:@""];
    [item setTarget:self];
    
    trayItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength] retain];
    [trayItem setMenu:menu];
    [trayItem setHighlightMode:YES];
    [trayItem setTitle:@"卍"];
    
    


    
}

-(IBAction)quitAction:(id)sender{
    [NSApp terminate:sender];
}

@end
