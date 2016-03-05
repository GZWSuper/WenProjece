//
//  GCDDownload.m
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "GCDDownload.h"

@implementation GCDDownload
+ (void)downLoadWithUrlStr:(NSString *)urlStr andCallBack:(callBack)callBack{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSError*error=nil;
        NSData*data=[NSData dataWithContentsOfURL:[NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] options:NSDataReadingUncached error:&error];
        dispatch_async(dispatch_get_main_queue(), ^{
            callBack(data,error);
        });
    });
}

@end
