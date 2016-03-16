//
//  CityTwoModel.m
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/15.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "CityTwoModel.h"

@implementation CityTwoModel
+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+ (JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"description":@"des"}];
}
@end
