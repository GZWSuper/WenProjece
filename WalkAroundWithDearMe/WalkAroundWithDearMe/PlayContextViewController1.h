//
//  PlayContextViewController1.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/15.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "BaseTableViewController.h"
#import "PlayModel.h"

@interface PlayContextViewController1 : BaseTableViewController
@property (nonatomic,copy)NSString *playTwourl;

@property (nonatomic,strong)PlayModel *playModel;

@property (nonatomic,strong)NSString *str;
@end
