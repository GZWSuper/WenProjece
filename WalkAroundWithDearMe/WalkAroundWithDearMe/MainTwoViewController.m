//
//  MainTwoViewController.m
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/16.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "MainTwoViewController.h"
#import "AFNetworking.h"
#import "Define.h"
#import "MainTwoTableViewCell.h"
#import "DaysModel.h"
#import "MainTwoDaysModel.h"
#import "UIImageView+WebCache.h"
#import "DBManger.h"
#import "GiFHUD.h"
@interface MainTwoViewController ()
@property (nonatomic,strong)NSMutableArray *textArr;


@property (nonatomic,strong)NSMutableArray *dataSourceCell;

@property (nonatomic,strong)NSMutableArray *daysArr;

@property (nonatomic,strong)NSMutableArray *Arr;
@end

@implementation MainTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [GiFHUD setGifWithImageName:@"ha.gif"];
    [GiFHUD show];
    self.dataSourceCell=[NSMutableArray array];
    self.textArr=[NSMutableArray array];
    self.Arr=[NSMutableArray array];
    self.daysArr=[NSMutableArray array];
    [self.tableView registerNib:[UINib nibWithNibName:@"MainTwoTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
    self.tableView.estimatedRowHeight=500;
       [self cretLikeButton];
    
}
- (void)createTableView{
    self.tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
}
- (void)loadDataSource{
    AFHTTPSessionManager*manger=[AFHTTPSessionManager manager];
    NSString*mainTwoViewUrl=[NSString stringWithFormat:MainTwoUrl,_twoMainUrl];
    NSLog(@"%@",mainTwoViewUrl);//2387084628
    [manger GET:mainTwoViewUrl parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray*days=responseObject[@"days"];
        self.daysArr=[MainTwoDaysModel arrayOfModelsFromDictionaries:days  error:nil];
        for(NSDictionary*daysObj in  days){
            NSArray*waypoints=daysObj[@"waypoints"];
            NSError*err=nil;
            self.textArr=[DaysModel arrayOfModelsFromDictionaries:waypoints error:&err];
            [self.dataSource addObject:self.textArr];
        }
        [self.tableView reloadData];
        [GiFHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
        NSLog(@"%@",error);
    
    }];
     
}
- (void)cretLikeButton{
    UINavigationItem*item=self.navigationItem;
    UIImage*iamge=[[UIImage imageNamed:@"iconfont-dianzan"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem*barItem=[[UIBarButtonItem alloc]initWithImage:iamge style:UIBarButtonItemStylePlain target:self action:@selector(starySeach1:)];
    item.rightBarButtonItem=barItem;
}
- (void)starySeach1:(UIBarButtonItem*)barSearch{
    BOOL ret=[[DBManger shareManger]isExistInfoForid:nil mainId:_model.eid playId:nil];
    if(ret){
       [[DBManger shareManger ]deleteModelForMain:_model.eid
        ];
        ret=NO;
    }else{
        [[DBManger shareManger]insertMainModel:_model];
        ret=YES;
    }
    [self setFavouriteButton:barSearch isFavourite:ret];
    
}
- (void)setFavouriteButton:(UIBarButtonItem*)button isFavourite:(BOOL)isFavourite{
    UIImage*favouriteImage=[[UIImage imageNamed:@"iconfont-iconfontlike"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage*deFavouriteImage=[[UIImage imageNamed:@"iconfont-dianzan"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [button setImage:isFavourite?favouriteImage:deFavouriteImage];
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainTwoTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cellID"];
    DaysModel*model=self.dataSource[indexPath.section][indexPath.row];
    [cell staryMain:model];
     cell.backgroundColor = [UIColor colorWithRed:255/255.0 green:240/255.0 blue:236/255.0 alpha:1.0];
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource[section] count];
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView*headerSectionView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ViewFramWidth, 70)];
    headerSectionView.backgroundColor = [UIColor colorWithRed:255/255.0 green:234/255.0 blue:233/255.0 alpha:1];
    UIImageView*imageview=[[UIImageView alloc]initWithFrame:CGRectMake(20, 18, 30, 30)];
    imageview.image=[UIImage imageNamed:@"dateIcon"];
    [headerSectionView addSubview:imageview];
    MainTwoDaysModel*model=self.daysArr[section];
    NSString*title=[NSString stringWithFormat:@"%@ 第%ld天",model.date,section+1];
    UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(70, 10, ViewFramWidth-70, 50)];
    [headerSectionView addSubview:label];
    label.text=title;
    return headerSectionView;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 70;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
