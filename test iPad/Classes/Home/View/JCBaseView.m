//
//  JCBaseView.m
//  test iPad
//
//  Created by mac on 15/12/7.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "JCBaseView.h"
#import "JCContentView.h"
@interface JCBaseView ()

@end

@implementation JCBaseView


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center addObserver:self selector:@selector(screenSizeChanged:) name:kNotificationTransition object:nil];
        
        [self setup];
    }
    return self;
}
/**
 *  初始化
 */
- (void)setup{

}
#pragma mark - kNotificationTransition
- (void)screenSizeChanged:(NSNotification *)notices{
    
    self.landscape = [notices.object intValue];
    
    [self updateConstraints];
    
}
- (void)dealloc{

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

+ (BOOL)requiresConstraintBasedLayout{
    return YES;
}
@end
