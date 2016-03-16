//
//  MainTwoViewController.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/16.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "BaseTableViewController.h"
#import "MainModel.h"

@interface MainTwoViewController : BaseTableViewController
@property (nonatomic,copy)NSString *twoMainUrl;

@property (nonatomic,strong)MainModel *model;
@end
