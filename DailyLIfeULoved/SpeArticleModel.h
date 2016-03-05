//
//  SpeArticleModel.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"
#import "SpecArticleModel.h"
#import "AuthorModel.h"
#import "CategoryModel.h"
#import "ImageModel.h"
#import "ArticleModel.h"

@protocol SpeArticleModel <NSObject>


@end

@interface SpeArticleModel : JSONModel
@property (strong) SpecArticleModel<Optional> * article;
@property (strong) AuthorModel<Optional> * author;
@property (strong) CategoryModel<Optional> * category;
@property (strong) NSArray<ImageModel,Optional> * image;

@end
