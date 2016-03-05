//
//  ScResultModel.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"
#import "SpeArticleModel.h"
#import "AuthorModel.h"
#import "CategoryModel.h"
@protocol ScResultModel <NSObject>

@end

@interface ScResultModel : JSONModel
@property (strong) NSNumber<Optional> * priority;
@property (strong) SpeArticleModel<Optional> * article;
@property (strong) AuthorModel<Optional> * author;
@property (strong) CategoryModel<Optional> * category;

@end
