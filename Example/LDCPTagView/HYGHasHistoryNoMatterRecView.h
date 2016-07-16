//
//  HYGHasHistoryNoMatteRec.h
//  Pods
//
//  Created by ITxiansheng on 16/7/15.
//
//

#import <UIKit/UIKit.h>
#import "HYGTagViewTapEvent.h"
@class LDTag;
@class HYGHasHistoryNoMatterRecView;
@class HYGSearchHistoryHeaderView;

typedef NS_ENUM(NSUInteger, HasHistoryNoMatterRecViewType){
    HasHistoryNoMatterRecViewNoRecType = 0,//有本地搜索，没有热门推荐
    HasHistoryNoMatterRecViewHasRecType//本地搜索和热门推荐都有
};

@interface HYGHasHistoryNoMatterRecView : UIView

@property (nonatomic, weak, nullable) id<HYGTagViewTapEvent> delegate;
@property (nonatomic,strong,nonnull) UITableView *searchHistoryTableView;


- (void)configTagViewWithData:(nonnull NSArray <LDTag *> *)tags;

- (void)setDiaplayType:(HasHistoryNoMatterRecViewType) type;


@end
