//
//  EveryDayViewController.m
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/6.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "EveryDayViewController.h"
#import "DataModel.h"
#import "AppModel.h"
#import "ImageModel.h"
#import "ArticleModel.h"
#import "AuthorModel.h"
#import "CategoryGroupModel.h"
#import "ArticleStatusModel.h"
#import "UIImageView+WebCache.h"
#import "EveryDayCollectionViewCell.h"
#import "ColorChange.h"
#import "WebViewController.h"
#import "GiFHUD.h"

@interface EveryDayViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>{
    NSMutableArray*_dataSource;
}

@end

@implementation EveryDayViewController
- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.tabBarController.tabBar.hidden=NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _dataSource=[[NSMutableArray alloc]init];
    [GiFHUD setGifWithImageName:@"mc.gif"];
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [GiFHUD dismiss];
}
- (void)getData{
    [GiFHUD show];
    [GetData getEveryDayAppInfoWithFilter:@"isHomepage" start:@"0" limit:15 callBack:^(id object) {
        if(!object){
            [GiFHUD  dismiss];
            return ;
        }
        [GiFHUD dismiss];
        _collectionView.delegate=self;
        _collectionView.dataSource=self;
        DataModel*dataModel=(DataModel*)object;
        [_dataSource addObjectsFromArray:dataModel.result];
        [_collectionView reloadData];
    }];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return  5;
}
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    EveryDayCollectionViewCell*cell=(EveryDayCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"reuse" forIndexPath:indexPath];
    return cell;
}
- (void)configureCell:(EveryDayCollectionViewCell*)cell withIndexPath:(NSIndexPath*)indexPath{
    AppModel*modelone=_dataSource[indexPath.section];
    NSArray*imageArr=modelone.image;
  
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
