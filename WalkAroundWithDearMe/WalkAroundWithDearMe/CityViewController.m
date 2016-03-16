//
//  CityViewController.m
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/15.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "CityViewController.h"
#import "Define.h"
#import "AFNetworking.h"
#import "NotMistackViewController.h"
#import "Hottest_sitesModel.h"
#import "CityModel.h"
#import "PhotoModel.h"
#import "CityTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "MainViewController.h"
#import "GuideViewController.h"
#import "RecommendViewController.h"
#import "PlayViewController.h"
#import "SearchViewController.h"
#import "CityTwoViewController.h"
#import "GiFHUD.h"

@interface CityViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)NSString *photo;

@property (nonatomic,strong)NSString *name;

@property (nonatomic,assign)NSInteger visited_count;

@property (nonatomic,strong)NSMutableArray *imageViewArr;

@property (nonatomic,strong)UIImageView *headImageView;

@property (nonatomic,strong)UIView *headerBackView;



@end

@implementation CityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [GiFHUD setGifWithImageName:@"ha.gif"];
    [GiFHUD show];
    UIBarButtonItem*backItem=[[UIBarButtonItem alloc]init];
    backItem.image=[UIImage imageNamed:@"leftIcon"];
    self.navigationController.navigationItem.backBarButtonItem=backItem;
    self.imageViewArr=[NSMutableArray array];
    self.photo=[[NSString alloc]init];
    self.name=[[NSString alloc]init];
    [self.tableView registerNib:[UINib nibWithNibName:@"CityTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
}
- (void)createTableView{
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ViewFramWidth, ViewFramHeight) style:UITableViewStylePlain];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
}
- (void)loadDataSource{
    AFHTTPSessionManager*manger=[AFHTTPSessionManager manager];
    [manger.requestSerializer setValue:@"BreadTrip/6.2.0/zh (iPhone8,1; iPhone OS9.2; zh-Hans-CN zh_CN)"  forHTTPHeaderField:@"User-Agent"];
    NSString*url=[NSString stringWithFormat:CityUrl,_type,_num];
    [manger GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray*hottest_sites=responseObject[@"hottest_sites"];
        self.dataSource=[Hottest_sitesModel arrayOfModelsFromDictionaries:hottest_sites error:nil];
        NSArray*hottest_places=responseObject[@"hottest_places"];
        NSDictionary*imageViewHead=hottest_places[0];
        _photo=imageViewHead[@"photo"];
        NSString*visited_count1=responseObject[@"visited_count"];
        _visited_count=[visited_count1 integerValue];
        _name=responseObject[@"name_orig"];
        [self layoutHeaderImageView];
        
        [self createLable];
        [self.tableView reloadData];
        [GiFHUD dismiss];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
          NSLog(@"%@",error);
    }];
}
- (void)createLable{
    UILabel*lab=[[UILabel alloc]initWithFrame:CGRectMake(20, 330, 130, 40)];
    lab.text=[NSString stringWithFormat:@"%@",_name];
    lab.font=[UIFont systemFontOfSize:27.0];
    lab.textColor=[UIColor whiteColor];
    [self.tableView addSubview:lab];
    UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(130, 330, 100, 40)];
    
    lable1.text = [NSString stringWithFormat:@"%ld人去过",_visited_count];
    
    lable1.font = [UIFont systemFontOfSize:14.0];
    
    lable1.textColor = [UIColor whiteColor];
    
    
    [self.tableView addSubview:lable1];
    
    
}
- (void)layoutHeaderImageView{
    _headerBackView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 500)];
    _headerBackView.backgroundColor=Color2;
    self.tableView.tableHeaderView=_headerBackView;
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:_photo] placeholderImage:[UIImage imageNamed:@"xixi"]];
    self.headImageView.contentMode=UIViewContentModeScaleAspectFill;
    self.headImageView.clipsToBounds=YES;
    [_headerBackView addSubview:self.headImageView];
     UILabel *lable = [[UILabel alloc]initWithFrame:(CGRectMake((ViewFramWidth-100)/2, 460, 100, 40))];
    lable.text=@"热门地点";
    lable.font = [UIFont systemFontOfSize:22.0];
    
    lable.tintColor = Color;
    
    lable.tintColor = [UIColor grayColor];
    
    [_headerBackView addSubview:lable];
    NSArray*arrBrtton=@[@"推荐",@"游记",@"指南"];
    for(int i=0;i<3;i++){
        UIButton*btn=[UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:arrBrtton[i] forState:UIControlStateNormal];
        btn.frame=CGRectMake(100*i+ViewFramWidth/3-60, 410, 50, 40);
        btn.backgroundColor=Color;
        btn.clipsToBounds=YES;
        btn.layer.cornerRadius=20;
        btn.tag=10+i;
        btn.tintColor=[UIColor whiteColor];
        [btn addTarget:self action:@selector(staryButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.headerBackView addSubview:btn];
    }
}
- (void)staryButton:(UIButton*)sender{
    switch (sender.tag) {
        case 10:{
           RecommendViewController *vc = [[RecommendViewController alloc]init];
            vc.recommendUrl=[NSString stringWithFormat:RecommendUrl,_type,_num];
            [self.navigationController pushViewController:vc animated:YES];
        }
             break;
        case 11:{
            PlayViewController*vc=[[PlayViewController alloc]init];
            vc.playUrl=[NSString stringWithFormat:PlayUrl,_type,_num];
            [self.navigationController pushViewController:vc animated:YES];
        }
             break;
        case 12:{
            GuideViewController *vc = [[GuideViewController alloc]init];
            
            vc.guideUrl = [NSString stringWithFormat:CityGuideUrl,_type,_num];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        default:
            break;
        
        }
            
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat width=self.view.frame.size.width;
    CGFloat yOffset=scrollView.contentOffset.y;
    if(yOffset<0){
        CGFloat totalOffset=400+ABS(yOffset);
        CGFloat f=totalOffset/400;
        self.headImageView.frame=CGRectMake(-(width*f-width)/2, yOffset, width*f, totalOffset);
    }
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CityTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cellID"];
    Hottest_sitesModel*model=self.dataSource[indexPath.row];
    [cell staryCity:model];
    cell.backgroundColor=Color2;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 230;
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    Hottest_sitesModel*model=self.dataSource[indexPath.row];
    CityTwoViewController*vc=[[CityTwoViewController alloc]init];
    vc.num=[NSString stringWithFormat:@"%lu",(long)model.id
            ];
    vc.type=[NSString stringWithFormat:@"%lu",(long)model.type];
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
