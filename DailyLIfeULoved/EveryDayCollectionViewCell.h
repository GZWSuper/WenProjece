//
//  EveryDayCollectionViewCell.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EveryDayCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *dayLab;

@property (weak, nonatomic) IBOutlet UILabel *dateLab;


@property (weak, nonatomic) IBOutlet UIImageView *imagv;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *classNameLab;

@end
