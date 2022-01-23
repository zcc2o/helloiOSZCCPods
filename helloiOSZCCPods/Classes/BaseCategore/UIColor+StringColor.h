//
//  UIColor+StringColor.h
//  CZCBDemo
//
//  Created by ZCc on 2022/1/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (StringColor)
+ (UIColor *)colorFromHexString_au:(NSString *)hexStr;

+ (UIColor *)colorFromHexString_au:(NSString *)hexStr alpha:(CGFloat)alpha;
@end

NS_ASSUME_NONNULL_END
