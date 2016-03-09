//
//  BaseTableViewController.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"
#import "MJRefresh.h"
#import "AppModel.h"
#import "UIImageView+WebCache.h"
#import "ColorChange.h"
#import "WebViewController.h"
#import "DataModel.h"
#import "GetData.h"

@interface BaseTableViewController : UITableViewController
{
    NSMutableArray * _dataArray;
    NSString * _currentPage;
    NSString * _num;
    BOOL _IS_LOADING;
    BOOL _IS_UP_PULL;
}

@end
