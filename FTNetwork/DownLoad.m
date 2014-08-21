//
//  DownLoad.m
//  Demo
//
//  Created by SYAN on 14-8-18.
//  Copyright (c) 2014年 SYAN. All rights reserved.
//

#import "DownLoad.h"

@implementation DownLoad

- (void)DownLoad{
    NSURL *url = [NSURL URLWithString:self.DownLoadURLString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"响应服务器");
    _data = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"数据下载完毕");
    [self.delegate downLoadDataFinishWithClass:self];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"下载失败");
    [self DownLoad];
}
@end
