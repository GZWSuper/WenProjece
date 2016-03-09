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
    [GiFHUD setGifWithImageName:@"mc.gif"];
    // [self initCollectionView];
    
     
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
