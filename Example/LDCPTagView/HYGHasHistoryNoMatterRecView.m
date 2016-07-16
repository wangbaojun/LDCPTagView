//
//  HYGHasHistoryNoMatteRec.m
//  Pods
//
//  Created by ITxiansheng on 16/7/15.
//
//

#import "HYGHasHistoryNoMatterRecView.h"
#import "LDTagView.h"
#import "Masonry.h"
#import "UIColor+Utility.h"
#define kScreenWidth  (CGRectGetWidth([UIScreen mainScreen].bounds))

@interface HYGHasHistoryNoMatterRecView()
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) LDTagView *tagView;
@property (nonatomic,strong) UILabel *hintLabel;
@property (nonatomic,strong) NSArray <LDTag *> *tags;

@end

@implementation HYGHasHistoryNoMatterRecView

#pragma mark - Life cycle

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initSubViews];
        [self setUpConstrains:HasHistoryNoMatterRecViewHasRecType];
    }
    return self;
}

#pragma mark -  private
- (void)initSubViews{
    self.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:self.hintLabel];
    [self.scrollView addSubview:self.tagView];
    [self addSubview:self.scrollView];
    [self addSubview:self.searchHistoryTableView];
}

-(void)setUpConstrains:(HasHistoryNoMatterRecViewType) type{
    if (type == HasHistoryNoMatterRecViewHasRecType) {
        [self.hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.scrollView.mas_left).offset(0.04*kScreenWidth);
            make.centerY.equalTo(self.scrollView);
            make.right.equalTo(self.tagView.mas_left).offset(-10);
        }];
        [self.tagView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.scrollView.mas_top).offset(10);
            make.bottom.equalTo(self.scrollView.mas_bottom).offset(-10);
            make.right.equalTo(self.scrollView);
        }];
        [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self);
            make.height.equalTo(@54);
        }];
        [self.searchHistoryTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.scrollView.mas_bottom);
            make.left.right.bottom.equalTo(self);
        }];
    }else{
        [self.searchHistoryTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.left.right.bottom.equalTo(self);
        }];
    }
}

#pragma mark -  public
- (void)configTagViewWithData:(nonnull NSArray <LDTag *> *)tags{
    _tags = tags;
    [tags enumerateObjectsUsingBlock:^(LDTag * _Nonnull tag, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.tagView addTag:tag];
    }];
}

- (void)setDiaplayType:(HasHistoryNoMatterRecViewType) type{
    [self setUpConstrains:type];
}

#pragma mark - getter

-(UIScrollView*)scrollView{
    if (!_scrollView) {
        _scrollView = [UIScrollView new];
        _scrollView.backgroundColor = [UIColor colorWithHex:0xf4f4f4];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.scrollEnabled = YES;
        
    }
    return _scrollView;
}

- (UILabel *)hintLabel{
    if (!_hintLabel) {
        _hintLabel = [UILabel new];
        _hintLabel.textColor = [UIColor colorWithHex:0xaaaaaa];
        _hintLabel.font = [UIFont systemFontOfSize:14];
        _hintLabel.text = @"热门搜索";
    }
    return _hintLabel;
}

- (LDTagView *)tagView{
    if (!_tagView) {
        _tagView = [LDTagView new];
        _tagView.singleLine = YES;
        _tagView.backgroundColor = [UIColor colorWithHex:0xf4f4f4];
        _tagView.padding = UIEdgeInsetsMake(0, 0, 0, 0);
        _tagView.interitemSpacing = 9;
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

- (UITableView *)searchHistoryTableView{
    if (!_searchHistoryTableView) {
        _searchHistoryTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,CGRectGetWidth(self.bounds),CGRectGetHeight(self.bounds)) style:UITableViewStylePlain];
    }
    return _searchHistoryTableView;
}



@end