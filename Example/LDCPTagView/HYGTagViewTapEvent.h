//
//  HYGTagViewTapEvent.h
//  Pods
//
//  Created by ITxiansheng on 16/7/16.
//
//

#import <Foundation/Foundation.h>
#import "LDTagView.h"
@protocol HYGTagViewTapEvent <NSObject>

- (void)tagView:(nonnull LDTagView *)view tapRecButtonWithTag:(nonnull LDTag *)tag;

@end
