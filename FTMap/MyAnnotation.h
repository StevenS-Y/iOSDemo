//
//  MyAnnotation.h
//  Demo
//
//  Created by SYAN on 14-8-26.
//  Copyright (c) 2014年 SYAN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMKMapView.h"
@interface MyAnnotation : NSObject<BMKAnnotation>

- (id)initWithTitle:(NSString *)title andSubTitle:(NSString *)subTitle andCoor:(CLLocationCoordinate2D)coor;

@end
