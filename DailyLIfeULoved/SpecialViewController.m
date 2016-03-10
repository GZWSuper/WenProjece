//
//  SpecialViewController.m
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "SpecialViewController.h"
#import "SpecialCollectionViewCell.h"
#import "FirstCollectionViewCell.h"
#import "GetData.h"
#import "SpeDataModel.h"
#import "SpeAppModel.h"
#import "CategoryGroupModel.h"
#import "UIImageView+WebCache.h"
#import "ColorChange.h"
#import "ScDataModel.h"
#import "SpecArticleModel.h"
#import "AuthorTableViewController.h"
#import "MJRefresh.h"
#import "GiFHUD.h"

@interface SpecialViewController ()
{
    NSMutableArray * _speDataArray;
    NSMutableArray * _authorDataArray;
    UICollectionView * _collectionView;
    UIScrollView * _scrollView;
    NSString * _num;
    CADisplayLink * _timer;
    NSInteger _ftp;
    NSInteger _currentPage;
    BOOL _IS_UP;
    
}

@end

@implementation SpecialViewController
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=NO;
    self.tabBarController.tabBar.hidden=NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTimer];
    _speDataArray=[[NSMutableArray alloc]init];
    _authorDataArray=[[NSMutableArray alloc]init];
    //[GiFHUD setGifWithImageName:@"mc.gif"];
    [self initCollectionView];
    
     
}
- (void)viewWillDisappear:(BOOL)animated{
    [GiFHUD dismiss];
}
- (void)initTimer{
    _ftp=0;
    _currentPage=0;
    _IS_UP=YES;
    if(_timer==nil){
        _timer=[CADisplayLink displayLinkWithTarget:self selector:@selector(ftpUpdate)];
        _timer.frameInterval=5;
        [_timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        
    }
    UIImageView*imgV=[[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    imgV.image=[UIImage imageNamed:@"bg.png"];
    [self.view addSubview:imgV];
    [self.view sendSubviewToBack:imgV];
}
- (void)ftpUpdate{
    _ftp++;
    if(_ftp>36){
        [self con];
        _ftp=0;
    }
}
- (void)con{
    if(_IS_UP){
        _currentPage++;
        if(_currentPage>3)_IS_UP=NO;
    }else{
        _currentPage--;
        if(_currentPage<1)_IS_UP=YES;
    }
    [UIView animateWithDuration:0.5 animations:^{
        _scrollView.contentOffset=CGPointMake(_scrollView.frame.size.width*_currentPage, 0);
    }];
}
- (void)initCollectionView{
    UICollectionViewFlowLayout*flowout=[[UICollectionViewFlowLayout alloc]init];
    flowout.scrollDirection=UICollectionViewScrollDirectionVertical;
    flowout.minimumLineSpacing=10;
    flowout.minimumInteritemSpacing=10;
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-108) collectionViewLayout:flowout];
    _collectionView.backgroundColor=[UIColor clearColor];
    _collectionView.showsVerticalScrollIndicator=NO;
    [self.view addSubview:_collectionView];
    [self registedCell];
    [self getData:@"0"];
    
    
}
- (void)registedCell{
    [_collectionView registerNib:[UINib nibWithNibName:@"SecionHeaderCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionHeaderId"];
    [_collectionView registerNib:[UINib nibWithNibName:@"FirstCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"firstCellId"];
    [_collectionView registerNib:[UINib nibWithNibName:@"SpecialCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"speCellId"];
    
}
- (void)getData:(NSString*)start{
    [GiFHUD show];
    [GetData getSpecialAppInfosWithFilter:@"isFocus" start:@"0" limit:5 callBack:^(id  scModel) {
        if(!scModel){
            [GiFHUD dismiss];
            return ;
        }
        [GiFHUD dismiss];
        _collectionView.delegate=self;
        _collectionView.dataSource=self;
        ScDataModel*scDaModel=(ScDataModel*)scModel;
        [_speDataArray addObject:scDaModel.result];
        [_collectionView reloadData];
        [self loadWithStart:@"0"];
    }];
}
- (void)loadWithStart:(NSString *)start{
   [GetData getSpecialAppInfosWithFilter:@"isDiscovery" start:start limit:10 callBack:^(id model) {
       if(!model){
           return ;
       }
       SpeDataModel*spDataModel=(SpeDataModel*)model;
       [_speDataArray addObject:spDataModel.result];
       _num=spDataModel.next;
       [_collectionView reloadData];
       [self getTwoData];
       
   }];
}
- (void)getTwoData{
    [GetData getSpecialAppInfosWithFilter:@"isDiscovery" start:_num limit:10 callBack:^(id speModel) {
        if(!speModel){
            return ;
        }
        SpeDataModel*speDataModel=(SpeDataModel*)speModel;
        [_speDataArray addObject:speDataModel.result];
        [_collectionView reloadData];
        
    }];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(section==0){
        return 1;
        
    }
    return [_speDataArray[section] count];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return _speDataArray.count;
}
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0){
        FirstCollectionViewCell*firstCell=[collectionView dequeueReusableCellWithReuseIdentifier:@"firstCellId" forIndexPath:indexPath];
        _scrollView=firstCell.scrollView;
        firstCell.scrollView.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width*5, [UIScreen mainScreen].bounds.size.height);
        firstCell.scrollView.pagingEnabled=YES;
        firstCell.scrollView.delegate=self;
        for(NSInteger i=0;i<5;i++){
        UIImageView*imagview=[[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width*i, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/3)];
        imagview.userInteractionEnabled=YES;
        ScResultModel*scModel=_speDataArray[indexPath.section][i];
            [imagview sd_setImageWithURL:[NSURL URLWithString:scModel.article.author.image] placeholderImage:[UIImage imageNamed:@"placeholder"]];
            [firstCell.scrollView addSubview:imagview];
        }
        return firstCell;
    }else {
        SpecialCollectionViewCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"speCellId" forIndexPath:indexPath];
        cell.layer.borderWidth=2;
        cell.layer.borderColor=[UIColor lightGrayColor].CGColor;
        SpeAppModel*appModel=(_speDataArray[indexPath.section])[indexPath.row];
        [cell.headImge sd_setImageWithURL:[NSURL URLWithString:appModel.author.avatar] placeholderImage:[UIImage imageNamed:@"icon_user_place"]];
        cell.titleLabel.text=appModel.author.name;
        cell.intextLabel.text=appModel.article.article.title;
        NSArray*category=appModel.category;
        cell.cateLabel.text=((CategoryModel*)category[0]).categoryGroup.name;
        cell.cateLabel.textColor=[ColorChange colorString:((CategoryModel *)category[0]).categoryGroup.color];
        return cell;
        
    }
}
- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView*view=nil;
    if(kind==UICollectionElementKindSectionHeader){
        view=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionHeaderId" forIndexPath:indexPath];
        if(indexPath.section==1){
           ((UILabel*)[view viewWithTag:100]).text=@"最近更新";
        }else{
            ((UILabel*)[view viewWithTag:100]).text=@"推荐专栏";
        }
    }
    return view;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/3);
    }
    return CGSizeMake(([UIScreen mainScreen].bounds.size.width-40)/2, ([UIScreen mainScreen].bounds.size.width-20)/2);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if(section==0){
        return UIEdgeInsetsMake(0, 0, 10, 0);
    }else  return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSUserDefaults*defau=[NSUserDefaults standardUserDefaults];
    [defau setObject:((SpeAppModel*)(_speDataArray[indexPath.section])[indexPath.row]).author.authorId forKey:@"authorId"];
    [defau synchronize];
    UIStoryboard*story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AuthorTableViewController*author=[story instantiateViewControllerWithIdentifier:@"authorId"];
    [self.navigationController pushViewController:author animated:YES];
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
