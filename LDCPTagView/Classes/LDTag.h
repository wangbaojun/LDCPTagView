//
//  LDStag.h
//  Pods
//
//  Created by ITxiansheng on 16/7/14.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LDTag : NSObject
///text color
@property (copy, nonatomic, nullable) NSString *text;//文本
@property (copy, nonatomic, nullable) NSAttributedString *attributedText;//格式化文本
@property (strong, nonatomic, nullable) UIColor *normalTextColor;//文本正常状态颜色 默认为0x3C3E45
@property (strong, nonatomic, nullable) UIColor *selectedTextColor;//文本选中状态颜色 默认为0xD91D37
///backgound color
@property (strong, nonatomic, nullable) UIColor *normalBgColor;//按钮正常状态背景色 默认 white
@property (strong, nonatomic, nullable) UIColor *selectedBgColor;//按钮选中状态背景色

///background image
@property (strong, nonatomic, nullable) UIImage *nomalBgImg;//正常状态背景图
@property (strong, nonatomic, nullable) UIImage *selectedBgImg;//选中状态背景图
//boarder
@property (assign, nonatomic) CGFloat cornerRadius;//边框弧度
@property (assign, nonatomic) BOOL selected;//是否选中 用来设置button边框的颜色
@property (strong, nonatomic, nullable) UIColor *normalBorderColor;//正常状态边框颜色
@property (strong, nonatomic, nullable) UIColor *selectedBorderColor;//选中状态边框颜色 默认为0xD91D37
@property (assign, nonatomic) CGFloat borderWidth;//边框宽度
///like padding in css
@property (assign, nonatomic) UIEdgeInsets padding;//文本在按钮内的内嵌位置
@property (strong, nonatomic, nullable) UIFont *font;//文本字体
///if no font is specified, system font with fontSize is used
@property (assign, nonatomic) CGFloat fontSize;//文本大小 默认为15.0
///default:YES
@property (assign, nonatomic) BOOL enable;

/**
 *  @author ITxiansheng, 16-07-14 12:07:52
 *
 *  @brief 实例方法 初始化实例
 *
 *  @param text 指定的文本
 *
 *  @return 实例
 */
- (nonnull instancetype)initWithText: (nonnull NSString *)text;

/**
 *  @author ITxiansheng, 16-07-14 12:07:11
 *
 *  @brief 类方法 初始化实例
 *
 *  @param text 指定的文本
 *
 *  @return 实例
 */
+ (nonnull instancetype)tagWithText: (nonnull NSString *)text;

@end
