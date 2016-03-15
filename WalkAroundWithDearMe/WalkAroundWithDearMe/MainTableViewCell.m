//
//  MainTableViewCell.m
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/15.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "MainTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation MainTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)staryMainModel:(MainModel *)sender{
    _place.text=sender.popular_place_str;
    _Name.text=sender.name;
    [_mainImage sd_setImageWithURL:[NSURL URLWithString:sender.cover_image] placeholderImage:[UIImage imageNamed:@"xixi"]];
    _mainImage.clipsToBounds=YES;
    _mainImage.layer.cornerRadius=20;
    _days.text=[NSString stringWithFormat:@"%@  %lu天 浏览%lu",sender.first_day,(long)sender.day_count,(long)sender.view_count];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
