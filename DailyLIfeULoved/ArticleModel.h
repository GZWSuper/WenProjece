//
//  ArticleModel.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"
#import "ArticleStatusModel.h"
@protocol ArticleModel<NSObject>
@end

@interface ArticleModel : JSONModel
@property (copy) NSString<Optional> * articleId;
@property (copy) NSString<Optional> * title;
@property (copy) NSString<Optional> * summary;
@property (copy) NSString<Optional> * renderType;
@property (copy) NSString<Optional> * url;
@property (copy) NSString<Optional> * weblink;
@property (copy) NSString<Optional> * createdTime;
@property (copy) NSString<Optional> * modifiedTime;
@property (copy) ArticleStatusModel<Optional> * articleStats;

@end
