//
//  ColorChange.m
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "ColorChange.h"

@implementation ColorChange
+ (UIColor*)colorString:(NSString*)str{
    if(!str|| [str isEqualToString:@""]){
        return nil;
    }
    unsigned red,greeen,blue;
    NSRange range;
    range.length=2;
    range.location=1;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&red];
    range.location=3;
    [[NSScanner scannerWithString:[str substringWithRange:range]]scanHexInt:&greeen];
    range.location=5;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&blue];
    UIColor*color=[UIColor colorWithRed:red/255.0f green:greeen/255.0f blue:255.0f alpha:1];
    return color;
}

@end
