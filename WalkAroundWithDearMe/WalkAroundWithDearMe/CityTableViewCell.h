//
//  CityTableViewCell.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/15.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hottest_sitesModel.h"

@interface CityTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *Cover;
@property (weak, nonatomic) IBOutlet UILabel *name;
- (void)staryCity:(Hottest_sitesModel*)sender;
@end
