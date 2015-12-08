//
//  JCDockView.h
//  test iPad
//
//  Created by mac on 15/12/7.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "JCBaseView.h"
#import "JCBottomMenuView.h"
#import "JCCenterView.h"
#import "JCUserIconBtn.h"
@class JCDockView;

@protocol DockViewDelegate <NSObject>

- (void)dockView:(JCDockView *)dock didSelectedUserIcon:(JCUserIconBtn *)icon;
- (void)dockView:(JCDockView *)dock didSelecedCenterMenuItem:(CenterMenuItem *)item;
- (void)dockView:(JCDockView *)dock didSelectedBottomMenuItem:(UIButton *)item;

@end

@interface JCDockView : JCBaseView

@property (weak, nonatomic) id<DockViewDelegate> delegate;
@property (nonatomic,weak,readonly) JCCenterView *centerView;
@end
