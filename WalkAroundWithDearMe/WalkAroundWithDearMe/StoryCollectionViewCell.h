//
//  StoryCollectionViewCell.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/14.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoryModel.h"

@interface StoryCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconimage;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *place;
- (void)stary:(StoryModel*)sender;

@end
