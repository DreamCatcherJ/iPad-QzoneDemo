//
//  JCContentView.m
//  test iPad
//
//  Created by mac on 15/12/8.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "JCContentView.h"
#import "JCDockView.h"
@interface JCContentView ()

@property (nonatomic,strong) JCDockView *dockView;

@end

@implementation JCContentView

- (instancetype)initWithDockView:(JCDockView *)dockView{

    if (self = [super init]) {
        self.dockView = dockView;
        [self setup];
    }
    return self;
}
/**
 *  初始化
 */
- (void)setup{
    self.backgroundColor = [UIColor whiteColor];
}
+ (BOOL)requiresConstraintBasedLayout{
    return YES;
}
- (void)updateConstraints{

    [super updateConstraints];
    
    CGFloat height = MAX(SCREEN_HEIGHT, SCREEN_WIDTH);
    
    [self mas_remakeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.mas_equalTo(self.dockView.mas_trailing);
        make.top.mas_equalTo(20);
        make.width.mas_equalTo(kContentViewW);
        make.height.mas_equalTo(height-20);
        
    }];
    [super updateConstraints];
}

@end
