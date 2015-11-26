//
//  netDataManager.h
//  MoRan
//
//  Created by liyicong on 15/11/26.
//  Copyright © 2015年 GeekBand. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface netDataManager : NSObject

@property (nonatomic) NSMutableData       *rtnData;         ///< 应答数据

+ (netDataManager *)manager;

@end
