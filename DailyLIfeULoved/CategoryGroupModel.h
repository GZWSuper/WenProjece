//
//  CategoryGroupModel.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"
@protocol CategoryGroupModel <NSObject>
@end

@interface CategoryGroupModel : JSONModel
@property (copy) NSString<Optional> * categoryGroupId;
@property (copy) NSString<Optional> * name;
@property (copy) NSString<Optional> * englishName;
@property (copy) NSString<Optional> * icon;
@property (copy) NSString<Optional> * largeIcon;
@property (copy) NSString<Optional> * color;
@property (copy) NSString<Optional> * image;



@end
