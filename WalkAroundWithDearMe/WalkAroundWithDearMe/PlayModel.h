//
//  PlayModel.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/15.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"

@interface PlayModel : JSONModel
@property (nonatomic, copy) NSString *playId;


@property (nonatomic, copy) NSString *cover_image_1600;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger day_count;

@end
