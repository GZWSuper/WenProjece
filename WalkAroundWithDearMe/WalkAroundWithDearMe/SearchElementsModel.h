//
//  SearchElementsModel.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/16.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"

@interface SearchElementsModel : JSONModel
@property (nonatomic, assign) NSInteger rating;

@property (nonatomic, copy) NSString *id;

@property (nonatomic, assign) BOOL has_route_maps;

@property (nonatomic, copy) NSString *name_orig;

@property (nonatomic, assign) NSInteger wish_to_go_count;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) NSInteger visited_count;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *name_zh;

@property (nonatomic, assign) BOOL has_experience;



@property (nonatomic, copy) NSString *icon;

@property (nonatomic, assign) NSInteger rating_users;

@property (nonatomic, assign) NSInteger comments_count;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *name_en;
@end
