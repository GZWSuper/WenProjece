//
//  SpeAppModel.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"
#import "AuthorModel.h"
#import "SpeFeatueredAuthorModel.h"
#import "CategoryModel.h"
#import "SpeArticleModel.h"
@protocol SpeAppModel <NSObject>

@end

@interface SpeAppModel : JSONModel
@property (strong) AuthorModel<Optional> * author;
@property (strong) SpeFeatueredAuthorModel<Optional> * featuredAuthor;
@property (strong) NSArray<CategoryModel,Optional> * category;
@property (strong) NSNumber<Optional> * priority;
@property (strong) SpeArticleModel<Optional> * article;
@property (strong)NSNumber<Optional> * latest;

@end
