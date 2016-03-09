//
//  FirstAuthorTableViewCell.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstAuthorTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *authorNameLab;
@property (weak, nonatomic) IBOutlet UILabel *wechatNumLab;
@property (weak, nonatomic) IBOutlet UILabel *intextLab;

@end
