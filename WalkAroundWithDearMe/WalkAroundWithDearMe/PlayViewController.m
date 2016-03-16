//
//  PlayViewController.m
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/15.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "PlayViewController.h"
#import "Define.h"
#import "AFNetworking.h"
#import "PlayTableViewCell.h"
#import "PlayModel.h"
#import "MainTwoViewController.h"
#import "PlayContextViewController1.h"

@interface PlayViewController ()

@end

@implementation PlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"PlayTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
   
}
- (void)createTableView {
    
    self.tableView = [[UITableView alloc]initWithFrame:(CGRectMake(0, 0, ViewFramWidth, ViewFramHeight)) style:(UITableViewStylePlain)];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    self.tableView.backgroundColor = Color2;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
}

- (void)loadDataSource {
    
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    
    [manger GET:_playUrl parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
     
        
        NSArray *items = responseObject[@"items"];
        
        self.dataSource = [PlayModel arrayOfModelsFromDictionaries:items error:nil];
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
    }];
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PlayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    PlayModel *model = self.dataSource[indexPath.row];
    
    [cell staryPlay:model];
    
    cell.backgroundColor = Color2;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 200;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    PlayContextViewController1 *vc = [[PlayContextViewController1 alloc]init];
    
    PlayModel *model = self.dataSource[indexPath.row];
    
    vc.playTwourl = model.playId;
    
    vc.playModel = model;
    
    [self.navigationController pushViewController:vc animated:YES];
    
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
