//
//  TourViewController.m
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "TourViewController.h"

@interface TourViewController ()

@end

@implementation TourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self loadWithSatrt:0];
}
- (void)headerRefreshing{
    _IS_UP_PULL=NO;
     [self loadWithSatrt:0];
}
- (void)footerRefreshing{
    _IS_UP_PULL=NO;
     [self loadWithSatrt:_currentPage];
}
-(void)loadWithSatrt:(NSString *)start
{
    if (_IS_LOADING) {
        return;
    }
    _IS_LOADING = YES;
    [GetData getCategoryInfoWithParam:@"4" andFilter:@"byCategoryGroup" andStart:start andLimit:10 callBack:^(id model) {
        
    
        _IS_LOADING = NO;
        if (_IS_UP_PULL) {
            [self.tableView footerEndRefreshing];
        }else{
            [self.tableView headerEndRefreshing];
        }
        if (!model) {
            return ;
        }
        
        DataModel * dataModel = (DataModel *)model;
        
        if (_IS_UP_PULL) {
            _currentPage = dataModel.next;
        }else{
            [_dataArray removeAllObjects];
            _currentPage = 0;
        }
        static dispatch_once_t four;
        dispatch_once(&four, ^{
            _currentPage = dataModel.next;
        });
        _currentPage = dataModel.next;
        [_dataArray addObjectsFromArray:dataModel.result];
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
