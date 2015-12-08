//
//  JCDockView.m
//  test iPad
//
//  Created by mac on 15/12/7.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "JCDockView.h"


#define kCenterItemCount 6
@interface JCDockView () <BottomMenuDelegate>

@property (nonatomic,weak) JCBottomMenuView *bottomView;

@property (nonatomic,weak) JCCenterView *centerView;

@property (nonatomic,weak) JCUserIconBtn *UserIcon;

@end

@implementation JCDockView

/**
 *  初始化
 */
- (void)setup{
    
    self.backgroundColor = [UIColor orangeColor];
    // 创建UserIcon
    JCUserIconBtn *UserIcon = [[JCUserIconBtn alloc] init];
    [self addSubview:UserIcon];
    self.UserIcon = UserIcon;
    [self.UserIcon addTarget:self action:@selector(userIconAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    // 创建底部View
    JCBottomMenuView *bottomView = [[JCBottomMenuView alloc] init];
    bottomView.backgroundColor = [UIColor purpleColor];
    [self addSubview:bottomView];
    bottomView.delegate = self;
    self.bottomView = bottomView;
    // 创建中间View
    JCCenterView *centerView = [[JCCenterView alloc] init];
    [self addSubview:centerView];
    self.centerView = centerView;
    typeof(self) __weak weakSelf = self;
    self.centerView.didSelctedItemBlock = ^(CenterMenuItem *item) {
        // centerMenu点击了item之后回调的block, 通知代理
        if ([weakSelf.delegate respondsToSelector:@selector(dockView:didSelecedCenterMenuItem:)]) {
            [weakSelf.delegate dockView:weakSelf didSelecedCenterMenuItem:item];
        }
    };

    
    
}

- (void)updateConstraints{
    // 布局自己
    if (self.isLandscape) {// 横屏

        [self mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(self.superview);
            make.width.mas_equalTo(kDockLandscapeW);
            make.leading.top.equalTo(self.superview);
        }];
    }
    else{// 竖屏
        [self mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(self.superview);
            make.width.mas_equalTo(kDockPortraitW);
            make.leading.top.equalTo(self.superview);
        }];
        
    }
    // 布局centerView
    [self updateCenterViewConstraints];
    
    [super updateConstraints];
}
- (void)updateCenterViewConstraints{

        [self.centerView mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.width.leading.mas_equalTo(self);
            make.bottom.mas_equalTo(self.bottomView.mas_top);
            make.height.mas_equalTo(kDockItemH * kCenterItemCount);

        }];
}

#pragma mark - UserIcon响应事件

- (void)userIconAction:(JCUserIconBtn *)userIcon
{
    if ([self.delegate respondsToSelector:@selector(dockView:didSelectedUserIcon:)]) {
        [self.delegate dockView:self didSelectedUserIcon:userIcon];
    }
}

#pragma mark - BottomMenuDelegate

- (void)bottomMenu:(JCBottomMenuView *)menu didSelectedItem:(UIButton *)item
{

    if ([self.delegate respondsToSelector:@selector(dockView:didSelectedBottomMenuItem:)]) {
        [self.delegate dockView:self didSelectedBottomMenuItem:item];
    }
}


@end













