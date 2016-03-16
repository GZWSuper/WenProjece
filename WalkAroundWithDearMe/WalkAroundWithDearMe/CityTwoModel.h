//
//  CityTwoModel.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/15.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"

@interface CityTwoModel : JSONModel
@property (nonatomic,copy)NSString *opening_time;


@property (nonatomic,copy)NSString *des;

@property (nonatomic,copy)NSString *arrival_type;

@property (nonatomic,copy)NSString *address;

@property (nonatomic,copy)NSString *name;

@property (nonatomic,assign)NSInteger wish_to_go_count;

@property (nonatomic,assign)NSInteger visited_count;

@property (nonatomic,copy)NSString *recommended_reason;

@end
