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
@interface RootViewController ()

@end

@implementation RootViewController
{
    bezierPath *_circle;
    
    CAShapeLayer *_outerCircleLayer;
    UIBezierPath *_outerCirclePath;
}
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
    _circle = [[bezierPath alloc] initWithFrame:CGRectMake(150, 150, 100, 100)];
    [_circle startAnimation];
    
    
    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(100, 200, 50, 20)];
    tf.borderStyle = UITextBorderStyleRoundedRect;
    tf.backgroundColor = [UIColor blackColor];
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
    /* ----   圆周滚动  ----
    CGRect boundingRect = CGRectMake(-100, 0, 200, 200);
    
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    orbit.path = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect, NULL));
    orbit.duration = 4;
    orbit.additive = YES;
    orbit.repeatCount = HUGE_VALF;
    orbit.calculationMode = kCAAnimationPaced;
    orbit.rotationMode = kCAAnimationRotateAuto;
    [tf.layer addAnimation:orbit forKey:@"Circle"];
    */
    
    RBBTweenAnimation *animation = [RBBTweenAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @50;
    animation.toValue = @150;
    animation.duration = 1;
    
    animation.easing = RBBCubicBezier(0.68, -0.55, 0.735, 1.55);
    [self.view addSubview:tf];
    
    
    
    

    
//    [self.view addSubview:_circle];
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
