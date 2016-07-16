//
//  LDTagView.m
//  Pods
//
//  Created by ITxiansheng on 16/7/14.
//
//

#import "LDTagView.h"
#import "LDTagButton.h"

@interface LDTagView ()
@property (strong, nonatomic, nullable) NSMutableArray *tags;//tags集合
@property (assign, nonatomic) BOOL didSetup;//标识是否需要重新布局
@property (nonatomic,assign) BOOL isSetRegularButtonWidth;  //!<是否宽度固定
@property (nonatomic,assign) BOOL isSetRegularButtonHeight; //!<是否高度固定
@property (nonatomic,assign) BOOL isSetMaxLineCount;  //!<是否设置了最大行数
@property (nonatomic,assign) BOOL isSetButtonMaxWidth;  //!<是否设置了最大宽度
@end

@implementation LDTagView

#pragma mark - Lifecycle

- (instancetype)init{
    if (self = [super init]) {
        self.clipsToBounds = YES;
    }
    return self;
}

-(CGSize)intrinsicContentSize {
    if (!self.tags.count) {
        return CGSizeZero;
    }
    NSArray *subviews = self.subviews;
    UIView *previousView = nil;
    //上下左右间隙
    CGFloat topPadding = self.padding.top;
    CGFloat bottomPadding = self.padding.bottom;
    CGFloat leftPadding = self.padding.left;
    CGFloat rightPadding = self.padding.right;
    //
    CGFloat itemSpacing = self.interitemSpacing;
    CGFloat lineSpacing = self.lineSpacing;
    
    CGFloat currentX = leftPadding;
    CGFloat intrinsicHeight = topPadding;
    CGFloat intrinsicWidth = leftPadding;
    
    if (!self.singleLine && self.preferredMaxLayoutWidth > 0) {
        NSInteger lineCount = 0;
        for (UIView *view in subviews) {
            CGSize size = view.intrinsicContentSize;
            CGFloat width = 0;
            //如果设置了固定宽度
            if (self.isSetRegularButtonWidth) {
                width = self.regularButtonWidth;
            }
            //如果设置了最大宽度
            else if (self.isSetButtonMaxWidth){
                if (size.width>self.maxButtonWidth) {
                    width = self.maxButtonWidth;
                }else{
                    width = size.width;
                }
            }
            //如果二者都没有设置
            else{
                width = size.width;
            }
            CGFloat height = self.isSetRegularButtonHeight?self.regularButtonHeight:size.height;
            if (previousView) {
                currentX += itemSpacing;
                if (currentX + width + rightPadding <= self.preferredMaxLayoutWidth) {
                    currentX += width;
                } else {
                    lineCount ++;
                    currentX = leftPadding + width;
                    intrinsicHeight += height;
                }
            } else {
                lineCount ++;
                intrinsicHeight += height;
                currentX += width;
            }
            previousView = view;
            intrinsicWidth = MAX(intrinsicWidth, currentX + rightPadding);
            //如果达到了最大行数，则停止添加
            if (self.isSetMaxLineCount && lineCount == self.maxLineCount) {
                break;
            }
        }
        intrinsicHeight += bottomPadding + lineSpacing * (lineCount - 1);
    } else {
        for (UIView *view in subviews) {
            CGSize size = view.intrinsicContentSize;
            //如果设置了固定宽度
            if (self.isSetRegularButtonWidth) {
                intrinsicWidth  += self.regularButtonWidth;
            }
            //如果设置了最大宽度
            else if (self.isSetButtonMaxWidth){
                if (size.width>self.maxButtonWidth) {
                    intrinsicWidth += self.maxButtonWidth;
                }else{
                    intrinsicWidth += size.width;
                }
            }
            //如果二者都没有设置
            else{
                intrinsicWidth += size.width;
            }
        }
        intrinsicWidth += itemSpacing * (subviews.count - 1) + rightPadding;
        intrinsicHeight += ((UIView *)subviews.firstObject).intrinsicContentSize.height + bottomPadding;
    }
    return CGSizeMake(intrinsicWidth, intrinsicHeight);
}

- (void)layoutSubviews {
    if (!self.singleLine) {
        self.preferredMaxLayoutWidth = self.frame.size.width;
    }
    
    [super layoutSubviews];
    
    [self layoutTags];
}

#pragma mark - Custom accessors

- (NSMutableArray *)tags {
    if(!_tags) {
        _tags = [NSMutableArray array];
    }
    return _tags;
}

- (void)setPreferredMaxLayoutWidth: (CGFloat)preferredMaxLayoutWidth {
    if (preferredMaxLayoutWidth != _preferredMaxLayoutWidth) {
        _preferredMaxLayoutWidth = preferredMaxLayoutWidth;
        _didSetup = NO;
        [self invalidateIntrinsicContentSize];
    }
}

#pragma mark - Private

- (void)layoutTags {
    if (self.didSetup || !self.tags.count) {
        return;
    }
    
    NSArray *subviews = self.subviews;
    UIView *previousView = nil;
    CGFloat topPadding = self.padding.top;
    CGFloat leftPadding = self.padding.left;
    CGFloat rightPadding = self.padding.right;
    CGFloat itemSpacing = self.interitemSpacing;
    CGFloat lineSpacing = self.lineSpacing;
    CGFloat currentX = leftPadding;
    
    if (!self.singleLine && self.preferredMaxLayoutWidth > 0) {
        NSInteger lineCount = 0;
        for (UIView *view in subviews) {
            CGSize size = view.intrinsicContentSize;
            CGFloat buttonWidth;
            //如果设置了固定宽度
            if (self.isSetRegularButtonWidth) {
                buttonWidth = self.regularButtonWidth;
            }
            //如果设置了最大宽度
            else if (self.isSetButtonMaxWidth){
                if (size.width>self.maxButtonWidth) {
                    buttonWidth = self.maxButtonWidth;
                }else{
                    buttonWidth = size.width;
                }
            }
            //如果二者都没有设置
            else{
                buttonWidth = size.width;
            }
            CGFloat buttonHeight = self.isSetRegularButtonHeight?self.regularButtonHeight:size.height;
            if (previousView) {
                //                CGFloat width = size.width;
                currentX += itemSpacing;
                if (currentX + buttonWidth + rightPadding <= self.preferredMaxLayoutWidth) {
                    view.frame = CGRectMake(currentX, CGRectGetMinY(previousView.frame), buttonWidth, buttonHeight);
                    currentX += buttonWidth;
                } else {
                    lineCount ++;
                    CGFloat width = MIN(buttonWidth, self.preferredMaxLayoutWidth - leftPadding - rightPadding);
                    view.frame = CGRectMake(leftPadding, CGRectGetMaxY(previousView.frame) + lineSpacing, width, buttonHeight);
                    currentX = leftPadding + width;
                }
            } else {
                lineCount ++;
                CGFloat width = MIN(size.width, self.preferredMaxLayoutWidth - leftPadding - rightPadding);
                view.frame = CGRectMake(leftPadding, topPadding, width, buttonHeight);
                currentX += width;
            }
            previousView = view;
            //如果达到了最大行数，则停止添加
            if (self.isSetMaxLineCount && lineCount == self.maxLineCount) {
                break;
            }
        }
    } else {
        for (UIView *view in subviews) {
            CGSize size = view.intrinsicContentSize;
            CGFloat buttonWidth;
            //如果设置了固定宽度
            if (self.isSetRegularButtonWidth) {
                buttonWidth =self.regularButtonWidth;
            }
            //如果设置了最大宽度
            else if (self.isSetButtonMaxWidth){
                if (size.width>self.maxButtonWidth) {
                    buttonWidth = self.maxButtonWidth;
                }else{
                    buttonWidth = size.width;
                }
            }
            //如果二者都没有设置
            else{
                buttonWidth = size.width;
            }
            
            view.frame = CGRectMake(currentX, topPadding, buttonWidth, self.isSetRegularButtonHeight?self.regularButtonHeight:size.height);
            currentX += buttonWidth + itemSpacing;
            previousView = view;
        }
    }
    
    self.didSetup = YES;
}

#pragma mark - Button Action

- (void)onTag: (UIButton *)btn {
    if (self.didTapTagAtIndex) {
        self.didTapTagAtIndex([self.subviews indexOfObject: btn]);
    }
}

#pragma mark - Public

- (void)addTag: (LDTag *)tag {
    NSParameterAssert(tag);
    LDTagButton *btn = [LDTagButton buttonWithTag: tag];
    btn.selected = YES;
    [btn addTarget: self action: @selector(onTag:) forControlEvents: UIControlEventTouchUpInside];
    [self addSubview: btn];
    [self.tags addObject: tag];
    self.didSetup = NO;
    [self invalidateIntrinsicContentSize];
}

- (void)insertTag: (LDTag *)tag atIndex: (NSUInteger)index {
    NSParameterAssert(tag);
    if (index + 1 > self.tags.count) {
        [self addTag: tag];
    } else {
        LDTagButton *btn = [LDTagButton buttonWithTag: tag];
        [btn addTarget: self action: @selector(onTag:) forControlEvents: UIControlEventTouchUpInside];
        [self insertSubview: btn atIndex: index];
        [self.tags insertObject: tag atIndex: index];
        
        self.didSetup = NO;
        [self invalidateIntrinsicContentSize];
    }
}

/**
 *  @author ITxiansheng, 16-07-05 14:07:21
 *
 *  @brief 移除给定的tag 并且移除对应的button。
 *
 *  @param tag 要移除的tag
 */
- (void)removeTag: (LDTag *)tag {
    NSParameterAssert(tag);
    NSUInteger index = [self.tags indexOfObject: tag];
    if (NSNotFound == index) {
        return;
    }
    
    [self.tags removeObjectAtIndex: index];
    if (self.subviews.count > index) {
        [self.subviews[index] removeFromSuperview];
    }
    
    self.didSetup = NO;
    [self invalidateIntrinsicContentSize];
}

/**
 *  @author ITxiansheng, 16-07-05 14:07:32
 *
 *  @brief 根据给定的index 移除 对应的 tag 。！！index从0 开始
 *
 *  @param index 要移除的tag的index
 */
- (void)removeTagAtIndex: (NSUInteger)index {
    if (index + 1 > self.tags.count) {
        return;
    }
    
    [self.tags removeObjectAtIndex: index];
    if (self.subviews.count > index) {
        [self.subviews[index] removeFromSuperview];
    }
    
    self.didSetup = NO;
    [self invalidateIntrinsicContentSize];
}
/**
 *  @author ITxiansheng, 16-07-05 14:07:56
 *
 *  @brief //移除所有tag 以及对应的button
 */
- (void)removeAllTags {
    [self.tags removeAllObjects];
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    self.didSetup = NO;
    [self invalidateIntrinsicContentSize];
}

#pragma mark - setter

// 重写setter给bool赋值
- (void)setRegularButtonWidth:(CGFloat)regularButtonWidth
{
    if (_regularButtonWidth != regularButtonWidth) {
        _regularButtonWidth = regularButtonWidth;
        if (regularButtonWidth == 0) {
            self.isSetRegularButtonWidth = NO;
        }
        else
        {
            self.isSetRegularButtonWidth = YES;
        }
    }
    
}
// 重写setter给bool赋值
- (void)setRegularButtonHeight:(CGFloat)regularButtonHeight
{
    if (_regularButtonHeight != regularButtonHeight) {
        _regularButtonHeight = regularButtonHeight;
        if (regularButtonHeight == 0)
        {
            self.isSetRegularButtonHeight = NO;
        }
        else
        {
            self.isSetRegularButtonHeight = YES;
        }
    }
}

// 重写setter给bool赋值
- (void)setMaxLineCount:(CGFloat)maxLineCount
{
    if (_maxLineCount != maxLineCount) {
        _maxLineCount = maxLineCount;
        if (maxLineCount == 0)
        {
            _isSetMaxLineCount = NO;
        }
        else
        {
            _isSetMaxLineCount = YES;
        }
    }
}
// 重写setter给bool赋值
- (void)setMaxButtonWidth:(CGFloat)maxButtonWidth
{
    if (_maxButtonWidth != maxButtonWidth) {
        _maxButtonWidth = maxButtonWidth;
        if (maxButtonWidth == 0)
        {
            _isSetButtonMaxWidth = NO;
        }
        else
        {
            _isSetButtonMaxWidth = YES;
        }
    }
}
@end
