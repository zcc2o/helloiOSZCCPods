//
//  UIColor+StringColor.m
//  CZCBDemo
//
//  Created by ZCc on 2022/1/21.
//

#import "UIColor+StringColor.h"

@implementation UIColor (StringColor)

+ (UIColor *)colorFromHexString_au:(NSString *)hexStr {

    return [self colorFromHexString_au:hexStr alpha:1];
}

+ (UIColor *)getColorWith16Str:(NSString *)hexStr startIndex:(NSInteger)startIndex length:(NSInteger)length alpha:(CGFloat)alpha {
    NSString *redStr = [hexStr substringWithRange:NSMakeRange(startIndex, length)];
    NSString *greenStr = [hexStr substringWithRange:NSMakeRange(startIndex + 2, length)];
    NSString *blueStr = [hexStr substringWithRange:NSMakeRange(startIndex, length)];
    
    NSInteger redInt = [[NSString stringWithFormat:@"%lu", strtoul([redStr UTF8String],0,16)] integerValue];
    NSInteger greenInt = [[NSString stringWithFormat:@"%lu", strtoul([greenStr UTF8String],0,16)] integerValue];
    NSInteger blueInt = [[NSString stringWithFormat:@"%lu", strtoul([blueStr UTF8String],0,16)] integerValue];
    
    return [UIColor colorWithRed:redInt * 1.0 / 255 green:greenInt * 1.0 / 255 blue:blueInt * 1.0 / 255 alpha:alpha];
}

+ (UIColor *)colorFromHexString_au:(NSString *)hexStr alpha:(CGFloat)alpha {
    if (hexStr.length < 7) {
        return [UIColor blackColor];
    }
    NSString *preStr = [hexStr substringWithRange:NSMakeRange(0, 1)];
    NSString *preStr2 = [hexStr substringWithRange:NSMakeRange(0, 2)];
    if ([preStr isEqualToString:@"#"]) {
        // #3264FF 类型
        return [self getColorWith16Str:hexStr startIndex:1 length:2 alpha:alpha];
    } else if ([preStr2 isEqualToString:@"0x"]) {
        // 0x3264FF 类型
        if (hexStr.length < 8) {
            hexStr = [hexStr stringByAppendingFormat:@"%@F",hexStr];
        }
        return [self getColorWith16Str:hexStr startIndex:1 length:2 alpha:alpha];
    } else {
        return [UIColor blackColor];
    }
}

@end
