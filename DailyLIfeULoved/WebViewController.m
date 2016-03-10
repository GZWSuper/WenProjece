//
//  WebViewController.m
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "WebViewController.h"
#import "GiFHUD.h"
#import "AuthorTableViewController.h"

@interface WebViewController ()<WKNavigationDelegate>
{
    NSArray * _infoArray;
    NSInteger i,j;
}
@property (nonatomic,strong)WKWebView*webView;
@end

@implementation WebViewController
@synthesize webView;

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.tabBarController.tabBar.hidden=YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    i=0;j=0;
    self.webView=[[WKWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height+120)];
    [GiFHUD setGifWithImageName:@"mc.gif"];
    self.webView.allowsBackForwardNavigationGestures=YES;
    [self.view addSubview:self.webView];
    [self.view sendSubviewToBack:self.webView];
    self.webView.navigationDelegate=self;
    [(UIScrollView*)[[self.webView subviews] objectAtIndex:0]setBounces:NO];
    [self requestWebView];
    [self initToolBar];
    
}
- (void)requestWebView{
    NSUserDefaults*defau=[NSUserDefaults standardUserDefaults];
    _infoArray=[defau objectForKey:@"webUrl"];
    NSURL*url=[NSURL URLWithString:_infoArray[0]];
    NSURLRequest*requst=[NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requst];
    
}
- (void)initToolBar{
    self.likeLab.text=_infoArray[1];
    self.collectLab.text=_infoArray[2];
    self.commenLab.text=_infoArray[3];
    [self.likeBtn setBackgroundImage:[UIImage imageNamed:@"tool_1_selected"] forState:UIControlStateSelected];
    
    [self.collectBtn  setBackgroundImage:[UIImage imageNamed:@"tool_2_selected"] forState:UIControlStateSelected];
}


- (IBAction)likeBtnClicked:(id)sender {
    i++;
    if(i%2==0){
        self.likeBtn.selected=NO;
        self.likeLab.text=_infoArray[1];
    }else{
        self.likeBtn.selected=YES;
        self.likeLab.text=[NSString stringWithFormat:@"%ld",((NSString*)_infoArray[1]).integerValue+1];
    }
}


- (IBAction)collectBtnClicked:(id)sender {
    j++;
    if(j%2==0){
        self.collectBtn.selected=NO;
        self.collectLab.text=_infoArray[2];
    }else{
        self.collectBtn.selected=YES;
        self.collectLab.text=[NSString stringWithFormat:@"%ld",((NSString*)_infoArray[2]).integerValue+1];
    }
}
- (IBAction)commentBtnClicked:(id)sender {
}
- (IBAction)back:(id)sender {
    [GiFHUD dismiss];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    [GiFHUD show];
}
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    [GiFHUD dismiss];
}
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    [GiFHUD dismiss];
    UIButton*btn=[UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame=CGRectMake([UIScreen mainScreen].bounds.size.width/2-50, [UIScreen mainScreen].bounds.size.height/2-20, 100, 40);
    [btn setTitle:@"reload" forState:UIControlStateNormal];
    btn.titleLabel.textAlignment=NSTextAlignmentCenter;
    btn.titleLabel.adjustsFontSizeToFitWidth=YES;
    [btn addTarget:self action:@selector(requestWebView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
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
