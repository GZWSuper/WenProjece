//
//  Detail_listModel.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/14.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"

@interface Detail_listModel : JSONModel
@property (nonatomic, copy) NSString *photo_1600;

@property (nonatomic, copy) NSString *photo_date_created;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *photo_w640;
@property (nonatomic, copy) NSString *text;

@property (nonatomic, assign) NSInteger photo_width;

@property (nonatomic, copy) NSString *photo_s;

@property (nonatomic, copy) NSString *timezone;

@property (nonatomic, assign) NSInteger photo_height;

@property (nonatomic, assign) long long detail_id;

@property (nonatomic, copy) NSString *photo;

@end
