//
//  SKTagView.h
//
//  Created by bjwangbaojun on 07/05/2016.
//  Copyright (c) 2016 bjwangbaojun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKTag.h"

@interface SKTagView : UIView

@property (assign, nonatomic) UIEdgeInsets padding;
@property (assign, nonatomic) CGFloat lineSpacing;
@property (assign, nonatomic) CGFloat interitemSpacing;
@property (assign, nonatomic) CGFloat preferredMaxLayoutWidth;
@property (assign, nonatomic) CGFloat regularWidth; //!< button固定的宽度
@property (nonatomic,assign ) CGFloat regularHeight; //!< button固定的高度
@property (assign, nonatomic) BOOL singleLine;//是否单行显示
@property (copy, nonatomic, nullable) void (^didTapTagAtIndex)(NSUInteger index);//点击某个button的回调的block

- (void)addTag: (nonnull SKTag *)tag;
- (void)insertTag: (nonnull SKTag *)tag atIndex:(NSUInteger)index;
- (void)removeTag: (nonnull SKTag *)tag;
- (void)removeTagAtIndex: (NSUInteger)index;
- (void)removeAllTags;

@end

