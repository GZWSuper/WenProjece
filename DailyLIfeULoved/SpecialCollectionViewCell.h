//
//  SpecialCollectionViewCell.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpecialCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImge;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *intextLabel;
@property (weak, nonatomic) IBOutlet UILabel *cateLabel;

@end
