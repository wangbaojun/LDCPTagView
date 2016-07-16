//
//  HYGSingleLineViewController.m
//  LDCPTagView
//
//  Created by ITxiansheng on 16/7/17.
//  Copyright © 2016年 bjwangbaojun. All rights reserved.
//

#import "HYGMultiLinesViewController.h"
#import "HYGNoHistoryButRecView.h"
#import "LDtag.h"
@interface HYGMultiLinesViewController ()

@property (nonatomic,strong) HYGNoHistoryButRecView * noHistoryButRecView;

@end

@implementation HYGMultiLinesViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self initSubViews];
}

#pragma mark - private

- (void)initSubViews{
    [self.view addSubview:self.noHistoryButRecView];
}
- (NSArray <LDTag *>*)createTags{
    NSMutableArray *tagMutualArrary = [NSMutableArray array];
    [@[@"Python", @"Javascript", @"Python", @"Swift", @"Go", @"Objective-C", @"C", @"PHP"] enumerateObjectsUsingBlock: ^(NSString *text, NSUInteger idx, BOOL *stop) {
        LDTag *tag = [LDTag tagWithText:text];
        [tagMutualArrary addObject:tag];
    }];
    return  [tagMutualArrary copy];
}
#pragma mark - getter

- (HYGNoHistoryButRecView *)noHistoryButRecView{
    if (!_noHistoryButRecView) {
        _noHistoryButRecView = [[HYGNoHistoryButRecView alloc]initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)-64)];
        [_noHistoryButRecView configTagViewWithData:[self createTags]];
    }
    return _noHistoryButRecView;
}
@end
