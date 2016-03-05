//
//  DataAnalysis.m
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "DataAnalysis.h"
#import "DataModel.h"
#import "SpeDataModel.h"
#import "DeAuthorModel.h"

@implementation DataAnalysis
+ (id)analysisWithData:(NSData *)data{
    NSError*err=nil;
    DataModel*dataModel=[[DataModel alloc]initWithData:data error:nil];
    if(err){
        NSLog(@"data analysis fail:%@",err);
        return nil;
    }
    return dataModel;
}
+ (id)analysisSpeAppInfoWithData:(NSData *)data{
    NSError * error = nil;
    SpeDataModel * speDataModel = [[SpeDataModel alloc] initWithData:data error:&error];
    if (error) {
        NSLog(@"解析错误");
        return nil;
    }
    return speDataModel;
   
}
+ (id)analysisAuthorAppInfoWithData:(NSData *)data{
    NSError * error = nil;
    DeAuthorModel * deAuthorModel = [[DeAuthorModel alloc] initWithData:data error:&error];
    if (error) {
        NSLog(@"解析错误");
        return nil;
    }
    return deAuthorModel;
   
}

@end
