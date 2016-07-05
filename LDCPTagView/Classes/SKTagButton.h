//
//  Created by bjwangbaojun on 07/05/2016.
//  Copyright (c) 2016 bjwangbaojun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SKTag;
@interface SKTagButton: UIButton

+ (nonnull instancetype)buttonWithTag: (nonnull SKTag *)tag;

@end