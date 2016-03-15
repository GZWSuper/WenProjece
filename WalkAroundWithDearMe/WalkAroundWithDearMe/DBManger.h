//
//  DBManger.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/15.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface DBManger : NSObject
+ (DBManger*)shareManger;
- (NSString*)getFileFullPathWithFileName:(NSString*)fileName;
- (void)insertModel:(id)model;
- (void)insertMainModel:(id)model;
- (void)insertPlayModel:(id)model;
- (void)deleteModelForStory:(NSString*)spotId;
- (void)deleteModelForMain:(NSString*)mainID;
- (void)deleteModelForPlay:(NSString*)playID;
- (NSMutableArray*)readModelsWithRecordType:(NSString*)type;
- (BOOL)isExistInfoForid:(NSString*)spotId mainId:(NSString*)mainId playId:(NSString*)playId;


@end
