//
//  DimensMacros.h
//  oc-weibo
//
//  Created by mac on 15/12/3.
//  Copyright © 2015年 mac. All rights reserved.
//

#ifndef DimensMacros_h
#define DimensMacros_h

//状态栏高度
#define STATUS_BAR_HEIGHT 20
//NavBar高度
#define NAVIGATION_BAR_HEIGHT 44
//状态栏 ＋ 导航栏 高度
#define STATUS_AND_NAVIGATION_HEIGHT ((STATUS_BAR_HEIGHT) + (NAVIGATION_BAR_HEIGHT))
//
#define WINDOW [UIApplication sharedApplication].keyWindow

//屏幕 rect
#define SCREEN_RECT ([UIScreen mainScreen].bounds)

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define CONTENT_HEIGHT (SCREEN_HEIGHT - NAVIGATION_BAR_HEIGHT - STATUS_BAR_HEIGHT) // 屏幕高度-顶部(44 + 20)

//屏幕分辨率
#define SCREEN_RESOLUTION (SCREEN_WIDTH * SCREEN_HEIGHT * ([UIScreen mainScreen].scale))


//广告栏高度
#define BANNER_HEIGHT 215

#define STYLEPAGE_HEIGHT 21

#define SMALLTV_HEIGHT 77

#define SMALLTV_WIDTH 110

#define FOLLOW_HEIGHT 220

#define SUBCHANNEL_HEIGHT 62

// q-zone 项目
// dock
#define kDockLandscapeW 70 * 3
#define kDockPortraitW 70

// dock中间/底部tabbar
#define kDockItemH 70

// dock顶部icon
#define kIconY 50       // 用户头像距部50
#define kIconLandscapeW 90
#define kIconLandscapeTitleH 30     // 标题高度
#define kIconLandscapeImageTitleSpace 10        // 图片与标题的间隔
#define kIconLandscapeH (kIconLandscapeW + kIconLandscapeTitleH + kIconLandscapeImageTitleSpace)
#define kIconPortraitWH 60

// 主要内容视图
#define kContentViewW (768 - kDockPortraitW)
// q-zone 项目 end

#endif /* DimensMacros_h */
