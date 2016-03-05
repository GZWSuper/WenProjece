//
//  ImageModel.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "JSONModel.h"
@protocol ImageModel <NSObject>

@end

@interface ImageModel : JSONModel
@property (copy) NSString<Optional> * url;
@property (strong) NSNumber<Optional> * type;

@end
