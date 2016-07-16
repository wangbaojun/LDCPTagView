//
//  UIColor+Utility.h
//  Pods
//
//  Created by ITxiansheng on 16/7/17.
//
//

#import <UIKit/UIKit.h>

@interface UIColor (Utility)

/**
 *  传入int型色值和alpha生成对应UIColor对象
 *
 *  @param hexValue RGB色值
 *  @param alpha    色值 Aplha 通道
 *
 *  @return The color object. The color information represented by this object is in the device RGB colorspace.
 */
+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alpha;

/**
 *  传入int型色值和alpha生成对应UIColor对象 alpha 为 1.0
 *
 *  @param hexValue RGB色值
 *
 *  @return The color object. The color information represented by this object is in the device RGB colorspace.
 */
+ (UIColor *)colorWithHex:(NSInteger)hexValue;

/**
 *  传入int型ARGB色值生成对应UIColor对象
 *
 *  @param ARGBValue The integer value of ARGB color. From 0x00000000 to 0xFFFFFFFF.
 *
 *  @return The color object. The color information represented by this object is in the device RGB colorspace.
 */
+ (UIColor *)colorWithARGB:(NSInteger)ARGBValue;


@end
