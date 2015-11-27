//
//  netDataManager.m
//  MoRan
//
//  Created by liyicong on 15/11/26.
//  Copyright © 2015年 GeekBand. All rights reserved.
//

#import "netDataManager.h"

#define SERVER_ADDR  @"http://moran.chinacloudapp.cn/moran/web"

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

/* TODO: 添加请求和应答的一一对应关系 */

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

/**
 * @flag 发送请求信息
 */
- (void)postRequest:(NSDictionary *)paramDic subAddr:(NSString *)subAddr
{
    NSURL *url = [NSURL URLWithString:[SERVER_ADDR stringByAppendingString:subAddr]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.timeoutInterval = 5.0;
    request.HTTPMethod = @"POST";
    
    NSMutableString *paramStr = [NSMutableString new];
    NSArray *keyArray = [paramDic allKeys];
    for (NSString *key in keyArray) {
        NSString *subParam = [NSString stringWithFormat:@"&%@=%@", key, [paramDic valueForKey:key]];
        [paramStr appendString:subParam];
    }
    
    [paramStr deleteCharactersInRange:NSMakeRange(0, 1)];
    
    request.HTTPBody = [paramStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLConnection *urlConnection;
    urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}



#pragma mark - NSURLConnection delegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if (!_rtnData) {
        _rtnData = [NSMutableData new];
    }
    else {
        [_rtnData setLength:0];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_rtnData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Connection failed! Error - %@ %@", [error localizedDescription], [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *error = nil;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:_rtnData
                                                            options:NSJSONReadingMutableContainers
                                                              error:&error];
    
    _rtnData = nil;
    
    if (error) {
        NSLog(@"信息解码失败！%@",[error localizedDescription]);
        return;
    }
    
    if (jsonDic.count <= 0) {
        NSLog(@"未能获取信息");
        return;
    }
    
    
}

#pragma mark - reqMethod

/**
 * @flag 注册用户
 */
- (void)registerWithName:(NSString *)name password:(NSString *)password email:(NSString *)email gid:(NSString *)gbid
{
    NSMutableDictionary * paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                            name,            @"username",
                                            password,        @"password",
                                            email,           @"email",
                                            gbid,            @"gbid",
                                            nil];


    [self postRequest:paramDic subAddr:REGISTER];
}

/**
 * @flag 用户登陆
 */
- (void)loginWithEmail:(NSString *)email password:(NSString *)password gid:(NSString *)gbid
{
    NSMutableDictionary * paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                      password,        @"password",
                                      email,           @"email",
                                      gbid,            @"gbid",
                                      nil];
    
    
    [self postRequest:paramDic subAddr:LOGIN];
}

/**
 * @flag 上传用户头像
 */
- (void)updateHeadImage:(NSData *)imageData userID:(NSString *)user_id token:(NSString *)token
{
    NSMutableDictionary * paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                      user_id,        @"user_id",
                                      token,          @"token",
                                      imageData,      @"data",
                                      nil];
    
    [self postRequest:paramDic subAddr:UPDATE_HEADIMAGE];
}

/**
 * @flag 更改用户名
 */
- (void)renameWithNewName:(NSString *)new_name userID:(NSString *)user_id token:(NSString *)token
{
    NSMutableDictionary * paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                      user_id,        @"user_id",
                                      token,          @"token",
                                      new_name,       @"new_name",
                                      nil];
    
    [self postRequest:paramDic subAddr:RENAME];
}

@end

