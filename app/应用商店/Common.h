//
//  Common.h
//  应用商店
//
//  Created by kenny.wang on 13-4-16.
//  Copyright (c) 2013年 王 楚江. All rights reserved.
//

#ifndef _____Common_h
#define _____Common_h

#pragma mark - 设置RGB颜色
//#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:(rgbValue & 0xFF0000 >> 6)/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0
//                green:((float)((rgbValue & 0xFF00) >> 8))/255.0
//                 blue:((float)(rgbValue & 0xFF))/255.0
//                alpha:1.0]


//#define CIColorFromRGB(rgbValue) [CIColor colorWithRed:(rgbValue & 0xFF0000 >> 6)/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define CIColorFromRGB(rgbValue) [NSColor colorWithRed:(rgbValue & 0xFF0000 >> 6)/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#endif
