//
//  Globe.m
//  MoRan
//
//  Created by LYC on 15/11/23.
//  Copyright © 2015年 GeekBand. All rights reserved.
//

#import "Globe.h"

CGFloat s_screenHeight = 0;
CGFloat s_screenWidth = 0;


CGFloat fullScreenHeight()
{
    if (CGFloat_fabs(s_screenHeight) <= 0.000001) {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        s_screenHeight = (screenRect.size.width > screenRect.size.height ? screenRect.size.width : screenRect.size.height);
    }
    
    return s_screenHeight;
}

CGFloat fullSrceenWidth()
{
    if (CGFloat_fabs(s_screenWidth) <= 0.000001) {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        s_screenWidth = (screenRect.size.width < screenRect.size.height ? screenRect.size.width : screenRect.size.height);
    }
    return s_screenWidth;
}