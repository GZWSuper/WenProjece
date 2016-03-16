//
//  SearchCollectionViewCell.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/16.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchElementsModel.h"
@interface SearchCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
- (void)starySeach:(SearchElementsModel*)sender;
@end