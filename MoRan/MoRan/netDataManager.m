//
//  netDataManager.m
//  MoRan
//
//  Created by liyicong on 15/11/26.
//  Copyright © 2015年 GeekBand. All rights reserved.
//

#import "netDataManager.h"

#define SERVER_ADDR  @"http://moran.chinacloudapp.cn/moran/web"

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

@end

