//
//  LDStagButton.h
//  Pods
//
//  Created by ITxiansheng on 16/7/14.
//
//

#import <UIKit/UIKit.h>

@class LDTag;

@interface LDTagButton : UIButton
/**
*  @author ITxiansheng, 16-07-14 12:07:12
*
*  @brief 根据给定的tag 利用tag的属性来初始化按钮
*
*  @param tag 指定的tag
*
*  @return 实例
*/
+ (nonnull instancetype)buttonWithTag: (nonnull LDTag *)tag;
@end
