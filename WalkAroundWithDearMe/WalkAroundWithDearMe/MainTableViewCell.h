//
//  MainTableViewCell.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/15.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainModel.h"
@interface MainTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UILabel *days;
@property (weak, nonatomic) IBOutlet UILabel *place;
@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
- (void)staryMainModel:(MainModel*)sender;
@end
