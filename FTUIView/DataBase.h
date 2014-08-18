//
//  DataBase.h
//  Demo
//
//  Created by SYAN on 14-8-18.
//  Copyright (c) 2014年 SYAN. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FMDatabase.h"

@interface DataBase : NSObject
//存储数据
- (void)collectNewsWithTitle:(NSString *)titile Description:(NSString *)description imageURL:(NSString *)imageURL;
//取数据
- (NSMutableArray *)GettingDataWithURL:(NSString *)URL;

@end
