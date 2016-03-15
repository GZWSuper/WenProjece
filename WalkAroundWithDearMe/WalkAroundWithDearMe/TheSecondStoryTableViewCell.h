//
//  TheSecondStoryTableViewCell.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/14.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Detail_listModel.h"

@interface TheSecondStoryTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *largeImage;

@property (weak, nonatomic) IBOutlet UILabel *image_time;
@property (weak, nonatomic) IBOutlet UILabel *content;
- (void)staryTwoStoryView:(Detail_listModel*)sender;
@end
