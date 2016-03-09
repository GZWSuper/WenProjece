//
//  BaseTableViewController.m
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController
- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.tabBarController.tabBar.hidden=YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _currentPage=0;
    _IS_LOADING=NO;
    self.tableView.showsVerticalScrollIndicator=NO;
    self.tableView.showsHorizontalScrollIndicator=NO;
    _dataArray=[[NSMutableArray alloc]init];
    [self.tableView registerNib:[UINib nibWithNibName:@"BaseTableViewCell" bundle:nil] forCellReuseIdentifier:@"baseCell"];
    [self setRefresh];
    
    
}
- (void)setRefresh{
    [self.tableView addHeaderWithTarget:self action:@selector(headerRefreshing) dateKey:@"table"];
    self.tableView.headerRefreshingText=@"updateing";
    [self.tableView addFooterWithTarget:self action:@selector(footerRefreshing)];
    self.tableView.footerRefreshingText=@"loading";

}
- (void)headerRefreshing{

}
- (void)footerRefreshing{

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
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"baseCell"];
    AppModel*appModel=_dataArray[indexPath.row];
    NSArray*imgArr=appModel.image;
    [cell.imagV sd_setImageWithURL:[NSURL URLWithString:((ImageModel*)imgArr[0]).url] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    cell.titleLab.text=appModel.article.title;
    cell.classLab.text=appModel.category.categoryGroup.name;
    cell.classLab.textColor=[ColorChange colorString:appModel.category.categoryGroup.color];
    cell.authorLab.text=appModel.author.name;
    cell.browseLab.text=appModel.article.articleStats.read;
    return cell;
 
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UIScreen mainScreen].bounds.size.height/6;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AppModel*appmodel=_dataArray[indexPath.row];
    ArticleModel*articleModel=appmodel.article;
    ArticleStatusModel*articleStatusModel=articleModel.articleStats;
    NSString*webUrl=articleModel.url;
    NSString*like=articleStatusModel.like;
    NSString*favorite=articleStatusModel.favorite;
    NSString*comment=articleStatusModel.comment;
   NSArray*infoArr=@[webUrl,like,favorite,comment];
    NSUserDefaults*defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:infoArr forKey:@"webUrl"];
    [defaults synchronize];
    UIStoryboard*story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    WebViewController*webView=[story instantiateViewControllerWithIdentifier:@"webView"];
    [self.navigationController pushViewController:webView animated:YES];
    
    
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
