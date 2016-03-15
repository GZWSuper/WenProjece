//
//  MainViewController.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/14.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "BaseTableViewController.h"


@interface MainViewController : BaseTableViewController
@property (nonatomic,strong)NSString*storyImage;
@property (nonatomic,strong)NSString*text;
@property (nonatomic,assign)NSInteger next_start;


@end
