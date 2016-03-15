//
//  CollectionViewCell.m
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/15.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "CollectionViewCell.h"
#import "UIImageView+WebCache.h"
@implementation CollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)stary:(StoryModel *)sender{
    [_image sd_setImageWithURL:[NSURL URLWithString:sender.index_cover] placeholderImage:[UIImage imageNamed:@"xixi"]];
    _image.clipsToBounds = YES;
    
    _image.layer.cornerRadius = 15;
    
    _text.text = sender.index_title;
}
@end
