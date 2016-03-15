//
//  CollectionViewCell.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/15.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoryModel.h"

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *text;
- (void)stary:(StoryModel*)sender;
@end
