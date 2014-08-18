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
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
        
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
        _titleLab.font = [UIFont boldSystemFontOfSize:13];
        _titleLab.backgroundColor = [UIColor magentaColor];
        [view addSubview:_titleLab];
        
        _descriptionLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 30, 220, 120)];
        _descriptionLab.textColor = [UIColor grayColor];
        _descriptionLab.numberOfLines = 0;
        _descriptionLab.font = [UIFont boldSystemFontOfSize:13];
        [view addSubview:_descriptionLab];
        
        _image = [[UIImageView alloc] initWithFrame:CGRectMake(10, 50, 80, 80)];
        _image.layer.cornerRadius = 10;
        _image.layer.masksToBounds = YES;
        [view addSubview:_image];
        
        [self.contentView addSubview:view];
//        [self layoutCell];
    }
    return self;
}

//- (void)layoutCell{
//    
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
