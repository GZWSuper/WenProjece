//
//  MainUserMOdel.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/15.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"

@interface MainUserMOdel : JSONModel
@property (nonatomic, copy) NSString *country_code;

@property (nonatomic, copy) NSString *avatar_l;

@property (nonatomic, assign) BOOL is_hunter;

@property (nonatomic, assign) long long id;

@property (nonatomic, copy) NSString *user_desc;

@property (nonatomic, copy) NSString *mobile;

@property (nonatomic, copy) NSString *avatar_s;

//@property (nonatomic, copy) NSString *location_name;

//@property (nonatomic, copy) NSString *resident_city_id;

@property (nonatomic, copy) NSString *country_num;

@property (nonatomic, copy) NSString *avatar_m;

@property (nonatomic, assign) BOOL email_verified;

@property (nonatomic, copy) NSString *birthday;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *custom_url;

@property (nonatomic, copy) NSString *email;

@property (nonatomic, assign) NSInteger gender;

@property (nonatomic, copy) NSString *name;

@end
