//
//  CityModel.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/16.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"
#import "Hottest_sitesModel.h"

@interface CityModel : JSONModel
@property (nonatomic, copy) NSString *name_orig;

@property (nonatomic, assign) NSInteger visited_count;
@end
