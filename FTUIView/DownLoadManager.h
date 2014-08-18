//
//  DownLoadManager.h
//  Demo
//
//  Created by SYAN on 14-8-18.
//  Copyright (c) 2014年 SYAN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownLoad.h"
@interface DownLoadManager : NSObject<DownLoadDelegate>
+ (DownLoadManager *)sharedDownLoadManager;

- (void)addDownLoadWithURLString:(NSString *)urlString andType:(int)type;

- (NSMutableArray *)getDownLoadDataWithURLString:(NSString *)urlString;


@end
