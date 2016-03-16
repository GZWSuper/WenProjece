//
//  GuideViewController.m
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/15.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "GuideViewController.h"
#import "CityViewController.h"
#import "UIWebView+AFNetworking.h"
#import "Define.h"

@interface GuideViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView*myWebView;
@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        self.view.backgroundColor = Color;
    [self createWebView];
}
- (void)createWebView{
    NSURL*webView=[NSURL URLWithString:_guideUrl];
    self.navigationController.navigationBarHidden=NO;
    _myWebView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, ViewFramWidth, ViewFramHeight)];
    _myWebView.delegate=self;
    NSURLRequest*request=[NSURLRequest requestWithURL:webView];
    [_myWebView loadRequest:request];
    [self.view addSubview:_myWebView];
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
