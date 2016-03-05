//
//  SpecArticleModel.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"
#import "ArticleStatusModel.h"
@protocol SpecArticleModel <NSObject>

@end
@interface SpecArticleModel : JSONModel
@property (copy) NSString<Optional> * articleId;
@property (strong) ArticleStatusModel<Optional> * articleStats;
@property (strong) NSNumber<Optional> * createdTime;
@property (strong) NSNumber<Optional> * modifiedTime;
@property (strong) NSNumber<Optional> * renderType;
@property (copy) NSString<Optional> * summary;
@property (copy) NSString<Optional> * title;
@property (copy) NSString<Optional> * url;
@property (copy) NSString<Optional> * weblink;
@property (strong)NSArray<Optional> * tags;

@end
