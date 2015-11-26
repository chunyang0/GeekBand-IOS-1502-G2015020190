//
//  netDataManager.h
//  MoRan
//
//  Created by liyicong on 15/11/26.
//  Copyright © 2015年 GeekBand. All rights reserved.
//

#import <Foundation/Foundation.h>

#define REGISTER            @"/user/register"   //注册
#define LOGIN               @"/user/login"      //登录
#define RENAME              @"/user/rename"     //更改用户名
#define UPDATE_HEADIMAGE    @"/user/avatar"     //上传头像
#define GET_HEADIMAGE       @"/user/show"       //显示头像

#define GET_COMMENT         @"/comment"         //获取评论列表
#define VIEW_COMMET         @"/comment/view"    //查看评论
#define CREATE_COMMET       @"/comment/create"  //创建评论
#define UPDATE_COMMENT      @"/comment/update"  //编辑评论
#define DELETE_COMMNET      @"/comment/delete"  //删除评论

#define GET_LOCATION        @"/node/list"       //获取地理位置列表
#define PICTURE_CREATE      @"/picture/create"  //上传图片
#define PICTURE_READ        @"/picture/read"    //访问图片


@interface netDataManager : NSObject

@property (nonatomic) NSMutableData       *rtnData;         ///< 应答数据

+ (netDataManager *)manager;

/**
 * @flag 将请求数据发往服务器
 */
- (void)postRequest:(NSDictionary *)paramDic subAddr:(NSString *)subAddr;

@end
