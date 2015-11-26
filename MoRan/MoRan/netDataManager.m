//
//  netDataManager.m
//  MoRan
//
//  Created by liyicong on 15/11/26.
//  Copyright © 2015年 GeekBand. All rights reserved.
//

#import "netDataManager.h"

@implementation netDataManager

+ (netDataManager *)manager
{
    static netDataManager *s_netDataManager = nil;
    static dispatch_once_t s_onceToken;
    
    dispatch_once(&s_onceToken, ^{
        s_netDataManager = [netDataManager new];
    });
    
    return s_netDataManager;
}

- (instancetype)init
{
    if (self = [super init]) {
    }
    
    return self;
}

@end

