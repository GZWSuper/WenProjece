//
//  Cache.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cache : NSObject
+ (void)saveDataToCacheWith:(NSString*)filter andLimit:(NSInteger)limit andData:(NSData*)data;
+ (NSData*)readDataFromCacheWith:(NSString*)filter andLimit:(NSInteger)limit;

@end
