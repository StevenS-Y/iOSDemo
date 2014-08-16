//
//  RootViewController.m
//  Demo
//
//  Created by SYAN on 14-8-16.
//  Copyright (c) 2014年 SYAN. All rights reserved.
//

#import "RootViewController.h"
#import "CircleView.h"
@interface RootViewController ()

@end

@implementation RootViewController
{
    bezierPath *_circle;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _circle = [[bezierPath alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    [_circle startAnimation];
    
//    [_circle stopAnimation];


    
    [self.view addSubview:_circle];
}

- (void)stopAnimation{
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
