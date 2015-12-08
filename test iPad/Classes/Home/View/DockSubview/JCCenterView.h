//
//  JCCenterView.h
//  test iPad
//
//  Created by mac on 15/12/7.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "JCBaseView.h"
@class CenterMenuItem;

@interface JCCenterView : JCBaseView

// 返回值(^Block名称)(参数列表)
@property (copy, nonatomic) void(^didSelctedItemBlock)(CenterMenuItem *);
/**
 *  取消选中
 */
- (void) cancelSelecetAll;

@end


// 第二个声明

@interface CenterMenuItem : UIButton

/**
 *  当前屏幕方向
 */
@property (assign, nonatomic, getter=isLandscpae) BOOL landscape;

@end