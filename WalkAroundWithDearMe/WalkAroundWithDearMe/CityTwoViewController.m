//
//  CityTwoViewController.m
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/15.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "CityTwoViewController.h"
#import "Define.h"
#import "AFNetworking.h"
#import "CityTwoModel.h"
#import "CityTwoViewTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface CityTwoViewController ()
@property (nonatomic,strong)UIImageView *headImageView;
@property (nonatomic,strong)UIView *headerBackView;
@property (nonatomic,strong)NSString *photo;
@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSString *lookCount;
@property (nonatomic,strong)NSString *wantCount;
@end

@implementation CityTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight=500;
    [self.tableView registerNib:[UINib nibWithNibName:@"CityTwoViewTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
    
}
- (void)createTableView{
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ViewFramWidth, ViewFramHeight) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}
- (void)loadDataSource{
    AFHTTPSessionManager*manger=[AFHTTPSessionManager manager];
    NSString*url=[NSString stringWithFormat:CityTwoUrl,_type,_num];
    [manger GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray*photo=responseObject[@"hottest_places"];
        NSDictionary*dic=photo[0];
        _photo=dic[@"photo"];
        _name=responseObject[@"name"];
        _lookCount=responseObject[@"visited_count"];
        _wantCount=responseObject[@"wish_to_go_count"];
        [self.dataSource addObject:[[CityTwoModel alloc]initWithDictionary:responseObject error:nil]];
         [self createView];
         [self createLable];
         [self.tableView reloadData];
         } failure:^(NSURLSessionDataTask *task, NSError *error) {
             
         }];
}
- (void)createView{
    _headerBackView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 400)];
    _headerBackView.backgroundColor = [UIColor whiteColor];
    self.tableView.tableHeaderView = _headerBackView;
    self.headImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 370)];
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:_photo] placeholderImage:[UIImage imageNamed:@"xixi"]];
    self.headImageView.contentMode=UIViewContentModeScaleAspectFill;
    self.headImageView.clipsToBounds = YES;
    [_headerBackView addSubview:self.headImageView];
    
    
    
}
- (void)createLable{
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(20, 310, 200, 40)];
    lable.text = [NSString stringWithFormat:@"%@",_name];
    lable.font = [UIFont systemFontOfSize:27.0];
    lable.textColor = [UIColor whiteColor];
    [self.tableView addSubview:lable];
    UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(230, 330, 150, 40)];
    lable1.text = [NSString stringWithFormat:@"%@人去过|%@人想去",_lookCount,_wantCount];
    lable1.font = [UIFont systemFontOfSize:14.0];
    lable1.textColor = [UIColor whiteColor];
    [self.tableView addSubview:lable1];
    
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
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    CityTwoViewTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cellID"];
    CityTwoModel*model=self.dataSource[indexPath.row];
    cell.backgroundColor=Color2;
    [cell staryCityTwo:model];
    return cell;
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
