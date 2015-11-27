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


/**
 * @flag 注册用户
 */
- (void)registerWithName:(NSString *)name password:(NSString *)password email:(NSString *)email gid:(NSString *)gbid;

/**
 * @flag 用户登陆
 */
- (void)loginWithEmail:(NSString *)email password:(NSString *)password gid:(NSString *)gbid;

/**
 * @flag 上传用户头像
 */
- (void)updateHeadImage:(NSData *)imageData userID:(NSString *)user_id token:(NSString *)token;

/**
 * @flag 更改用户名
 */
- (void)renameWithNewName:(NSString *)new_name userID:(NSString *)user_id token:(NSString *)token;
@end
