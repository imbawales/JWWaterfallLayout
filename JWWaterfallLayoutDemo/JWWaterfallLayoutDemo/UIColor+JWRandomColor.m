//
//  UIColor+JWRandomColor.m
//  JWWaterfallLayoutDemo
//
//  Created by apple on 17/4/23.
//  Copyright © 2017年 wales. All rights reserved.
//

#import "UIColor+JWRandomColor.h"

@implementation UIColor (JWRandomColor)

+ (UIColor *)randomColor{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
