//
//  TheSecondViewController.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/14.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "BaseTableViewController.h"
#import "StoryModel.h"


@interface TheSecondViewController : BaseTableViewController
@property (nonatomic,strong)NSString *url;

@property (nonatomic,strong)NSString *name;

@property (nonatomic,strong)NSString *text;

@property (nonatomic,strong)NSString *location_name;

@property (nonatomic,strong)StoryModel *storymodel;


@property (nonatomic,strong)NSString *avatar_l;

@end
