//
//  CategoryModel.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"
#import "CategoryGroupModel.h"
@protocol CategoryModel <NSObject>

@end

@interface CategoryModel : JSONModel
@property (copy) NSString<Optional> * categoryId;
@property (copy) NSString<Optional> * name;
@property (copy) NSString<Optional> * englishName;
@property (copy) NSString<Optional> * icon;
@property (copy) NSString<Optional> * image;
@property (copy) NSString<Optional> * priority;
@property (copy) CategoryGroupModel<Optional> * categoryGroup;

@end
