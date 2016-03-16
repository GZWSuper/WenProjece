//
//  MainTwoTableViewCell.m
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/16.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "MainTwoTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation MainTwoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)staryMain:(DaysModel *)sender{
    _text.text=sender.text;
    [_photo sd_setImageWithURL:[NSURL URLWithString:sender.photo] placeholderImage:[UIImage imageNamed:@"xixi"]];
    _photo.clipsToBounds=YES;
    _photo.layer.cornerRadius=20;
    _time.text=sender.local_time;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
