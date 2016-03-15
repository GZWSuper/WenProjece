//
//  StoryModel.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/14.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"
#import "PioModel.h"
#import "UserModel.h"

@interface StoryModel : JSONModel
@property (nonatomic, copy) NSString *cover_image_1600;

@property (nonatomic, assign) NSInteger recommendations_count;

@property (nonatomic, copy) NSString *location_alias;

@property (nonatomic, copy) NSString *cover_image_s;

@property (nonatomic, copy) NSString *date_tour;

@property (nonatomic, assign) NSInteger cover_image_height;

@property (nonatomic, copy) NSString *index_title;

@property (nonatomic, copy) PioModel* poi;

@property (nonatomic, copy) NSString *share_url;

@property (nonatomic, strong) UserModel *user;

@property (nonatomic, assign) NSInteger cover_image_width;

@property (nonatomic, copy) NSString *timezone;

@property (nonatomic, assign) NSInteger view_count;



@property (nonatomic, copy) NSString *text;

@property (nonatomic, copy) NSString *index_cover;

@property (nonatomic, copy) NSString *cover_image_w640;

@property (nonatomic, copy) NSString *cover_image;

@property (nonatomic,copy)NSString *spot_id;

@end
