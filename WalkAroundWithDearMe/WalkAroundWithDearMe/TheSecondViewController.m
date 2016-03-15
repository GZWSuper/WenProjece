//
//  TheSecondViewController.m
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/14.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "TheSecondViewController.h"
#import "Define.h"
#import "AFNetworking.h"
#import "GiFHUD.h"
#import "TheSecondStoryTableViewCell.h"
#import "UserModel.h"
#import "Detail_listModel.h"
#import "UIImageView+WebCache.h"
#import "JHRefresh.h"
#import "DBManger.h"

@interface TheSecondViewController ()

@end

@implementation TheSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [GiFHUD setGifWithImageName:@"ha.gif"];
    [GiFHUD show];
    self.title=@"故事详情";
    [self headerView];
    [self.tableView registerNib:[UINib nibWithNibName:@"TheSecondStoryTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
    [self createLikeBtn];
}
- (void)createTableView{
    self.tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.estimatedRowHeight=500;
    [self.view addSubview:self.tableView];
}
- (void)createLikeBtn{
    UINavigationItem*item=self.navigationItem;
    UIImage*image=[[UIImage imageNamed:@"iconfont-dianzan"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem*barItem=[[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(starySeach1:)];
    item.rightBarButtonItem=barItem;
    
}
- (void)starySeach1:(UIBarButtonItem*)barSeach{
    BOOL ret=[[DBManger shareManger] isExistInfoForid:_storymodel.spot_id mainId:nil playId:nil];
    if(ret){
        [[DBManger shareManger] deleteModelForStory:_storymodel.spot_id];
        ret=NO;
    }else{
        [[DBManger shareManger]insertModel:_storymodel];
        ret=YES;
    }
    [self setFavouriteButton:barSeach isFavoriteImage:ret];
    
}
- (void)setFavouriteButton:(UIBarButtonItem*)button isFavoriteImage:(BOOL)isFavourite{
    UIImage*favouriteImage=[[UIImage imageNamed:@"iconfont-iconfontlike"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage*deFavouritrImage=[[UIImage imageNamed:@"iconfont-dianzan"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [button setImage:isFavourite ? favouriteImage : deFavouritrImage ];
    

}
- (void)headerView{
    UIView*view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ViewFramWidth, 140)];
    view.backgroundColor=[UIColor colorWithRed:255/255.0 green:221/255.0 blue:213/255.0 alpha:1.0];
    UIImageView*headImage=[[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 30, 30)];
    headImage.clipsToBounds=YES;
    headImage.layer.cornerRadius=15;
    [headImage sd_setImageWithURL:[NSURL URLWithString:_avatar_l] placeholderImage:nil];
    UILabel*name=[[UILabel alloc]initWithFrame:(CGRectMake(55, 10, 70, 30))];
    name.text=_name;
    name.font=[UIFont systemFontOfSize:12];
    UILabel*location=[[UILabel alloc]initWithFrame:CGRectMake(20, 45, ViewFramWidth-10, 30)];
    location.text=_location_name;
    UILabel*text=[[UILabel alloc]initWithFrame:CGRectMake(20, 80, ViewFramWidth-30, 30)];
    text.text=_text;
    text.numberOfLines=0;
    text.font=[UIFont systemFontOfSize:15];
    [view addSubview:headImage];
    [view addSubview:name];
    [view addSubview:location];
    
    [view addSubview:text];
    self.tableView.tableHeaderView=view;
    
}
- (void)loadDataSource{
    AFHTTPSessionManager*manger=[AFHTTPSessionManager manager];
    NSString*storyTwoUrl=[NSString stringWithFormat:StoryTwoUrl,_url];
    [manger GET:storyTwoUrl parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary*data=responseObject[@"data"];
        NSDictionary*spot=data[@"spot"];
        NSArray*detail_list=spot[@"detail_list"];
        self.dataSource=[Detail_listModel arrayOfModelsFromDictionaries:detail_list error:nil];
        [self.tableView reloadData];
        [GiFHUD dismiss];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TheSecondStoryTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cellID"];
    Detail_listModel*model=self.dataSource[indexPath.row];
    [cell staryTwoStoryView:model];
    cell.backgroundColor=[UIColor colorWithRed:255/255.0 green:234/255.0 blue:233/255.0 alpha:1];
    return cell;
                                      
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
