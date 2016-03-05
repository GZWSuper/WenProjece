//
//  DataModel.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"
#import "AppModel.h"


@interface DataModel : JSONModel
@property (strong) NSNumber * status;
@property (copy) NSString * next;
@property (strong)NSArray<AppModel>*result;

@end
