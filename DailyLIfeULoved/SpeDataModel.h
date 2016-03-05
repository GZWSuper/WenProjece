//
//  SpeDataModel.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"
#import "SpeAppModel.h"

@interface SpeDataModel : JSONModel
@property (strong) NSNumber * status;
@property (copy) NSString * next;
@property (strong) NSArray<SpeAppModel> * result;

@end
