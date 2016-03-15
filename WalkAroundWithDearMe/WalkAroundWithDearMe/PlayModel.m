//
//  PlayModel.m
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/15.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "PlayModel.h"

@implementation PlayModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
+ (JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"playId"}];
}
@end
