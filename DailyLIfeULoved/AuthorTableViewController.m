//
//  AuthorTableViewController.m
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "AuthorTableViewController.h"
#import "GetData.h"
#import "FirstAuthorTableViewCell.h"
#import "OtherTableViewCell.h"
#import "DeAuthorModel.h"
#import "DeResultModel.h"
#import "UIImageView+WebCache.h"
#import "ColorChange.h"
#import "MJRefresh.h"
#import "ArticleModel.h"
#import "SpecArticleModel.h"
#import "WebViewController.h"
#import "GiFHUD.h"

@interface AuthorTableViewController ()
{
    NSMutableArray * _authorDataArray;
    BOOL _IS_LOD;
}

@end

@implementation AuthorTableViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewDidAppear:(BOOL)animated{
    self.tableView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height+44);
}
-(void)viewWillDisappear:(BOOL)animated
{
    [GiFHUD dismiss];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _IS_LOADING = NO;
    _IS_LOD = NO;
    _authorDataArray = [[NSMutableArray alloc] init];
    [self registCell];
   // [GiFHUD setGifWithImageName:@"mc.gif"];
    [self loadWithStart:@"0"];
    [self setRefresh];
    UIImageView * imgV = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imgV.image = [UIImage imageNamed:@"bg.png"];
    [self.view addSubview:imgV];
    [self.view sendSubviewToBack:imgV];
    
    

  
}
- (void)registCell{
    [self.tableView registerNib:[UINib nibWithNibName:@"FirstAuthorTableViewCell" bundle:nil] forCellReuseIdentifier:@"firstAuthorCellId"];
    [self.tableView registerNib:[UINib nibWithNibName:@"OtherTableViewCell" bundle:nil] forCellReuseIdentifier:@"otherCell"];
}
- (void)setRefresh{
    [self.tableView addHeaderWithTarget:self action:@selector(headerRefreshing) dateKey:@"table"];
    self.tableView.headerRefreshingText=@"refreshing";
    [self.tableView addFooterWithTarget:self action:@selector(footerRefreshing)];
    self.tableView.footerRefreshingText=@"loading";
}
-(void)headerRefreshing
{
    _IS_UP_PULL = NO;
    [self loadWithStart:@"0"];
}
-(void)footerRefreshing
{
    _IS_UP_PULL = YES;
    
    if ([_currentPage isEqualToString:@"0"] ) {
        self.tableView.footerRefreshingText = @"没有更多了";
        [self.tableView footerEndRefreshing];
    }else{
        self.tableView.footerRefreshingText = @"加载中……";
        [self loadWithStart:_currentPage];
    }
}
-(void)loadWithStart:(NSString *)start{
    if(_IS_LOADING){
        return;
    }
    _IS_LOADING=YES;
    NSUserDefaults*defaults=[NSUserDefaults standardUserDefaults];
    NSString*authorId=[defaults objectForKey:@"authorId"];
    [GiFHUD show];
    [GetData getAuthorInfosWithParam:authorId andfilter:@"byAuthor" andStart:start andLimit:10 callBack:^(id auModel) {
        [GiFHUD dismiss];
        _IS_LOADING=NO;
        if(_IS_UP_PULL){
            [self.tableView footerEndRefreshing];
        }else{
            [self.tableView headerEndRefreshing];
        }
        if (!auModel) {
            [GiFHUD dismiss];
            return ;
        }
        DeAuthorModel*authorModel=auModel;
        if(_IS_UP_PULL){
            _currentPage=authorModel.next;
        }else{
            [_authorDataArray removeAllObjects];
            _currentPage=@"0";
        }
        if (![start isEqualToString:@"0"]) {
            if(_IS_LOD==NO){
                _currentPage=[self islod:authorModel];
            }
        }
        _currentPage=authorModel.next;
        [_authorDataArray addObjectsFromArray:authorModel.result];
        [self.tableView reloadData];
        
    }];
}
- (NSString*)islod:(DeAuthorModel*)model{
    _IS_LOD=YES;
    return model.next;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _authorDataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   DeResultModel*resultModel=_authorDataArray[indexPath.row];
    if(indexPath.row==0){
        FirstAuthorTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"firstAuthorCellId" forIndexPath:indexPath];
        [cell.bgImage sd_setImageWithURL:[NSURL URLWithString:resultModel.author.image] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        [cell.headImage sd_setImageWithURL:[NSURL URLWithString:resultModel.author.avatar] placeholderImage:[UIImage imageNamed:@"icon_user_place"]];
        cell.authorNameLab.text=resultModel.author.name;
        cell.wechatNumLab.text=[NSString stringWithFormat:@"微信号：%@",resultModel.author.contactId];
        cell.intextLab.text=resultModel.author.introduction;
        return cell;
    }else{
        OtherTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"otherCell"];
        NSArray*imageArr=resultModel.image;
        [cell.imagV sd_setImageWithURL:[NSURL URLWithString:((ImageModel*)imageArr[0]).url] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        cell.titileLab.text=resultModel.article.title;
        cell.classLab.text=resultModel.category.categoryGroup.name;
        cell.classLab.textColor=[ColorChange colorString:resultModel.category.categoryGroup.color];
        cell.authorLab.text=resultModel.author.name;
        cell.browseLab.text=resultModel.article.articleStats.read;
        return cell;
    }
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        DeResultModel*resultModel=_authorDataArray[indexPath.row];
        NSString*str=resultModel.author.introduction;
        CGRect rec =[self strHeight:str];
        return [UIScreen mainScreen].bounds.size.width*0.8+rec.size.height;
    }
    return [UIScreen mainScreen].bounds.size.height / 6;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DeResultModel * deModel = _authorDataArray[indexPath.row];
    SpecArticleModel * articleModel = deModel.article;
   ArticleStatusModel * articleStatsModel = articleModel.articleStats;
    NSString * webUrl = articleModel.url;
    NSString * like = articleStatsModel.like;
    NSString * favorite = articleStatsModel.favorite;
    NSString * comment = articleStatsModel.comment;
    NSArray * infoArray = @[webUrl,like,favorite,comment];
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:infoArray forKey:@"webUrl"];
    [defaults synchronize];
    UIStoryboard * story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    WebViewController * webView = [story instantiateViewControllerWithIdentifier:@"webView"];
    [self.navigationController pushViewController:webView animated:YES];
}

-(CGRect)strHeight:(NSString *)str
{
    NSDictionary * dict = @{NSFontAttributeName:[UIFont systemFontOfSize:13]};
    CGRect rect = [str boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 40, MAXFLOAT) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    return rect;
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
