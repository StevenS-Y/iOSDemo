//
//  DownloadView.m
//  Demo
//
//  Created by SYAN on 14-8-22.
//  Copyright (c) 2014年 SYAN. All rights reserved.
//

#import "DownloadView.h"
#import "CircleView.h"
@implementation DownloadView
{
    CAShapeLayer *_layer;
    NSTimer *_timer;
    bezierPath *_circle;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self layoutView];
    }
    return self;
}

- (void)layoutView{
    _layer = [CAShapeLayer layer];
    _layer.borderColor = [[UIColor redColor] CGColor];
    _layer.borderWidth = 3;
    _layer.frame = CGRectMake(10, 100, 300, 300);
    _layer.fillColor = [[UIColor whiteColor]CGColor];
    _layer.strokeColor = [[UIColor blueColor] CGColor];
    _layer.masksToBounds = YES;
    _layer.lineWidth = 5;
    [self.layer addSublayer:_layer];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(start) userInfo:nil repeats:YES];
    [_timer setFireDate:[NSDate distantPast]];
    
}

- (void)start{
    static int i = 0;
    if (i <= 150) {
        _layer.cornerRadius = i;
    }
    if (i > 160) {
        _layer.borderColor = [[UIColor clearColor]CGColor];
        _layer.path = [[UIBezierPath bezierPathWithArcCenter:CGPointMake(_layer.bounds.size.height / 2, _layer.bounds.size.height / 2) radius:150 startAngle:M_PI*(i)/180.0 endAngle:M_PI*(i+340)/180.0 clockwise:YES]CGPath];
    }
    i++;
    if (i == 500) {
        [_timer invalidate];
        _circle = [[bezierPath alloc] initWithFrame:CGRectMake(110, 200, 100, 100)];
        [_circle startAnimation];
        [self addSubview:_circle];
    }
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
