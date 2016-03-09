//
//  AuthorTableViewController.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuthorTableViewController : UITableViewController
{
    NSString * _currentPage;
    NSString * _num;
    BOOL _IS_LOADING;
    BOOL _IS_UP_PULL;
}

@end
