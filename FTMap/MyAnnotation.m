//
//  MyAnnotation.m
//  Demo
//
//  Created by SYAN on 14-8-26.
//  Copyright (c) 2014年 SYAN. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation
{
    NSString *_title;
    NSString *_subTitle;
    CLLocationCoordinate2D _coor;
}
- (id)initWithTitle:(NSString *)title andSubTitle:(NSString *)subTitle andCoor:(CLLocationCoordinate2D)coor{
    self = [super init];
    if (self) {
        _title = title;
        _subTitle = subTitle;
        _coor = coor;
    }
    return self;
}

- (NSString *)title{
    return _title;
}

- (NSString *)subtitle{
    return _subTitle;
}

- (CLLocationCoordinate2D)coordinate{
    return _coor;
}

@end
