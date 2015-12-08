//
//  JCBottomMenuView.m
//  test iPad
//
//  Created by mac on 15/12/7.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "JCBottomMenuView.h"

@implementation JCBottomMenuView

/**
 *  初始化
 */
- (void)setup{
    
    self.backgroundColor = [UIColor blueColor];
    // 创建按钮
    [self setupBottomBtns];
}
- (void)setupBottomBtns{
    
    // 添加三个按钮
    NSArray *imageNameArr = @[@"tabbar_mood", @"tabbar_photo", @"tabbar_blog"];
    for (int i = 0; i < 3; i++) {
        [self buttonWithImage:imageNameArr[i] type:i];
    }
}
// 创建并添加MenuItem
- (UIButton *)buttonWithImage:(NSString *)imageName type:(BottomMenuItemType)type
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(menuItemAction:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = type;
    
    [self addSubview:button];
    
    return button;
}

- (void)updateConstraints{
    // 布局自己
    if (self.isLandscape) {
        [self mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.leading.bottom.equalTo(self.superview);
            make.height.mas_equalTo(kDockPortraitW);
        }];
        
    }
    else{
        [self mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.leading.bottom.equalTo(self.superview);
            make.height.mas_equalTo(kDockLandscapeW);
        }];
    }
    // 布局btn
    [self updateBtnsConstraints];
    [super updateConstraints];
}
- (void)updateBtnsConstraints{
    
    NSInteger count = self.subviews.count;
    
    UIButton *lastBtn = nil;
    
    if (self.isLandscape) {
        
        for (NSInteger i = 0; i < count; i++) {
            
            UIButton *btn = self.subviews[i];
            
            [btn mas_remakeConstraints:^(MASConstraintMaker *make) {
                
                make.width.mas_equalTo(self.mas_width).with.dividedBy(count);
                make.height.equalTo(self);
                make.top.mas_equalTo(0);
                if (lastBtn) {
                    make.leading.mas_equalTo(lastBtn.mas_trailing);
                }
                else{
                    make.leading.mas_equalTo(0);
                    
                }
            }];
            lastBtn = btn;
        }
        
    }
    else{
    
        for (NSInteger i = 0; i < count; i++) {
            
            UIButton *btn = self.subviews[i];
            
            [btn mas_remakeConstraints:^(MASConstraintMaker *make) {
                
                make.width.equalTo(self);
                make.height.mas_equalTo(self.mas_height).with.dividedBy(count);

                make.leading.mas_equalTo(0);
                if (lastBtn) {
                    make.top.mas_equalTo(lastBtn.mas_bottom);
                }
                else{
                    make.top.mas_equalTo(0);
                }
            }];
            
            lastBtn = btn;
            
        }
        
    
    }
}
#pragma mark - 按钮响应事件

- (void)menuItemAction:(UIButton *)item
{

    if ([self.delegate respondsToSelector:@selector(bottomMenu:didSelectedItem:)]) {

        [self.delegate bottomMenu:self didSelectedItem:item];
    }
}
@end
