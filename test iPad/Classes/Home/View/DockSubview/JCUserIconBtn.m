//
//  JCUserIconBtn.m
//  test iPad
//
//  Created by mac on 15/12/7.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "JCUserIconBtn.h"

@interface JCUserIconBtn ()

@end

@implementation JCUserIconBtn

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setup];
    }
    return self;
}
/**
 *  初始化
 */
- (void)setup{
    
    self.backgroundColor = [UIColor clearColor];
    [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
    
    // 配置图片
    [self setImage:[UIImage imageNamed:@"Luffy"] forState:UIControlStateNormal];
    [self setTitle:@"JC_R" forState:UIControlStateNormal];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(screenSizeChanged:) name:kNotificationTransition object:nil];
    
}




#pragma mark - kNotificationTransition
- (void)screenSizeChanged:(NSNotification *)notices{
    
    self.landscape = [notices.object intValue];
    
    [self updateConstraints];
    
}


+ (BOOL)requiresConstraintBasedLayout{
    return YES;
}
- (void)updateConstraints{

    if (self.isLandscape) {
        [self mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.superview);
            make.top.mas_equalTo(kIconY);

            make.width.mas_equalTo(kIconLandscapeW);
            make.height.mas_equalTo(kIconLandscapeH);
        }];
    }
    else{
        [self mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.superview);
            make.top.mas_equalTo(kIconY);
            make.width.height.mas_equalTo(kIconPortraitWH);
        }];
    }
    
    [super updateConstraints];
}

#pragma mark - UIButton内部方法
/**
 * 决定textLabel的frame
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    // UserIcon在竖屏的时候, width == height
    if (self.width == self.height) {
        // 竖屏
        return CGRectZero;
    } else {
        // 横屏
        CGFloat width = self.width;
        CGFloat height = kIconLandscapeTitleH;
        CGFloat x = 0;
        CGFloat y = self.height - kIconLandscapeTitleH;
        return CGRectMake(x, y, width, height);
    }
}

/**
 *  决定imageView的frame
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    if (self.width == self.height) {
        // 竖屏, 只有图片
        return self.bounds;
    } else {
        // 横屏, 上图片, 中间间隙, 下面title
        return CGRectMake(0, 0, self.width, self.width);
    }
}

- (void)layoutSubviews{

    [super layoutSubviews];
    self.imageView.layer.cornerRadius = 8;
}

- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
