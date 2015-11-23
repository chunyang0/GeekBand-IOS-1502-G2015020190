//
//  Globe.h
//  MoRan
//
//  Created by LYC on 15/11/23.
//  Copyright © 2015年 GeekBand. All rights reserved.
//

#ifndef MoRan_Globe_h
#define MoRan_Globe_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

#if defined(__LP64__) && __LP64__          
# define CGFloat_fabs fabs
#else
# define CGFloat_fabs fabsf
#endif

// 屏幕宽度
CGFloat fullSrceenWidth();

// 屏幕高度;
CGFloat fullScreenHeight();

#endif