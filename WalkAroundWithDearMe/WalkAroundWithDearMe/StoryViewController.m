//
//  StoryViewController.m
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/14.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "StoryViewController.h"
#import "Define.h"
#import "StoryModel.h"
#import "StoryCollectionViewCell.h"
#import "AFNetworking.h"
#import "TheSecondViewController.h"
#import "JHRefresh.h"
#import "GiFHUD.h"

@interface StoryViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong)NSMutableArray*dataSource;
@property (nonatomic,strong)UICollectionView*collectionView;
@property (nonatomic)BOOL isPullDown;


@property (nonatomic)BOOL isPullUp;
@end

@implementation StoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"精选故事";
    [GiFHUD setGifWithImageName:@"ha.gif"];
    [GiFHUD show];
    self.dataSource=[NSMutableArray array];
    [self createCollectionView];
    [self loadDataSource];
    [self createPullHeaderRefresh];
    [self createPullFooterRefresh];
    [self.collectionView headerStartRefresh];
    [self.collectionView registerNib:[UINib nibWithNibName:@"StoryCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cellID"];
}
- (void)createCollectionView{
    UICollectionViewFlowLayout*flowLayout=[[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumInteritemSpacing=10;
    flowLayout.minimumLineSpacing=5;
    flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
    flowLayout.itemSize=CGSizeMake(ViewFramWidth/2-20, 225);
    flowLayout.sectionInset=UIEdgeInsetsMake(20, 10, 50, 10);
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ViewFramWidth, ViewFramHeight) collectionViewLayout:flowLayout];
    [self.view addSubview:_collectionView];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    _collectionView.tag=100;
    _collectionView.backgroundColor=[UIColor colorWithRed:255/255.0 green:221/255.0 blue:213/255.0 alpha:1.0];
    
    
    
}
- (void)createPullHeaderRefresh{
    __weak StoryViewController*weakself=self;
    [self.collectionView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        _isPullDown=YES;
        [weakself loadDataSource];
    }];
}
- (void)endJHRefresh{
    if(_isPullDown){
        _isPullDown=NO;
        [self.collectionView headerEndRefreshingWithResult:(JHRefreshResultSuccess)];
    }
    if(_isPullUp){
        _isPullUp=NO;
        [self.collectionView footerEndRefreshing];
    }
}
- (void)createPullFooterRefresh{
    __weak StoryViewController*weakself=self;
    [self.collectionView addRefreshFooterViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        weakself.stare=weakself.stare+12;
        _isPullUp=YES;
        [weakself loadDataSource];
    }];
}
- (void)initData{
    self.stare=0;
}
- (void)loadDataSource{
    AFHTTPSessionManager*manger=[AFHTTPSessionManager manager];
    NSString*num=[NSString stringWithFormat:@"%ld",_stare];
    NSDictionary*dic=@{@"start":num};
    [manger GET:StoryUrl1 parameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary*data=responseObject[@"data"];
        NSArray*hot_spot_list=data[@"hot_spot_list"];
        if(_isPullDown){
            self.dataSource=[StoryModel arrayOfModelsFromDictionaries:hot_spot_list error:nil];
            
        }
        if(_isPullUp){
            [self.dataSource addObjectsFromArray:[StoryModel arrayOfModelsFromDictionaries:hot_spot_list error:nil]];
        }
        [self endJHRefresh];
        [self.collectionView reloadData];
        [GiFHUD dismiss];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self endJHRefresh];
    }];
    
    
}
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    StoryCollectionViewCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    StoryModel*model=self.dataSource[indexPath.row];
    [cell stary:model];
    cell.clipsToBounds=YES;
    cell.layer.cornerRadius=20;
    cell.backgroundColor=[UIColor colorWithRed:255/255.0 green:234/255.0 blue:233/255.0 alpha:1];
    return cell;
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.dataSource.count;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    StoryModel*model=self.dataSource[indexPath.row];
    TheSecondViewController*twoStory=[[TheSecondViewController alloc]init];
    twoStory.url=model.spot_id;
    twoStory.name=model.user.name;
    twoStory.location_name=model.user.location_name;
    twoStory.avatar_l=model.user.avatar_l;
    twoStory.text=model.text;
    twoStory.storymodel=model;
    [self.navigationController pushViewController:twoStory animated:YES];
    
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
