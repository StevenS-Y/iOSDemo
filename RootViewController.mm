//
//  RootViewController.m
//  Demo
//
//  Created by SYAN on 14-8-16.
//  Copyright (c) 2014年 SYAN. All rights reserved.
//

#import "RootViewController.h"
#import "NewsViewController.h"
#import "CircleView.h"
#import "DataPicker.h"
#import "DownloadView.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //calayer cashapelayer catransition  uibezierpath

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self LayoutItem];
//    DataPicker *dataPicker = [[DataPicker alloc] initWithFrame:CGRectMake(0, 100, 300, 150)];
//    [self.view addSubview:dataPicker];
    
    CLLocationCoordinate2D coor;
    coor.latitude = 40.450433;
    coor.longitude = 116.668534;
    
    mapView = [[BMKMapView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    mapView.mapType = BMKMapTypeStandard;
    mapView.zoomLevel = 15;
    mapView.delegate = self;
    mapView.centerCoordinate = coor;
    [self.view addSubview:mapView];
    
    MyAnnotation *ma = [[MyAnnotation alloc] initWithTitle:@"结伴互动" andSubTitle:@"怀北滑雪场" andCoor:coor];
    [mapView addAnnotation:ma];
}

- (void)LayoutItem{
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onClick)];
    
    self.navigationItem.rightBarButtonItem = item;
}

- (void)onClick{
    NewsViewController *nvc = [[NewsViewController alloc] init];
    [self.navigationController pushViewController:nvc animated:YES];
}

- (void)stopAnimation{
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark AnimaionDelegagte

- (void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"animationDidStatr");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"animationDidStop");
}

@end
