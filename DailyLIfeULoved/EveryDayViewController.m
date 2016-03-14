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
    [self getData];
    UIImageView*imgV=[[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    imgV.image=[UIImage imageNamed:@"bg.png"];
    [self.view addSubview:imgV];
    [self.view sendSubviewToBack:imgV];
    
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
       // _collectionView.pagingEnabled=YES;
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
    [self configureCell:cell withIndexPath:indexPath];
    return cell;
}
- (void)configureCell:(EveryDayCollectionViewCell*)cell withIndexPath:(NSIndexPath*)indexPath{
    AppModel*modelone=_dataSource[indexPath.section];
    NSArray*imageArr=modelone.image;
    [cell.imagv sd_setImageWithURL:[NSURL URLWithString:((ImageModel*)imageArr[0]).url] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    cell.titleLab.text=modelone.article.title;
    NSString*authorStr=[NSString stringWithFormat:@"• %@ %@",modelone.category.categoryGroup.name,modelone.author.name];
    NSMutableAttributedString*nameStr=[[NSMutableAttributedString alloc]initWithString:authorStr];
    [nameStr addAttribute:NSForegroundColorAttributeName value:[ColorChange colorString:modelone.category.categoryGroup.color] range:NSMakeRange(0, 4)];
    [cell.classNameLab setAttributedText:nameStr];
    //cell.btnLan.clipsToBounds=YES;
    //cell.btnLan.layer.cornerRadius=34;
    cell.layer.masksToBounds=YES;
    NSInteger createTime=modelone.article.createdTime.integerValue;
    NSDate*date=[NSDate dateWithTimeIntervalSince1970:createTime/1000+(3600*8)];
    NSDateFormatter*dateFormatter=[[NSDateFormatter alloc]init];
    dateFormatter.dateFormat=@"yyyy-MM-dd";
    NSString*dataStr=[dateFormatter stringFromDate:date];
    NSArray*dateArray=[dataStr componentsSeparatedByString:@"-"];
    cell.dayLab.text=dateArray.lastObject;
    cell.dateLab.text=[NSString stringWithFormat:@"%@ %@",dateArray[1],dateArray[0]];
    
  
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    AppModel*appmodel=_dataSource[indexPath.section];
    ArticleModel*articlemodel=appmodel.article;
    ArticleStatusModel*articlestatusmodel=articlemodel.articleStats;
    NSString*webUrl=articlemodel.url;
    NSString*like=articlestatusmodel.like;
    NSString*favorite=articlestatusmodel.favorite;
    NSString*comment=articlestatusmodel.comment;
    NSArray*infoArr=@[webUrl,like,favorite,comment];
    NSUserDefaults*defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:infoArr forKey:@"webUrl"];
    [defaults synchronize];
    UIStoryboard*story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    WebViewController*webview=[story instantiateViewControllerWithIdentifier:@"webView"];
    [self.navigationController pushViewController:webview animated:YES];
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
