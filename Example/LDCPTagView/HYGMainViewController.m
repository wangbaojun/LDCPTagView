//
//  HYGMainViewController.m
//  LDCPTagView
//
//  Created by ITxiansheng on 16/7/17.
//  Copyright © 2016年 bjwangbaojun. All rights reserved.
//

#import "HYGMainViewController.h"
#import <Masonry/Masonry.h>
#import "HYGMultiLinesViewController.h"
#import "HYGSigleLineViewController.h"
@interface HYGMainViewController ()

@property (nonatomic ,strong) UIButton *onlyRecommendMultiLineButton;
@property (nonatomic ,strong) UIButton *sigleLineRecWithHistoryButton;

@end

@implementation HYGMainViewController

- (instancetype)init{
    if (self = [super init]) {
        self.title = @"首页";
    }
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    [self initSubviews];
    [self setUpConstrains];
}


#pragma mark - private

- (void)initSubviews{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.onlyRecommendMultiLineButton];
    [self.view addSubview:self.sigleLineRecWithHistoryButton];
}

-(void)setUpConstrains{
    [self.onlyRecommendMultiLineButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(30);
    }];
    
    [self.sigleLineRecWithHistoryButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(-30);
    }];
    
    
}

#pragma mark - Action
- (void)buttonTaped:(id)sender{
    if (sender == self.onlyRecommendMultiLineButton) {
        [self.navigationController pushViewController:[HYGMultiLinesViewController new] animated:YES];
    }else{
        [self.navigationController pushViewController:[HYGSigleLineViewController new] animated:YES];

        
    }
    
}
#pragma mark - getter

- (UIButton *)onlyRecommendMultiLineButton{
    if (!_onlyRecommendMultiLineButton) {
        _onlyRecommendMultiLineButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _onlyRecommendMultiLineButton.backgroundColor = [UIColor grayColor];
        [_onlyRecommendMultiLineButton setTitle:@"显示多行推荐" forState:UIControlStateNormal];
        [_onlyRecommendMultiLineButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        _onlyRecommendMultiLineButton.titleLabel.font = [UIFont systemFontOfSize:20.0];
        [_onlyRecommendMultiLineButton addTarget:self action:@selector(buttonTaped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _onlyRecommendMultiLineButton;
}

- (UIButton *)sigleLineRecWithHistoryButton{
    if (!_sigleLineRecWithHistoryButton) {
        _sigleLineRecWithHistoryButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sigleLineRecWithHistoryButton.backgroundColor = [UIColor grayColor];
        [_sigleLineRecWithHistoryButton setTitle:@"显示单行推荐与搜索记录" forState:UIControlStateNormal];
        [_sigleLineRecWithHistoryButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        _sigleLineRecWithHistoryButton.titleLabel.font = [UIFont systemFontOfSize:20.0];
        [_sigleLineRecWithHistoryButton addTarget:self action:@selector(buttonTaped:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _sigleLineRecWithHistoryButton;
}
@end
