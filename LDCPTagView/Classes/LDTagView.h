//
//  LDTagView.h
//  Pods
//
//  Created by ITxiansheng on 16/7/14.
//
//

#import <UIKit/UIKit.h>
@class LDTag;
@interface LDTagView : UIView
@property (assign, nonatomic) UIEdgeInsets padding;//view 上下左右预留的间隙
@property (assign, nonatomic) CGFloat lineSpacing;
@property (assign, nonatomic) CGFloat interitemSpacing;
@property (assign, nonatomic) CGFloat preferredMaxLayoutWidth;//view的最大宽度
//**********不能同时设置 最大宽度和固定宽度
@property (assign, nonatomic) CGFloat regularButtonWidth; //!< button固定的宽度
@property (nonatomic,assign ) CGFloat regularButtonHeight; //!< button固定的高度
@property (nonatomic,assign ) CGFloat maxButtonWidth; //!< button最大的宽度
@property (nonatomic,assign ) CGFloat maxLineCount; //!< view最多显示多少行按钮
@property (assign, nonatomic) BOOL singleLine;//是否单行显示,不限制宽度
@property (copy, nonatomic, nullable) void (^didTapTagAtIndex)(NSUInteger index);//点击某个button的回调的block index为button的索引

/**
 *  @author ITxiansheng, 16-07-14 14:07:20
 *
 *  @brief 根据指定的tag生成新的button，添加的最后显示
 *
 *  @param tag 指定的tag
 */
- (void)addTag: (nonnull LDTag *)tag;
/**
 *  @author ITxiansheng, 16-07-14 14:07:24
 *
 *  @brief 在指定位置添加 指定tag对应的button
 *
 *  @param tag   要添加的tag
 *  @param index 添加的位置 从0 开始
 */
- (void)insertTag: (nonnull LDTag *)tag atIndex:(NSUInteger)index;

/**
 *  @author ITxiansheng, 16-07-14 14:07:42
 *
 *  @brief 删除指定的tag对应的button
 *
 *  @param tag 要删除的tag
 */
- (void)removeTag: (nonnull LDTag *)tag;

/**
 *  @author ITxiansheng, 16-07-14 14:07:11
 *
 *  @brief 删除指定位置的button
 *
 *  @param index 指定的位置
 */
- (void)removeTagAtIndex: (NSUInteger)index;

/**
 *  @author ITxiansheng, 16-07-14 14:07:41
 *
 *  @brief 清空button
 */
- (void)removeAllTags;

@end
