//
//  HYGNoHistoryButRecView.h
//  Pods
//
//  Created by ITxiansheng on 16/7/14.
//
//

#import <UIKit/UIKit.h>
#import "HYGTagViewTapEvent.h"
@class LDTag;

@interface HYGNoHistoryButRecView : UIView

@property (nonatomic, weak, nullable) id<HYGTagViewTapEvent> delegate;

- (void)configTagViewWithData:(nonnull NSArray <LDTag *> *)tags;

@end
