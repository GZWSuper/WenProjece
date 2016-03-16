//
//  CityTwoViewTableViewCell.m
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/15.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "CityTwoViewTableViewCell.h"

@implementation CityTwoViewTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)staryCityTwo:(CityTwoModel *)sender{
    _lab1.text = sender.recommended_reason;
    _lab2.text = sender.des;
    _lab3.text = sender.address;
    _lab4.text = sender.arrival_type;
    _lab5.text = sender.opening_time;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
