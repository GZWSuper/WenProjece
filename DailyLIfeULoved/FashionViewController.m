//
//  FashionViewController.m
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "FashionViewController.h"

@interface FashionViewController ()

@end

@implementation FashionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadWithStart:@"0"];
   
}

- (void)headerRefreshing{
    _IS_UP_PULL=NO;
    [self loadWithStart:@"0"];
    
}
- (void)footerRefreshing{
    _IS_UP_PULL=YES;
    [self loadWithStart:_currentPage];
}
- (void)loadWithStart:(NSString*)start{
    if (_IS_LOADING) {
        return;
    }
    _IS_LOADING=YES;
    [GetData getCategoryInfoWithParam:@"1" andFilter:@"byCategoryGroup" andStart:start andLimit:10 callBack:^(id model) {
        _IS_LOADING=NO;
        if(_IS_UP_PULL){
            [self.tableView footerEndRefreshing];
        }else{
            [self.tableView headerEndRefreshing];
        }
        if (!model) {
            return ;
        }
        DataModel*dataModel=(DataModel*)model;
        if (_IS_UP_PULL) {
            _currentPage=dataModel.next;
            
        }else{
            [_dataArray removeAllObjects];
            _currentPage=@"0";
        }
        static dispatch_once_t one;
        dispatch_once(&one, ^{
            _currentPage=dataModel.next;
        });
        _currentPage=dataModel.next;
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
