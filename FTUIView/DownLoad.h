//
//  DownLoad.h
//  Demo
//
//  Created by SYAN on 14-8-18.
//  Copyright (c) 2014年 SYAN. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DownLoad;

@protocol DownLoadDelegate <NSObject>

- (void)downLoadDataFinishWithClass:(DownLoad *)dl;

@end

@interface DownLoad : NSObject<NSURLConnectionDataDelegate>

@property (nonatomic,strong) NSString *DownLoadURLString;
@property (nonatomic,strong) NSMutableData *data;
@property (nonatomic) int type;
@property (nonatomic,weak) __weak id<DownLoadDelegate>delegate;

- (void)DownLoad;

@end
