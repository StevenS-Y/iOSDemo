//
//  RootViewController.h
//  Demo
//
//  Created by SYAN on 14-8-16.
//  Copyright (c) 2014年 SYAN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMKMapView.h"
#import "MyAnnotation.h"
@interface RootViewController : UIViewController<BMKMapViewDelegate>
{
    BMKMapView *mapView;
}


@end
