//
//  GetData.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Define.h"
#import "GCDDownload.h"
#import "Cache.h"
#import "DataAnalysis.h"
typedef void (^Block)(id);

@interface GetData : NSObject
+ (void)getEveryDayAppInfoWithFilter:(NSString*)filter start:(NSString*)start limit:(NSInteger)limit callBack:(Block)callback;
+ (void)getCategoryInfoWithParam:(NSString*)para andFilter:(NSString*)filter andStart:(NSString*)start andLimit:(NSInteger)limit callBack:(Block)callback;
+(void)getSpecialAppInfosWithFilter:(NSString *)filter start:(NSString *)start limit:(NSInteger)limit callBack:(Block)callBack;
+(void)getAuthorInfosWithParam:(NSString *)param andfilter:(NSString *)filter andStart:(NSString *)start andLimit:(NSInteger)limit callBack:(Block)callBack;


@end
