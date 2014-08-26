//
//  DataPicker.m
//  Demo
//
//  Created by SYAN on 14-8-25.
//  Copyright (c) 2014年 SYAN. All rights reserved.
//

#import "DataPicker.h"

@implementation DataPicker
{
    NSArray *_dataArray;
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
    UIPickerView *dataPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(50, 150, 100, 100)];
    dataPicker.delegate = self;
    dataPicker.showsSelectionIndicator = NO;
    [self addSubview:dataPicker];
     _dataArray = [[NSArray alloc]initWithObjects:@"许嵩",@"周杰伦",@"梁静茹",@"许飞",@"凤凰传奇",@"阿杜",@"方大同",@"林俊杰",@"胡夏",@"邱永传", nil];
    
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_dataArray count];
}

#pragma mark Picker Delegate Methods

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_dataArray objectAtIndex:row];
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
