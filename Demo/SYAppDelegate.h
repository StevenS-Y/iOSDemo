//
//  SYAppDelegate.h
//  Demo
//
//  Created by SYAN on 14-8-16.
//  Copyright (c) 2014年 SYAN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"

@interface SYAppDelegate : UIResponder <UIApplicationDelegate,BMKGeneralDelegate>
{
    BMKMapManager *_mapManager;
}
@property (strong, nonatomic) UIWindow *window;

@end
