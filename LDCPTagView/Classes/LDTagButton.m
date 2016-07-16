//
//  LDStagButton.m
//  Pods
//
//  Created by ITxiansheng on 16/7/14.
//
//

#import "LDTagButton.h"
#import "LDTag.h"
@implementation LDTagButton

+ (instancetype)buttonWithTag: (LDTag *)tag {
    LDTagButton *btn = [super buttonWithType:UIButtonTypeCustom];
    if (tag.attributedText) {
        [btn setAttributedTitle: tag.attributedText forState: UIControlStateNormal];
    } else {
        // text normalTextColor selectedTextColor 肯定不为空
        [btn setTitle: tag.text forState:UIControlStateNormal];
        [btn setTitleColor: tag.normalTextColor forState: UIControlStateNormal];
        [btn setTitleColor: tag.selectedTextColor forState: UIControlStateSelected];
        btn.titleLabel.font = tag.font ?: [UIFont systemFontOfSize: tag.fontSize];
    }
    //背景色肯定不为空
    btn.backgroundColor = tag.normalBgColor;
    btn.contentEdgeInsets = tag.padding;
    btn.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    if (tag.nomalBgImg) {
        [btn setBackgroundImage: tag.nomalBgImg forState: UIControlStateNormal];
    }
    if (tag.selectedBgImg) {
        [btn setBackgroundImage: tag.selectedBgImg forState: UIControlStateSelected];
    }
    if (tag.selected) {
        btn.layer.borderColor = tag.selectedBorderColor.CGColor;
    }else{
        btn.layer.borderColor = tag.normalBgColor.CGColor;
    }
    if (tag.borderWidth) {
        btn.layer.borderWidth = tag.borderWidth;
    }
    btn.userInteractionEnabled = tag.enable;
    if (tag.selectedBgColor) {
        [btn setBackgroundImage:[self imageWithColor:tag.selectedBgColor] forState:UIControlStateSelected];
    }
    if (tag.cornerRadius) {
        btn.layer.cornerRadius = tag.cornerRadius;
    }
    btn.layer.masksToBounds = YES;
    return btn;
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
