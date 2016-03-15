//
//  UserModel.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/14.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"

@interface UserModel : JSONModel
@property (nonatomic, assign) long long id;

@property (nonatomic, copy) NSString *avatar_l;

@property (nonatomic, copy) NSString *email;

@property (nonatomic, copy) NSString *user_desc;

@property (nonatomic, copy) NSString *mobile;

@property (nonatomic, copy) NSString *avatar_m;

@property (nonatomic, copy) NSString *location_name;

@property (nonatomic, assign) NSInteger resident_city_id;

@property (nonatomic, copy) NSString *country_num;

@property (nonatomic, copy) NSString *avatar_s;

@property (nonatomic, copy) NSString *birthday;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *custom_url;

@property (nonatomic, copy) NSString *country_code;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger gender;

@end
