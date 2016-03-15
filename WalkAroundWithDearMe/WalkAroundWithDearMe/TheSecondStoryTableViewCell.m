//
//  TheSecondStoryTableViewCell.m
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/14.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "TheSecondStoryTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation TheSecondStoryTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)staryTwoStoryView:(Detail_listModel *)sender{
    _content.text=sender.text;
    [_largeImage sd_setImageWithURL:[NSURL URLWithString:sender.photo] placeholderImage:[UIImage imageNamed:@"xixi"]];
    _largeImage.clipsToBounds=YES;
    _largeImage.layer.cornerRadius=20;
    NSArray*arr1=[sender.photo_date_created componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"T+"]];
    NSMutableArray*arr=[NSMutableArray arrayWithArray:arr1];
    [arr removeObject:@"08:00"];
    NSMutableString*timerStr=[[NSMutableString alloc]init];
    for(NSString*str in arr){
        [timerStr appendString:str];
    }
    _image_time.text=timerStr;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
