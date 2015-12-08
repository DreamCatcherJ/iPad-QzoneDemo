//
//  JCBottomMenuView.h
//  test iPad
//
//  Created by mac on 15/12/7.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "JCBaseView.h"
typedef enum {
    BottomMenuItemTypeBlog = 0, // 发表说说
    BottomMenuItemTypeCamera,   // 相机
    BottomMenuItemTypeYellowBook,   // 黄书
}BottomMenuItemType;

@class JCBottomMenuView;

@protocol BottomMenuDelegate <NSObject>

- (void)bottomMenu:(JCBottomMenuView *)menu didSelectedItem:(UIButton *)item;

@end

@interface JCBottomMenuView : JCBaseView

@property (weak, nonatomic) id<BottomMenuDelegate> delegate;

@end
