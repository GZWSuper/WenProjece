//
//  RecommendViewController.m
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/15.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "RecommendViewController.h"
#import "Define.h"
#import "UIWebView+AFNetworking.h"
#import <WebKit/WebKit.h>
#import "MMProgressHUD.h"
#import "MMLinearProgressView.h"
#import "GiFHUD.h"

@interface RecommendViewController ()<UIWebViewDelegate,WKNavigationDelegate>
@property (nonatomic,strong)UIWebView*myWebView;
@property (nonatomic,strong)NSTimer*timer;
@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [GiFHUD setGifWithImageName:@"ha.gif"];
    [GiFHUD show];
    self.view.backgroundColor=Color;
    
}
- (void)createWebView{
    NSURL*weburl=[NSURL URLWithString:_recommendUrl];
    self.navigationController.navigationBarHidden=NO;
    _myWebView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, ViewFramWidth, ViewFramHeight)];
    _myWebView.delegate=self;
    NSURLRequest*request=[NSURLRequest requestWithURL:weburl];
    [_myWebView loadRequest:request];
    [self.view addSubview:_myWebView];
    [GiFHUD dismiss];
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
