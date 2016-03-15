//
//  PioModel.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/14.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"

@interface PioModel : JSONModel
@property (nonatomic, copy) NSString *time_consuming;




@property (nonatomic, copy) NSString *extra1;

@property (nonatomic, copy) NSString *description;

@property (nonatomic, copy) NSString *arrival_type;

@property (nonatomic, copy) NSString *tel;

@property (nonatomic, copy) NSString *name_en;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *currency;

@property (nonatomic, assign) NSInteger category;

@property (nonatomic, copy) NSString *name;



@property (nonatomic, copy) NSString<Optional> *recommended_reason;

@property (nonatomic, copy) NSString *website;

@property (nonatomic, assign) NSInteger time_consuming_max;

@property (nonatomic, copy) NSString *timezone;

@property (nonatomic, assign) NSInteger popularity;

@property (nonatomic, copy) NSString *fee;

@property (nonatomic, copy) NSString *opening_time;

@property (nonatomic, copy) NSString *spot_region;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, copy) NSString *date_added;



@end
