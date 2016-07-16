//
//  HYGNoHistoryButRecView.m
//  Pods
//
//  Created by ITxiansheng on 16/7/14.
//
//

#import "HYGNoHistoryButRecView.h"
#import "Masonry.h"
#import "LDTagView.h"
#import "UIColor+Utility.h"
#define kScreenWidth  (CGRectGetWidth([UIScreen mainScreen].bounds))

@interface HYGNoHistoryButRecView()

@property (nonatomic,strong) UILabel *hintRecLabel;
@property (nonatomic,strong) LDTagView *tagView;
@property (nonatomic,strong) UIImageView *hintAppImageView;
@property (nonatomic,strong) UIView *leftLine;
@property (nonatomic,strong) UIView *rightLine;

@property (nonatomic,strong) NSArray <LDTag *> *tags;

@end
@implementation HYGNoHistoryButRecView

#pragma mark - Life cycle

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initSubVies];
        [self setUpConstrains];
    }
    return self;
}
#pragma mark - Life pulic

- (void)configTagViewWithData:(nonnull NSArray <LDTag *> *)tags{
    [tags enumerateObjectsUsingBlock:^(LDTag * _Nonnull tag, NSUInteger idx, BOOL * _Nonnull stop) {
        _tags = tags;
        [tags enumerateObjectsUsingBlock:^(LDTag * _Nonnull tag, NSUInteger idx, BOOL * _Nonnull stop) {
            [self.tagView addTag:tag];
        }];    }];
}

#pragma mark - Life private
- (void)initSubVies{
    self.backgroundColor = [UIColor colorWithHex:0xf4f4f4];
    [self addSubview:self.hintAppImageView];
    [self addSubview:self.hintRecLabel];
    [self addSubview:self.leftLine];
    [self addSubview:self.rightLine];
    [self addSubview:self.tagView];
}

-(void)setUpConstrains{
    [self.hintRecLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(20);
        make.left.equalTo(self.mas_left).offset(0.04*kScreenWidth);
    }];
    [self.tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.hintRecLabel.mas_bottom).offset(15);
        make.left.equalTo(self.mas_left).offset(0.04*kScreenWidth);
        make.right.equalTo(self.mas_right).offset(-0.13*kScreenWidth);
    }];
    [self.hintAppImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.tagView.mas_bottom).offset(40);
    }];
    [self.leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(1.0/[UIScreen mainScreen].scale));
        make.left.equalTo(self.mas_left).offset(0.04*kScreenWidth);
        make.centerY.equalTo(self.hintAppImageView.mas_centerY);
        make.right.equalTo(self.hintAppImageView.mas_left).offset(-20);
    }];
    [self.rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-0.04*kScreenWidth);
        make.left.equalTo(self.hintAppImageView.mas_right).offset(20);
        make.centerY.equalTo(self.hintAppImageView.mas_centerY);
        make.height.equalTo(@(1.0/[UIScreen mainScreen].scale));

    }];
}

#pragma mark -  getter

- (UILabel *)hintRecLabel{
    if (!_hintRecLabel) {
        _hintRecLabel = [UILabel new];
        _hintRecLabel.textColor = [UIColor colorWithHex:0xaaaaaa];
        _hintRecLabel.font = [UIFont systemFontOfSize:14];
        _hintRecLabel.text = @"热门搜索";
    }
    return _hintRecLabel;
}

- (UIImageView *)hintAppImageView{
    if (!_hintAppImageView) {
        _hintAppImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"hyg_appBgHintIcon"]];
        _hintAppImageView.backgroundColor = [UIColor clearColor];
        _hintAppImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _hintAppImageView;
}

- (UIView *)leftLine{
    if (!_leftLine) {
        _leftLine = [UIView new];
        _leftLine.backgroundColor = [UIColor colorWithHex:0xaaaaaa];
    }
    return _leftLine;
}
- (UIView *)rightLine{
    if (!_rightLine) {
        _rightLine = [UIView new];
        _rightLine.backgroundColor = [UIColor colorWithHex:0xaaaaaa];
    }
    return _rightLine;
}

- (LDTagView*)tagView{
    if (!_tagView) {
        _tagView = [LDTagView new];
        _tagView.interitemSpacing = 9;
        _tagView.lineSpacing = 15;
        _tagView.padding =UIEdgeInsetsMake(0, 0, 0, 0);
        _tagView.maxLineCount = 3;
        _tagView.regularButtonHeight = 30;
        __weak typeof(self) weakSelf = self;
        _tagView.didTapTagAtIndex = ^(NSUInteger index){
            __strong typeof(weakSelf) strongSelf = weakSelf;
            if ([strongSelf.delegate respondsToSelector:@selector(tagView: tapRecButtonWithTag:)]){
                [strongSelf.delegate tagView:strongSelf.tagView tapRecButtonWithTag:[strongSelf.tags objectAtIndex:index]];
            }
        };
    }
    return _tagView;
}
@end
