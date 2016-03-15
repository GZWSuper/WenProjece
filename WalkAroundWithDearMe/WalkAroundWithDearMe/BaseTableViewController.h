//
//  BaseTableViewController.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/14.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView*tableView;
@property (nonatomic,strong)NSMutableArray*dataSource;
- (void)createTableView;
- (void)loadDataSource;
@end
