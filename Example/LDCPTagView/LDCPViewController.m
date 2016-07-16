////
////  LDCPViewController.m
////  LDCPTagView
////
////  Created by bjwangbaojun on 07/05/2016.
////  Copyright (c) 2016 bjwangbaojun. All rights reserved.
////
//
//#import "LDCPViewController.h"
//#import <Masonry/Masonry.h>
//#import "HYGNoHistoryButRecView.h"
//#import "HYGHasHistoryNoMatterRecView.h"
//
//@interface LDCPViewController ()
//@property (nonatomic ,strong) HYGNoHistoryButRecView *onlyRecommendMultiLineView;
//@property (nonatomic ,strong) HYGHasHistoryNoMatterRecView *sigleLineRecWithHistoryView;
//
//@end
//
//@implementation LDCPViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
//    [self initSubviews];
//    [self setUpConstrains];
//}
//
//
//#pragma mark - private
//
//- (void)initSubviews{
//}
//
//-(void)setUpConstrains{
//    
//
//}
//
//
//
//// 配置
//- (void)configTagView
////{
////    [self.tagView removeAllTags];
////    // 开始加载
////    [@[@"Python", @"Javascript", @"Python", @"Swift", @"Go", @"Objective-C", @"C", @"PHP"] enumerateObjectsUsingBlock: ^(NSString *text, NSUInteger idx, BOOL *stop) {
////        SKTag *tag = [SKTag tagWithText: text];
////        tag.normalTextColor = [UIColor whiteColor];
////        tag.fontSize = 15;
////        //tag.font = [UIFont fontWithName:@"Courier" size:15];
////        //tag.enable = NO;
////        tag.padding = UIEdgeInsetsMake(13.5, 12.5, 13.5, 12.5);
////        tag.normalBgColor = [UIColor redColor];
////        tag.cornerRadius = 5;
////        [self.tagView addTag:tag];
////    }];
////    [self.view setNeedsLayout];
////    [self.view layoutIfNeeded];
////}
//
//
//
//#pragma mark - getter
//
//
//
//- (HYGNoHistoryButRecView *)onlyRecommendMultiLineView{
//    if (!_onlyRecommendMultiLineView) {
//        _onlyRecommendMultiLineView = [[HYGNoHistoryButRecView alloc ]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)];
//    }
//    return _onlyRecommendMultiLineView;
//}
//                                                                                               
//@end
