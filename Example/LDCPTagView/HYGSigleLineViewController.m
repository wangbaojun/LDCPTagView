//
//  HYGSigleLineViewController.m
//  LDCPTagView
//
//  Created by ITxiansheng on 16/7/17.
//  Copyright © 2016年 bjwangbaojun. All rights reserved.
//

#import "HYGSigleLineViewController.h"
#import "HYGHasHistoryNoMatterRecView.h"
#import "LDtag.h"
static  NSString  * const historyCellIdentifier = @"searchHistoryCell";

@interface HYGSigleLineViewController()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) HYGHasHistoryNoMatterRecView * hasHistoryNoMatterRecView;
@property (nonatomic,strong) NSArray <NSString *> *historyArr;

@end

@implementation HYGSigleLineViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.historyArr = [self createHistories];
    self.automaticallyAdjustsScrollViewInsets= NO;
    [self initSubViews];
}

#pragma mark - private

- (void)initSubViews{
    [self.view addSubview:self.hasHistoryNoMatterRecView];
}

- (NSArray <LDTag *>*)createTags{
    NSMutableArray *tagMutualArrary = [NSMutableArray array];
    [@[@"Python", @"Javascript", @"Python", @"Swift", @"Go", @"Objective-C", @"C", @"PHP"] enumerateObjectsUsingBlock: ^(NSString *text, NSUInteger idx, BOOL *stop) {
        LDTag *tag = [LDTag tagWithText:text];
        [tagMutualArrary addObject:tag];
    }];
    return  [tagMutualArrary copy];
}
- (NSArray <NSString *>*)createHistories{
    NSArray *tmpArr = @[@"Python", @"Javascript", @"Python", @"Swift", @"Go", @"Objective-C", @"C", @"PHP"];
    return  tmpArr;
}
#pragma mark - UITableViewDataSource UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.historyArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = (UITableViewCell *) [tableView dequeueReusableCellWithIdentifier:historyCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:historyCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = [self.historyArr objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}

#pragma mark - getter

- (HYGHasHistoryNoMatterRecView *)hasHistoryNoMatterRecView{
    if (!_hasHistoryNoMatterRecView) {
        _hasHistoryNoMatterRecView = [[HYGHasHistoryNoMatterRecView alloc]initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)-64)];
        _hasHistoryNoMatterRecView.searchHistoryTableView.delegate = self;
        _hasHistoryNoMatterRecView.searchHistoryTableView.dataSource = self;

        [_hasHistoryNoMatterRecView configTagViewWithData:[self createTags]];
    }
    return _hasHistoryNoMatterRecView;
}
@end
