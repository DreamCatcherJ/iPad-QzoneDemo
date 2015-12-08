//
//  JCCenterView.m
//  test iPad
//
//  Created by mac on 15/12/7.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "JCCenterView.h"
#define KWidthRadio 0.4  // 图片的宽度比例
@interface JCCenterView ()

@property (strong, nonatomic) CenterMenuItem *selectedItem;

@end
@implementation JCCenterView

/**
 *  初始化
 */
- (void)setup{
    
    self.backgroundColor = [UIColor blueColor];
    
    NSArray *titleArr = @[@"全部动态", @"与我相关", @"照片墙", @"电子相框", @"好友", @"更多"];
    NSArray *imageNameArr = @[
                              @"tab_bar_feed_icon",
                              @"tab_bar_passive_feed_icon",
                              @"tab_bar_pic_wall_icon",
                              @"tab_bar_e_album_icon",
                              @"tab_bar_friend_icon",
                              @"tab_bar_e_more_icon"
                              ];
    
    //  添加CenterMenuItem按钮
    for (int i = 0; i < 6; i++) {
        [self addItemWithImageName:imageNameArr[i] title:titleArr[i] Index:i];
    }
}

- (void)updateConstraints{

    // 布局item
    NSInteger count = self.subviews.count;
    
    UIButton *lastBtn = nil;
    
        for (NSInteger i = 0; i < count; i++) {
            
            CenterMenuItem *btn = self.subviews[i];
            btn.landscape = self.isLandscape;
            
            [btn mas_remakeConstraints:^(MASConstraintMaker *make) {
                
                make.width.equalTo(self);
                make.height.mas_equalTo(kDockItemH);
                make.leading.mas_equalTo(0);
                if (lastBtn) {
                    make.top.mas_equalTo(lastBtn.mas_bottom);
                }
                else{
                    make.top.mas_equalTo(self);
                    
                }
            }];
            lastBtn = btn;
        }
    [super updateConstraints];
}

- (CenterMenuItem *)addItemWithImageName:(NSString *)name title:(NSString *)title Index:(NSInteger)index
{
    CenterMenuItem *item = [[CenterMenuItem alloc] init];
    [item setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [item setTitle:title forState:UIControlStateNormal];
    [item setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateSelected];
    [item addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    item.tag = index;
    
    [self addSubview:item];
    return item;
}

- (void)itemAction:(CenterMenuItem *)item
{
    // 筛选无效的值
    if (self.selectedItem == item) {
        return;
    }
    
    // 更新当前选中的item
    self.selectedItem.selected = NO;
    self.selectedItem = item;
    self.selectedItem.selected = YES;
    
    // 被点了, 执行Block
    if (self.didSelctedItemBlock) {
        self.didSelctedItemBlock(item);
    }
}
/**
 *  取消选中
 */
- (void) cancelSelecetAll
{
    self.selectedItem.selected = NO;
}

@end




@implementation CenterMenuItem

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupSelf];
    }
    return self;
}

- (void)setupSelf
{
    // 把图片不拉伸
    self.imageView.contentMode = UIViewContentModeCenter;
    // 把文字居中
    //    [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    if (self.isLandscpae) {
        CGFloat x = KWidthRadio * self.width;
        CGFloat y = 0;
        CGFloat width = (1 - KWidthRadio) * self.width;
        CGFloat height = self.height;
        return CGRectMake(x, y, width, height);
    } else {
        return CGRectZero;
    }
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    if (self.isLandscpae) {
        return CGRectMake(0, 0, KWidthRadio * self.width, self.height);
    } else {
        return self.bounds;
    }
}

- (void)setLandscape:(BOOL)landscape
{
    _landscape = landscape;
    
    // 保证landscape一改, 这个布局也要改
    [self setNeedsLayout];
}

@end



