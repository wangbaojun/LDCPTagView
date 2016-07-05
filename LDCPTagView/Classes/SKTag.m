//
//  Created by bjwangbaojun on 07/05/2016.
//  Copyright (c) 2016 bjwangbaojun. All rights reserved.
//

#import "SKTag.h"

static const CGFloat kDefaultFontSize = 13.0;

@implementation SKTag

- (instancetype)init {
    self = [super init];
    if (self) {
        //默认赋值
        _fontSize = kDefaultFontSize;
        _textColor = [UIColor blackColor];
        _bgColor = [UIColor whiteColor];
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