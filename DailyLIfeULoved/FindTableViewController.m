//
//  FindTableViewController.m
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "FindTableViewController.h"
#import "WebViewController.h"
#import "CategoryViewController.h"
#import "GetData.h"
#import "DataModel.h"
#import "AppModel.h"
#import "ImageModel.h"
#import "FirstTableViewCell.h"
#import "OtherTableViewCell.h"
#import "ColorChange.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "GiFHUD.h"


@interface FindTableViewController ()
{
    NSMutableArray * _reDataArray;
}

@end

@implementation FindTableViewController
- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.tabBarController.tabBar.hidden=NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _IS_LOADING=NO;
    _reDataArray=[[NSMutableArray alloc]init];
    [GiFHUD setGifWithImageName:@"mc.gif"];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)viewWillDisappear:(BOOL)animated{
    [GiFHUD dismiss];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)registCellId{
    [self.tableView registerNib:[UINib nibWithNibName:@"FirstTableViewCell" bundle:nil] forCellReuseIdentifier:@"firstCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"OtherTableViewCell" bundle:nil] forCellReuseIdentifier:@"otherCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ImageTableViewCell" bundle:nil] forCellReuseIdentifier:@"imageCell"];
    UIImageView*imageV=[[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    imageV.image=[UIImage imageNamed:@"bg.png"];
    [self.view addSubview:imageV];
    [self.view sendSubviewToBack:imageV];
}
- (void)getData{
    [GiFHUD show];
    [GetData getEveryDayAppInfoWithFilter:@"isFocus" start:@"0" limit:1 callBack:^(id model) {
        if(!model){
            [GiFHUD dismiss];
            return ;
        }
        [GiFHUD dismiss];
        DataModel*reDataModel=(DataModel*)model;
        _num=reDataModel.next;
        _currentPage=_num;
        [_reDataArray addObjectsFromArray:reDataModel.result];
        [self.tableView reloadData];
        [self loadWithStart:_currentPage];
    }];
}
- (void)setRefresh{
    [self.tableView addHeaderWithTarget:self action:@selector(headerRefreshing) dateKey:@"table"];
    self.tableView.headerRefreshingText=@"刷新中";
    [self.tableView addFooterWithTarget:self action:@selector(footerRefreshing)];
    self.tableView.footerRefreshingText=@"数据加载中";
    
}
-(void)headerRefreshing
{
    _IS_UP_PULL = NO;
    [self loadWithStart:_num];
}
- (void)footerRefreshing{
    _IS_UP_PULL=YES;
    if ([_currentPage isEqualToString:@"0"]) {
        self.tableView.footerRefreshingText=@"没有更多了";
        [self.tableView footerEndRefreshing];
    }else{
        self.tableView.footerRefreshingText=@"加载中";
        [self loadWithStart:_currentPage];
    }
}
- (void)loadWithStart:(NSString*)start{
    if(_IS_LOADING){
        return;
    }
    _IS_LOADING=YES;
    [GetData getEveryDayAppInfoWithFilter:@"isHomepage" start:start limit:15 callBack:^(id findModel) {
        [GiFHUD dismiss];
        if(_IS_UP_PULL){
            [self.tableView footerEndRefreshing];
        }else{
            [self.tableView headerEndRefreshing];
        }
        if (!findModel) {
            return ;
        }
        DataModel*reDataModel=(DataModel*)findModel;
        if (_IS_UP_PULL) {
            _currentPage=reDataModel.next;
        }else{
            [_reDataArray removeObjectsInRange:NSMakeRange(1, _reDataArray.count-1)];
            _currentPage=_num;
        }
        static dispatch_once_t onece;
        dispatch_once(&onece,^{
            _currentPage=reDataModel.next;
        });
        _currentPage=reDataModel.next;
        [_reDataArray addObjectsFromArray:reDataModel.result];
        [self.tableView reloadData];
        
    }];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _reDataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AppModel*model=_reDataArray[indexPath.row];
    if (indexPath.row==0) {
        FirstTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"firstCell" forIndexPath:indexPath];
        NSArray*imageArray=model.image;
        [cell.imgV sd_setImageWithURL:[NSURL URLWithString:((ImageModel*)imageArray[0]).url] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        cell.titleLab.text=model.article.title;
        cell.classLab.text=model.category.categoryGroup.name;
        cell.classLab.textColor=[ColorChange colorString:model.category.categoryGroup.color];
        for(NSInteger i=0;i<5;i++){
            [((UIButton*)[cell viewWithTag:i+1])addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        }
        cell.nameLab.text=model.author.name;
        return cell;
    }else{
        OtherTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"otherCell" forIndexPath:indexPath];
        NSArray*imageArr=model.image;
        [cell.imagV sd_setImageWithURL:[NSURL URLWithString:((ImageModel*)imageArr[2]).url] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        cell.titileLab.text=model.article.title;
        cell.classLab.text=model.category.categoryGroup.name;
        cell.classLab.textColor=[ColorChange colorString:model.category.categoryGroup.color];
        cell.authorLab.text=model.author.name;
        cell.browseLab.text=model.article.articleStats.read;
        [((UIButton *)[cell viewWithTag:indexPath.row + 1]) addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
        
      
    }
    
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==0){
       return  [UIScreen mainScreen].bounds.size.height / 2;
    }else{
        return [UIScreen mainScreen].bounds.size.height / 6;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AppModel*appModel=_reDataArray[indexPath.row];
    ArticleModel*articleModel=appModel.article;
    ArticleStatusModel*articleStatsModle=articleModel.articleStats;
    NSString*webUrl=articleModel.url;
    NSString*like=articleStatsModle.like;
    NSString*favorite=articleStatsModle.favorite;
    NSString*comment=articleStatsModle.comment;
    NSArray*infoArr=@[webUrl,like,favorite,comment];
    NSUserDefaults*defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:infoArr forKey:@"webUrl"];
    [defaults synchronize];
    UIStoryboard*story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    WebViewController*webview=[story instantiateViewControllerWithIdentifier:@"webView"];
    [self.navigationController pushViewController:webview animated:YES];
    
}
- (void)btnClicked:(UIButton *)btn{
    CategoryViewController*categoryVC=[[CategoryViewController alloc]init];
    [self.navigationController pushViewController:categoryVC animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
