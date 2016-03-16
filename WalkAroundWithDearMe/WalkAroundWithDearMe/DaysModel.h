//
//  DaysModel.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/16.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"

@interface DaysModel : JSONModel
@property (nonatomic, assign) BOOL recommended;

@property (nonatomic, copy) NSString *photo_w640;
@property (nonatomic, copy) NSString *text;

@property (nonatomic,copy) NSString *local_time;

@property (nonatomic, copy) NSString *photo;

@property (nonatomic,copy) NSString *city;
@end
