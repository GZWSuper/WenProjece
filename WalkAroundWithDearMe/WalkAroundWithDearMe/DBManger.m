//
//  DBManger.m
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/15.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "DBManger.h"
#import "StoryModel.h"
#import "MainModel.h"
#import "PlayModel.h"

/*
 数据库
 1.导入 libsqlite3.dylib
 2.导入 fmdb
 3.导入头文件
 fmdb 是对底层C语言的sqlite3的封装
 */

@implementation DBManger{
    FMDatabase*_database;
}
+ (DBManger*)shareManger{
    static DBManger*manger=nil;
    @synchronized(self) {
        if(manger==nil){
        
            manger=[[DBManger alloc]init];
        }
    }
    return manger;
}
- (id)init{

    if(self=[super init]){
        NSString*fliepath=[self getFileFullPathWithFileName:@"app.db"];
        _database=[[FMDatabase alloc]initWithPath:fliepath];
        if ([_database open]) {
            [self createTable];
        }else{
           NSLog(@"创建数据库失败");
        }
    }
    return self;
}
- (void)createTable{
    NSString*stortySql=@"create table if not exists StoryLike3(serial integer Primary Key Autoincrement,spot_id Varchar(1024),cover_image_w640 Varchar(1024),index_title Varchar(1024),type Varchar(1024))";
    NSString*mainSql=@"create table if not exists MainLike3(serial integer Primary Key Autoincrement,eid Varchar(1024),cover_image Varchar(1024),index_title Varchar(1024),type Varchar(1024))";
    NSString*playSql=@"create table if not exists PlayLike3(serial integer Primary Key Autoincrement,playId Varchar(1024),cover_image_1600 Varchar(1024),name Varchar(1024),type Varchar(1024))";
    BOOL isSuccess=[_database executeUpdate:stortySql]&&[_database executeUpdate:mainSql]&&[_database executeUpdate:playSql];
    if(!isSuccess){
              NSLog(@"创建数据库失败、、、、、、、");
       
    }
}
- (NSString *)getFileFullPathWithFileName:(NSString *)fileName{
    NSString*docPath=[NSHomeDirectory() stringByAppendingFormat:@"/Documents"];
    NSFileManager*fm=[NSFileManager defaultManager];
    if([fm fileExistsAtPath:docPath]){
        return [docPath stringByAppendingFormat:@"/%@",fileName];
        
    }else{
        NSLog(@"Documents不存在");
        return nil;
    }
}
- (void)insertModel:(id)model{
    StoryModel*storyModel=(StoryModel*)model;
    if([self isExistInfoForid:storyModel.spot_id mainId:nil playId:nil]){
        return;
    }
    NSString*sql=@"insert into StoryLike3(cover_image_w640,spot_id,index_title,type) values (?,?,?,?)";
    BOOL ret=[_database executeUpdate:sql,storyModel.cover_image_w640,storyModel.spot_id,storyModel.index_title,@"story"];
    if(!ret){
    
        NSLog(@"插入失败");

    }
}
- (void)insertMainModel:(id)model{
    MainModel*mainModel=(MainModel*)model;
    if([self isExistInfoForid:nil mainId:mainModel.eid playId:nil]){
        return ;
    }
    NSString*sql=@"insert into MainLike3(eid,cover_image,index_title,type) values(?,?,?,?)";
    BOOL ret=[_database executeUpdate:sql,mainModel.eid,mainModel.cover_image,mainModel.index_title,@"trip"];
    if(!ret){
        NSLog(@"insert error:%@",_database.lastErrorMessage);
    }
}
- (void)insertPlayModel:(id)model{
    PlayModel*palyModel=(PlayModel*)model;
    if([self isExistInfoForid:nil mainId:nil playId:palyModel.playId]){
        return;
    }
    NSString*sql=@"insert into PlayLike3(playId,cover_image_1600,name,type) values(?,?,?,?)";
    BOOL ret=[_database executeUpdate:sql,palyModel.playId,palyModel.cover_image_1600,palyModel.name,@"play"];
    if(!ret){
          NSLog(@"insert error:%@",_database.lastErrorMessage);
    }
}
- (void)deleteModelForStory:(NSString *)spotId{
    NSString*sql=@"delete from StoryLike3 where spot_id = ?";
    BOOL ret=[_database executeUpdate:sql,spotId];
    if(!ret){
      NSLog(@"删除失败");
    }
}
- (void)deleteModelForMain:(NSString *)mainID{
    NSString*sql=@"delete from MainLike3 where eid = ?";
    BOOL ret=[_database executeUpdate:sql,mainID];
    if (!ret) {
        NSLog(@"删除失败");
    }
    
}
- (void)deleteModelForPlay:(NSString *)playID{
    NSString*sql=@"delete from PlayLike3 where playId = ?";
    BOOL ret=[_database executeUpdate:sql,playID];
    if (!ret) {
        NSLog(@"删除失败");
    }
}
- (NSMutableArray*)readModelsWithRecordType:(NSString *)type{
    FMResultSet*rs=nil;
    NSMutableArray*arr=[NSMutableArray array];
    if([type isEqualToString:@"story"]){
         NSString*sql=@"select * from StoryLike3 where type = ?";
        rs=[_database executeQuery:sql,type];
        while ([rs next]) {
            StoryModel*model=[[StoryModel alloc]init];
            model.spot_id=[rs stringForColumn:@"spot_id"];
            model.index_title=[rs stringForColumn:@"index_title"];
            model.cover_image_w640=[rs  stringForColumn:@"cover_image_w640"];
            [arr addObject:model];
            
        }
        return arr;
    }else if ([type isEqualToString:@"trip"]){
        NSString*sql=@"select * from MainLike3 where type = ?";
        rs=[_database executeQuery:sql,type];
        while ([rs next]) {
            MainModel*model=[[MainModel alloc]init];
            model.cover_image=[rs stringForColumn:@"cover_image"];
            model.index_title=[rs stringForColumn:@"index_title"];
            model.eid=[rs stringForColumn:@"eid"];
            [arr addObject:model];
        }
        return arr;
    }else{
        NSString*sql=@"select * from PlayLike3 where type = ?";
        rs=[_database executeQuery:sql,type];
        while ([rs next]) {
            PlayModel*model=[[PlayModel alloc]init];
            model.name=[rs stringForColumn:@"name"];
            model.cover_image_1600=[rs stringForColumn:@"cover_image_1600"];
            model.playId=[rs stringForColumn:@"playId"];
            [arr addObject:model];
            
        }
        return arr;
    }
}
- (BOOL)isExistInfoForid:(NSString *)spotId mainId:(NSString *)mainId playId:(NSString *)playId{
    NSString*sql;
    FMResultSet*rs=nil;
    if(spotId){
       sql=@"select * from StoryLike3 where spot_id = ?";
        rs=[_database executeQuery:sql,spotId];
    }else if(mainId){
         sql=@"select * from MainLike3 where eid = ?";
        rs=[_database executeQuery:sql,mainId];
    }else{
        sql=@"select * from PlayLike3 where playId = ?";
        rs=[_database executeQuery:sql,playId];
    }
    if([rs next]){
        return YES;
    }else{
        return NO;
    }
}
- (NSInteger)getCountsFromAppWithRecordType:(NSString*)type{
      NSString*sql=@"select count(*) from Recipes where recordType = ?";
    FMResultSet*rs=[_database executeQuery:sql,type];
    NSInteger count=0;
    while ([rs next]) {
        count=[[rs stringForColumn:0] integerValue];
    }
    return count;
    
    
}
@end
