//
//  DownLoadManager.m
//  Demo
//
//  Created by SYAN on 14-8-18.
//  Copyright (c) 2014年 SYAN. All rights reserved.
//

#import "DownLoadManager.h"
#import "NewsMode.h"
@implementation DownLoadManager
{
    NSMutableDictionary *_taskDict;
    NSMutableDictionary *_resultDict;
}

static DownLoadManager *_sharedDownLoadManager;

+ (DownLoadManager *)sharedDownLoadManager{
    if (!_sharedDownLoadManager) {
        _sharedDownLoadManager = [[DownLoadManager alloc] init];
    }
    return _sharedDownLoadManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        _taskDict = [[NSMutableDictionary alloc] init];
        _resultDict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)addDownLoadWithURLString:(NSString *)urlString andType:(int)type{
    if (![_taskDict objectForKey:urlString]) {
        DownLoad *dl = [[DownLoad alloc] init];
        dl.DownLoadURLString = urlString;
        dl.type = type;
        dl.delegate = self;
        [dl DownLoad];
        [_taskDict setObject:dl forKey:urlString];
    }else {
        NSLog(@"无需重复下载");
    }
}

- (NSMutableArray *)getDownLoadDataWithURLString:(NSString *)urlString{
    return [_resultDict objectForKey:urlString];
}

- (void)downLoadDataFinishWithClass:(DownLoad *)dl{
    NSDictionary * rootDict = [NSJSONSerialization JSONObjectWithData:dl.data options:NSJSONReadingMutableContainers error:nil];
    
    if (dl.type == NEWSTYPE)
    {
        [_taskDict removeObjectForKey:dl.DownLoadURLString];
        
        NSDictionary * dict = rootDict[@"Result"];
        NSMutableArray *allArray = [[NSMutableArray alloc] init];
        for (NSDictionary * linksDict in dict[@"links"])
        {
            NewsMode *nm = [[NewsMode alloc] init];
            nm.title = linksDict[@"articleName"];
            nm.description = linksDict[@"introduction"];
            nm.imageURL = [NSString stringWithFormat:@"http://sqt.9tong.com%@",linksDict[@"pic"]];
            [allArray addObject:nm];
        }
        [_resultDict setObject:allArray forKey:dl.DownLoadURLString];
        [[NSNotificationCenter defaultCenter] postNotificationName:dl.DownLoadURLString object:nil];
    }
}
@end