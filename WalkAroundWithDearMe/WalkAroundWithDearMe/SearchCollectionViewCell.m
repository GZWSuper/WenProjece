//
//  SearchCollectionViewCell.m
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/16.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "SearchCollectionViewCell.h"

@implementation SearchCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)starySeach:(SearchElementsModel *)sender{
    _name.text=sender.name;
}
@end
