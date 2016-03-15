//
//  StoryCollectionViewCell.m
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/14.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "StoryCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation StoryCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)stary:(StoryModel*)sender{
    _iconimage.clipsToBounds=YES;
    _iconimage.layer.cornerRadius=20;
    [_iconimage sd_setImageWithURL:[NSURL URLWithString:sender.index_cover] placeholderImage:[UIImage imageNamed:@"xixi"]];
    _title.text=sender.index_title;
    _place.text=sender.poi.address;
    _name.text=sender.user.name;
    _headImage.clipsToBounds=YES;
    _headImage.layer.cornerRadius=15;
    [_headImage sd_setImageWithURL:[NSURL URLWithString:sender.user.avatar_l] placeholderImage:[UIImage imageNamed:@"xixi"]];
    
}
@end
