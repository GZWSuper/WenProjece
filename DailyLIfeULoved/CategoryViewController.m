//
//  CategoryViewController.m
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "CategoryViewController.h"
#import "FashionViewController.h"
#import "FoodViewController.h"
#import "HomeViewController.h"
#import "TourViewController.h"
#import "ThingsViewController.h"
#import "SCNavTabBarController.h"



@interface CategoryViewController ()

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FashionViewController*fashionVC=[[FashionViewController alloc]init];
    fashionVC.title=@"风尚";
    FoodViewController * foodVC = [[FoodViewController alloc] init];
    foodVC.title = @"美食";
    
    HomeViewController * homeVC = [[HomeViewController alloc] init];
    homeVC.title = @"家居";
    
    TourViewController * tourVC = [[TourViewController alloc] init];
    tourVC.title = @"旅游";
    
    ThingsViewController * thingsVC = [[ThingsViewController alloc] init];
    thingsVC.title = @"格物";
    SCNavTabBarController*navTabControlller=[[SCNavTabBarController alloc]init];
    navTabControlller.subViewControllers=@[fashionVC,foodVC,homeVC,tourVC,thingsVC];
    navTabControlller.showArrowButton=NO;
    navTabControlller.navTabBarColor=[UIColor whiteColor];
    [navTabControlller addParentController:self];
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
