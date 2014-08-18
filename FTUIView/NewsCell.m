//
//  NewsCell.m
//  Demo
//
//  Created by SYAN on 14-8-18.
//  Copyright (c) 2014年 SYAN. All rights reserved.
//

#import "NewsCell.h"
@implementation NewsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layoutCell];
    }
    return self;
}

- (void)layoutCell{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    titleLab.text = _title;
    titleLab.backgroundColor = [UIColor magentaColor];
    [view addSubview:titleLab];
    
    UILabel *desLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 30, 220, 70)];
    desLab.text = _description;
    [view addSubview:desLab];
    
    _image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 30, 100, 70)];
    [view addSubview:_image];
    
    [self.contentView addSubview:view];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
