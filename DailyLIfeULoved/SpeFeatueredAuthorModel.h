//
//  SpeFeatueredAuthorModel.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"
@protocol SpeFeaturedAuthorModel <NSObject>

@end

@interface SpeFeatueredAuthorModel : JSONModel
@property (strong) NSNumber<Optional> * priority;

@end
