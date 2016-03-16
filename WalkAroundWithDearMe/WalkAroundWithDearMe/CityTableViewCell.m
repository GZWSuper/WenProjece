//
//  CityTableViewCell.m
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/15.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "CityTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation CityTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)staryCity:(Hottest_sitesModel *)sender{
    [_Cover sd_setImageWithURL:[NSURL URLWithString:sender.cover_s] placeholderImage:[UIImage imageNamed:@"xixi"]];
    _Cover.clipsToBounds=YES;
    _Cover.layer.cornerRadius=20;
    _name.text=sender.name;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
