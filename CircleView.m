//
//  bezierPath.m
//  Demo
//
//  Created by SYAN on 14-8-16.
//  Copyright (c) 2014年 SYAN. All rights reserved.
//

#import "CircleView.h"



@implementation bezierPath
{
    UIBezierPath *_outerCirclePath;
    UIBezierPath *_insideCirclePath;
    
    CAShapeLayer *_insideCircleLayer;
    CAShapeLayer *_outerCircleLayer;
    
    int _i;
    NSTimer *_timer;
    CGPoint center;
}
- (id)initWithFrame:(CGRect)frame 
{
    self = [super initWithFrame:frame];
    if (self) {

        center = CGPointMake(self.layer.bounds.size.width / 2 , self.layer.bounds.size.height / 2);

        [self laoutOuterCircleLayer];
        [self layoutInsideCircleLayer];

        
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(progress:) userInfo:nil repeats:YES];
    }
    return self;
}

- (void)layoutInsideCircleLayer{

    _insideCircleLayer = [CAShapeLayer layer];
    _insideCircleLayer.bounds = CGRectMake(0, 0, 100, 100);
    _insideCircleLayer.lineWidth = 5;
    _insideCircleLayer.position = center;
    _insideCircleLayer.fillColor = [UIColor clearColor].CGColor;
    _insideCircleLayer.strokeColor = [[UIColor redColor]CGColor];
    
    [self.layer addSublayer:_insideCircleLayer];
    
}

- (void)laoutOuterCircleLayer{
    
    _outerCirclePath = [UIBezierPath bezierPathWithArcCenter:center radius:45 startAngle:M_PI*(0)/180.0 endAngle:2 * M_PI clockwise:YES];
    
    _outerCircleLayer = [CAShapeLayer layer];
    _outerCircleLayer.bounds = CGRectMake(0, 0, 100, 100);
    _outerCircleLayer.position = center;
    _outerCircleLayer.fillColor = [UIColor clearColor].CGColor;
    NSLog(@"%f  %f",center.x,center.y);
    _outerCircleLayer.lineWidth = 3;
    _outerCircleLayer.strokeColor = [[UIColor blueColor] CGColor];
    _outerCircleLayer.path = [_outerCirclePath CGPath];
    [self.layer addSublayer:_outerCircleLayer];
}

- (void)startAnimation{
    [_timer setFireDate:[NSDate distantPast]];
}

- (void)stopAnimation{
    [_timer invalidate];
}

- (void)progress:(NSTimer *)timer{
    _insideCirclePath = [UIBezierPath bezierPathWithArcCenter:center radius:42 startAngle:0 endAngle:M_PI*(_i * 3.6) / 180 clockwise:YES];
    
    _insideCircleLayer.path = [_insideCirclePath CGPath];
    if (_i == 100 ) {
        [_timer invalidate];
    }
    _i++;

}

@end
