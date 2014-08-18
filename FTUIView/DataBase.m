//
//  DataBase.m
//  Demo
//
//  Created by SYAN on 14-8-18.
//  Copyright (c) 2014年 SYAN. All rights reserved.
//

#import "DataBase.h"
#import "NewsMode.h"

@implementation DataBase
{
    FMDatabase *_dataBase;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self myDataBase];
        [self DataTable];
    }
    return self;
}

- (void)myDataBase{
    NSString *pathStr = [NSString stringWithFormat:@"%@/Library/Caches/Test.db",NSHomeDirectory()];
    _dataBase = [[FMDatabase alloc] initWithPath:pathStr];
    if ([_dataBase open]) {
        NSLog(@"dataBase open success");
    }else {
        NSLog(@"dataBase open failed");
    }
}

- (void)DataTable{
    [_dataBase open];
    [_dataBase executeUpdate:@"create table data(title text,description text,imageURL text)"];
    [_dataBase close];
}

- (void)collectNewsWithTitle:(NSString *)titile Description:(NSString *)description imageURL:(NSString *)imageURL{
    [_dataBase open];
    [_dataBase executeUpdate:@"insert into data values(?,?,?)",titile,description,imageURL];
    [_dataBase close];
}

- (NSMutableArray *)GettingDataWithTitle:(NSString *)title{
    
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    [_dataBase open];
    FMResultSet *result = [_dataBase executeQuery:@"select * from data where title = ?",title];
    while ([result next]) {
        NewsMode *nm = [[NewsMode alloc] init];
        nm.title = [result stringForColumn:@"title"];
        nm.description = [result stringForColumn:@"description"];
        nm.imageURL = [result stringForColumn:@"imageURL"];
        [dataArray addObject:nm];
    }
    [_dataBase close];
    return dataArray;
}



@end













