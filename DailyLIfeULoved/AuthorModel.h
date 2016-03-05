//
//  AuthorModel.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"
@protocol AuthorModel <NSObject>

@end

@interface AuthorModel : JSONModel
@property (copy) NSString<Optional> * authorId;
@property (copy) NSString<Optional> * name;
@property (copy) NSString<Optional> * avatar;
@property (copy) NSString<Optional> * image;
@property (copy) NSString<Optional> * introduction;
@property (copy) NSString<Optional> * contactType;
@property (copy) NSString<Optional> * contactId;
@property (copy) NSString<Optional> * gender;
@property (copy) NSString<Optional> * contract;
@property (copy) NSString<Optional> * serviceType;
@property (copy) NSString<Optional> * serviceParam;

@end
