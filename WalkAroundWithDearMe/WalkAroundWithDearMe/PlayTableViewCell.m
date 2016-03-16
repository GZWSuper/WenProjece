//
//  PlayTableViewCell.m
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/15.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "PlayTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation PlayTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)staryPlay:(PlayModel *)sender{
    [_photo sd_setImageWithURL:[NSURL URLWithString:sender.cover_image_1600] placeholderImage:[UIImage imageNamed:@"xixi"]];
    _photo.clipsToBounds=YES;
    _photo.layer.cornerRadius=20;
    _name.text=sender.name;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
