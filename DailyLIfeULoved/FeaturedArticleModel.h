//
//  FeaturedArticleModel.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"
@protocol FeaturedArticleModel <NSObject>

@end

@interface FeaturedArticleModel : JSONModel
@property (copy) NSString<Optional> * publishTime;
@property (copy) NSString<Optional> * priority;

@end
