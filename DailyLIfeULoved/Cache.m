//
//  Cache.m
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "Cache.h"

@implementation Cache

+ (NSString*)cachePath:(NSString*)filter{
    NSString*cachePath=[NSString stringWithFormat:@"%@/Library/Caches/pageData/%@/",NSHomeDirectory(),filter];
    NSFileManager*fm=[NSFileManager defaultManager];
    if(![fm fileExistsAtPath:cachePath isDirectory:nil]){
        [fm createDirectoryAtPath:cachePath withIntermediateDirectories:YES attributes:nil error:nil];
       
    }
    return cachePath;
}
+ (void)saveDataToCacheWith:(NSString *)filter andLimit:(NSInteger)limit andData:(NSData *)data{
    NSString*cathePath=[NSString stringWithFormat:@"%@%ld.png",[self cachePath:filter],limit];
    [data writeToFile:cathePath atomically:NO];
}
+ (NSData*)readDataFromCacheWith:(NSString *)filter andLimit:(NSInteger)limit{
    NSString*cathePath=[NSString stringWithFormat:@"%@%ld.png",[self cachePath:filter],limit];
    NSData*data=[NSData dataWithContentsOfFile:cathePath];
    return data;
}

@end
