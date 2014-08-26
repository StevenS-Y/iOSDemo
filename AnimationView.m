//
//  AnimationView.m
//  Demo
//
//  Created by SYAN on 14-8-25.
//  Copyright (c) 2014年 SYAN. All rights reserved.
//

#import "AnimationView.h"

@implementation AnimationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self viewDidLoad];
    }
    return self;
}
- (void)viewDidLoad
{
    /*
     
     DownloadView *animation = [[DownloadView alloc] initWithFrame:self.view.bounds];
     [self.view addSubview:animation];
     
     UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(150, 150, 100, 30)];
     tf.borderStyle = UITextBorderStyleRoundedRect;
     tf.backgroundColor = [UIColor blackColor];
     */
    //    [self.view addSubview:tf];
    
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
    
    //落地效果
    //    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    //    animation.keyPath = @"position.y";
    //    animation.values = @[@0, @50, @10, @50, @30, @50];
    //    animation.keyTimes = @[ @0.5, @(2 / 6.0), @(3 / 6.0), @(4 / 6.0), @(5 / 6.0), @1 ];
    //    animation.duration = 1;
    //    animation.additive = YES;
    //    animation.fillMode = kCAFillModeForwards;
    //    animation.removedOnCompletion = NO;
    //    [tf.layer addAnimation:animation forKey:@"fall"];
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    view.backgroundColor = [UIColor redColor];
    [self addSubview:view];
    
    UIImage *content = [UIImage imageNamed:@"run1"];
    UIImage *content2 = [UIImage imageNamed:@"run2"];
    float width = content.size.width;
    float height = content.size.height;
    
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [[UIColor redColor] CGColor];
    layer.frame =CGRectMake(0, 0, width, height);
    layer.position = CGPointMake((320 - width) / 2, 400);
    layer.contents = (__bridge id)(content.CGImage);
    
    [self.layer addSublayer:layer];
    
    
    CABasicAnimation *runAnim = [CABasicAnimation animationWithKeyPath:@"contents"];
    
    runAnim.fromValue = (__bridge id)(content.CGImage);
    runAnim.toValue = (__bridge id)(content2.CGImage);
    
    runAnim.duration = 0.2;
    
    runAnim.repeatCount = HUGE_VALF;
    
    //    runAnim.autoreverses  = YES;
    
    CABasicAnimation *moveAnim = [CABasicAnimation animationWithKeyPath:@"position"];
    
    moveAnim.fromValue = [NSValue valueWithCGPoint:CGPointMake((320 - width) / 2, 400)];
    
    moveAnim.toValue = [NSValue valueWithCGPoint:CGPointMake((320 - width) / 2, 100)];
    
    moveAnim.duration = 2;
    moveAnim.repeatCount = 100;
    
    moveAnim.autoreverses = NO;
    
    CABasicAnimation *boundsAnim =[CABasicAnimation animationWithKeyPath:@"bounds"];//CALayer属性
    
    boundsAnim.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 50, 50)];
    boundsAnim.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, width + 50, height + 50)];
    boundsAnim.duration = 1;
    boundsAnim.delegate = self;
    boundsAnim.repeatCount = 100;
    boundsAnim.autoreverses = YES;
    //
    //    CABasicAnimation *alphaAnim = [CABasicAnimation animationWithKeyPath:@"hidden"];
    //    alphaAnim.duration = 1;
    //    alphaAnim.repeatCount = HUGE_VALF;
    //    alphaAnim.autoreverses = YES;
    
    
    [UIView animateWithDuration:4 animations:^{
        view.alpha = 1;
        view.alpha = 0;
    } completion:^(BOOL finished) {
        NSLog(@"1");
    }];
    
    //    [UIView animateWithDuration:4 animations:^{
    //
    //    } completion:^(BOOL finished) {
    //
    //    }];
    
    
    //    [UIView ani]
    
    //    [layer addAnimation:alphaAnim forKey:@"alphaAnin"];
    [layer addAnimation:boundsAnim forKey:@"boundsAnim"];
    [layer addAnimation:runAnim forKey:@"runAnim"];
    [layer addAnimation:moveAnim forKey:@"moveUpAnim"];
    
 
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
