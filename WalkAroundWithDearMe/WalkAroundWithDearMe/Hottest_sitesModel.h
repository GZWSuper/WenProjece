//
//  Hottest_sitesModel.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/15.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"

@interface Hottest_sitesModel : JSONModel
@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *cover_s;
@end
