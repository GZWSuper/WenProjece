//
//  GetData.m
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "GetData.h"

@implementation GetData
+ (void)getEveryDayAppInfoWithFilter:(NSString *)filter start:(NSString *)start limit:(NSInteger)limit callBack:(Block)callback{
    NSMutableString*urlStr=[[NSMutableString alloc]init];
    [urlStr appendString:Header];
    [urlStr appendString:Article];
    [urlStr appendString:[NSString stringWithFormat:@"filter=%@",filter]];
    [urlStr appendString:[NSString stringWithFormat:@"&start=%@",start]];
    [urlStr appendString:[NSString stringWithFormat:@"&limit=%ld",(long)limit]];
    [GCDDownload downLoadWithUrlStr:urlStr andCallBack:^(NSData *data, NSError *error) {
        if(error){
            data=[Cache readDataFromCacheWith:filter andLimit:limit];
        }else{
            [Cache saveDataToCacheWith:filter andLimit:limit andData:data];
        }
        if(!data){
            callback(nil);
            return ;
        }
        id resultObj=[DataAnalysis analysisWithData:data];
        callback(resultObj);
    }];
    
    
}
+ (void)getCategoryInfoWithParam:(NSString *)para andFilter:(NSString *)filter andStart:(NSString *)start andLimit:(NSInteger)limit callBack:(Block)callback{
    NSMutableString*urlStr=[[NSMutableString alloc]init];
    [urlStr appendString:Header];
    [urlStr appendString:Article];
    [urlStr appendString:[NSString stringWithFormat:@"param=%@",para]];
    [urlStr appendString:[NSString stringWithFormat:@"&filter=%@",filter]];
    [urlStr appendString:[NSString stringWithFormat:@"&start=%@",start]];
    [urlStr appendString:[NSString stringWithFormat:@"&limit=%ld",(long)limit]];
    [GCDDownload downLoadWithUrlStr:urlStr andCallBack:^(NSData *data, NSError *error)
        
    {
        if (error) {
            data = [Cache readDataFromCacheWith:urlStr andLimit:0];
        }else{
            [Cache  saveDataToCacheWith:urlStr andLimit:0 andData:data];
        }
        if (!data) {
            callback(nil);
            return;
        }
        id resultObj = [DataAnalysis analysisWithData:data];
        callback(resultObj);
    }];

    
}
+ (void)getSpecialAppInfosWithFilter:(NSString *)filter start:(NSString *)start limit:(NSInteger)limit callBack:(Block)callBack{
    NSMutableString*urlStr=[[NSMutableString alloc]init];
    [urlStr appendString:Header];
    [urlStr appendString:Author];
    [urlStr appendString:[NSString stringWithFormat:@"filter=%@",filter]];
    [urlStr appendString:[NSString stringWithFormat:@"&start=%@",start]];
    [urlStr appendString:[NSString stringWithFormat:@"&limit=%ld",(long)limit]];
    [GCDDownload downLoadWithUrlStr:urlStr andCallBack:^(NSData *data, NSError *error) {
        if(error){
            data=[Cache readDataFromCacheWith:filter andLimit:limit];
            
        }else{
            [Cache  saveDataToCacheWith:filter andLimit:limit andData:data];
        }
        if(!data){
            callBack(nil);
            return ;
        }
        id resultObj=[DataAnalysis analysisSpeAppInfoWithData:data];
        callBack(resultObj);
        
    }];
    
}
+ (void)getAuthorInfosWithParam:(NSString *)param andfilter:(NSString *)filter andStart:(NSString *)start andLimit:(NSInteger)limit callBack:(Block)callBack{
     NSMutableString*urlStr=[[NSMutableString alloc]init];
    [urlStr appendString:Header];
    [urlStr appendString:Article];
     [urlStr appendString:[NSString stringWithFormat:@"param=%@",param]];
    [urlStr appendString:[NSString stringWithFormat:@"&filter=%@",filter]];
    [urlStr appendString:[NSString stringWithFormat:@"&start=%@",start]];
    [urlStr appendString:[NSString stringWithFormat:@"&limit=%ld",(long)limit]];
    [GCDDownload downLoadWithUrlStr:urlStr andCallBack:^(NSData *data, NSError *error) {
        if(error){
            data=[Cache readDataFromCacheWith:urlStr andLimit:0];
        }else{
            [Cache saveDataToCacheWith:urlStr andLimit:0 andData:data];
        }
        if (!data) {
            callBack(nil);
            return;
        }
        id resultObj = [DataAnalysis analysisAuthorAppInfoWithData:data];
        callBack(resultObj);
        
    }];
     
}

@end
