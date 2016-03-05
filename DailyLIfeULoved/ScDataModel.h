//
//  ScDataModel.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"
#import "ScResultModel.h"

@interface ScDataModel : JSONModel
@property (strong) NSNumber<Optional> * status;
@property (copy) NSString<Optional> * next;
@property (strong) NSArray<ScResultModel,Optional> * result;

@end
