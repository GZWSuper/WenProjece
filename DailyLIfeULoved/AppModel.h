//
//  AppModel.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"
#import "ImageModel.h"
#import "AuthorModel.h"
#import "FeaturedArticleModel.h"
#import "CategoryModel.h"
#import "ArticleModel.h"
@protocol AppModel <NSObject>

@end

@interface AppModel : JSONModel
@property (strong)NSArray<ImageModel,Optional>*image;
@property (strong)AuthorModel<Optional>*author;
@property (strong)FeaturedArticleModel<Optional>*featuredArticle;
@property (strong) CategoryModel<Optional>*category;
@property (copy) NSString<Optional> * priority;
@property (strong) ArticleModel<Optional> * article;
@property (strong) NSArray<Optional> * tags;

@end
