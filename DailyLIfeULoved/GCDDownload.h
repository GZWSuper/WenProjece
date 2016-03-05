//
//  GCDDownload.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^callBack)(NSData*,NSError*);

@interface GCDDownload : NSObject
+ (void)downLoadWithUrlStr:(NSString*)urlStr andCallBack:(callBack)callBack;

@end
