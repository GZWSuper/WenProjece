//
//  ArticleStatusModel.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"
@protocol ArticleStatusModel<NSObject>
@end

@interface ArticleStatusModel : JSONModel
@property (copy) NSString<Optional> * read;
@property (copy) NSString<Optional> * like;
@property (copy) NSString<Optional> * dislike;
@property (copy) NSString<Optional> * comment;
@property (copy) NSString<Optional> * favorite;
@property (copy) NSString<Optional> * share;

@end
