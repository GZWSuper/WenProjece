//
//  DeAuthorModel.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"
#import "DeResultModel.h"

@interface DeAuthorModel : JSONModel
@property (strong) NSNumber * status;
@property (copy) NSString * next;
@property (strong) NSArray<DeResultModel> * result;

@end
