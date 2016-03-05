//
//  DataAnalysis.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"

@interface DataAnalysis : JSONModel
+ (id)analysisWithData:(NSData*)data;
+ (id)analysisSpeAppInfoWithData:(NSData*)data;
+ (id)analysisAuthorAppInfoWithData:(NSData*)data;

@end
