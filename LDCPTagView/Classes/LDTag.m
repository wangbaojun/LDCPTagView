//
//  LDStag.m
//  Pods
//
//  Created by ITxiansheng on 16/7/14.
//
//

#import "LDTag.h"
#import "UIColor+Utility.h"
static const CGFloat kDefaultFontSize = 15.0;
#define kDefaultNomalTextColor    [UIColor colorWithHex:0x3C3E45];
#define kDefaultSelectedTextColor [UIColor colorWithHex:0xD91D37];
#define kDefaultSelectedBorderColor [UIColor colorWithHex:0xD91D37];


@implementation LDTag

- (instancetype)init {
    self = [super init];
    if (self) {
        //默认赋值
        _fontSize = kDefaultFontSize;
        _normalTextColor = kDefaultNomalTextColor;
        _selectedTextColor = kDefaultSelectedTextColor;
        _selectedBorderColor = kDefaultSelectedBorderColor;
        _selected = YES;
        _padding = UIEdgeInsetsMake(8, 15, 8, 15);
        _normalBgColor = [UIColor whiteColor];
        _borderWidth = 1.0/[UIScreen mainScreen].scale;//一像素
        _cornerRadius = 3.0;
        _enable = YES;
    }
    return self;
}

- (instancetype)initWithText: (NSString *)text {
    self = [self init];
    if (self) {
        _text = text;
    }
    return self;
}

+ (instancetype)tagWithText: (NSString *)text {
    return [[self alloc] initWithText: text];
}

@end
