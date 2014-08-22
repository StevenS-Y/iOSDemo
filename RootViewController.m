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

    DownloadView *animation = [[DownloadView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:animation];
  
    /* ------文本框shake-------

    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;
    animation.autoreverses = YES;
    animation.additive = YES;
    
    [tf.layer addAnimation:animation forKey:@"shake"];
    */
    
    /*
    // ----- 平移动画 ----
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @77;
    animation.toValue = @200;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.repeatCount = HUGE_VALF;
    animation.duration = 1;
    animation.autoreverses = YES;
    [tf.layer addAnimation:animation forKey:@"position"];
    tf.layer.position = CGPointMake(200, 100);
    */
    
    /*落地效果
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.y";
    animation.values = @[@0, @50, @10, @50, @30, @50];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(2.5 / 6.0), @(4 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 1;
    animation.additive = YES;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [tf.layer addAnimation:animation forKey:@"fall"];
     */

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

@end
