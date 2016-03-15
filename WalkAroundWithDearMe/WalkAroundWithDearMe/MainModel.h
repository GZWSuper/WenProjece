//
//  MainModel.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/15.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"
#import "MainUserMOdel.h"

@interface MainModel : JSONModel
@property (nonatomic, assign) NSInteger day_count;

@property (nonatomic, assign) NSInteger device;

@property (nonatomic, copy) NSString *summary;

@property (nonatomic, copy) NSString *eid;

@property (nonatomic, assign) NSInteger spot_count;

@property (nonatomic, copy) NSString *cover_image;

@property (nonatomic, copy) NSString *cover_image_w640;

@property (nonatomic, assign) BOOL is_hot_trip;

@property (nonatomic, copy) NSString *description;

@property (nonatomic, copy) NSString *first_day;

@property (nonatomic, assign) NSInteger version;

@property (nonatomic, assign) NSInteger privacy;

@property (nonatomic, copy) NSString *cover_image_1600;

@property (nonatomic, assign) BOOL recommended;

@property (nonatomic, assign) BOOL is_featured_trip;

@property (nonatomic, strong) MainUserMOdel *user;

@property (nonatomic, assign) NSInteger recommendations;

@property (nonatomic, copy) NSString *popular_place_str;

@property (nonatomic, assign) BOOL wifi_sync;

@property (nonatomic, assign) NSInteger waypoints;

@property (nonatomic, assign) NSInteger comment_count;

@property (nonatomic, assign) NSInteger date_complete;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger date_added;

@property (nonatomic, assign) NSInteger view_count;

@property (nonatomic, copy) NSString *cover_image_default;

@property (nonatomic, copy) NSString *index_title;

@property (nonatomic, copy) NSString *share_url;

@property (nonatomic, copy) NSString *last_day;

@end
