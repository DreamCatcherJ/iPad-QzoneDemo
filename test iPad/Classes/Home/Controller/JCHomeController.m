//
//  ViewController.m
//  test iPad
//
//  Created by mac on 15/12/6.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "JCHomeController.h"
#import "JCDockView.h"
#import "JCAllStatuesVC.h"
#import "JCModalVC.h"
#import "JCContentView.h"
@interface JCHomeController () <DockViewDelegate>

@property (strong, nonatomic) JCDockView *dockView;
@property (strong, nonatomic) JCContentView *contentView;

@property (nonatomic,assign,getter=isLandcape) BOOL landscape;

@property (nonatomic,strong) CenterMenuItem *selectedCenterMenuItem;

@end

@implementation JCHomeController

- (void)loadView{
    
    // 1. 创建self.view
    self.view = [[UIView alloc] init];
    
    // 2. 创建DockView, 添加
    self.dockView = [[JCDockView alloc] init];
    self.dockView.delegate = self;
    [self.view addSubview:self.dockView];
    
    // 3. 创建ContentView, 添加
    self.contentView = [[JCContentView alloc] initWithDockView:self.dockView];
    [self.view addSubview:self.contentView];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self isLandscapeWithCurrentSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:52/255.0 green:52/255.0 blue:52/255.0 alpha:1.0]];
    
    [self addViewController];
    
    //  进入的时候选中个人中心
    [self touchedIconBtn];
    
}

- (void) touchedIconBtn
{
    [self updateViewToContentViewWithViewController:self.childViewControllers[6]];
        [self.dockView.centerView cancelSelecetAll];
}

/**
 *  旋转屏幕会调用此方法
 */
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    
    [self isLandscapeWithCurrentSize:size];
}

- (void)isLandscapeWithCurrentSize:(CGSize)size{
    
    if (size.width > size.height)self.landscape = YES;
    else self.landscape = NO;
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:kNotificationTransition object:@(self.isLandcape)];
    
}


// 更新控制器视图到ContentView上
- (void)updateViewToContentViewWithViewController:(UIViewController *)vc
{
    // 1. contentView上的子视图去掉
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    // 2. 把新的视图添加上来
    [self.contentView addSubview:vc.view];
    
    // 3. 调整新View的Frame值
    vc.view.frame = self.contentView.bounds;
    
    //  添加转场动画
    CATransition *transition = [CATransition animation];
    transition.type = @"oglFlip";
    transition.subtype = @"fromLeft";
    transition.duration = 0.5;
    
    [self.contentView.layer addAnimation:transition forKey:nil];
    
}


- (void) addViewController
{
    JCAllStatuesVC *vc1 = [[JCAllStatuesVC alloc] init];
    vc1.title = @"全部动态";
    [self emableInNav:vc1];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor blackColor];
    [self emableInNav:vc2];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor purpleColor];
    [self emableInNav:vc3];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor = [UIColor orangeColor];
    [self emableInNav:vc4];
    
    UIViewController *vc5 = [[UIViewController alloc] init];
    vc5.view.backgroundColor = [UIColor yellowColor];
    [self emableInNav:vc5];
    
    UIViewController *vc6 = [[UIViewController alloc] init];
    vc6.view.backgroundColor = [UIColor greenColor];
    [self emableInNav:vc6];
    
    UIViewController *vc7 = [[UIViewController alloc] init];
    vc7.title = @"个人中心";
    vc7.view.backgroundColor = [UIColor cyanColor];
    [self emableInNav:vc7];
}


/**
 *  把传入的控制器使用NavigationControlelr包装一下
 */
- (void) emableInNav:(UIViewController *) vc
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    //  添加到子控制器中
    [self addChildViewController:nav];
}

#pragma mark - DockViewDelegate

- (void)dockView:(JCDockView *)dock didSelectedUserIcon:(JCUserIconBtn *)icon
{
    [self touchedIconBtn];
}

- (void)dockView:(JCDockView *)dock didSelecedCenterMenuItem:(CenterMenuItem *)item
{
    
    //  如果选中索引,与跳转到的索引相同就直接返回
    if (self.selectedCenterMenuItem == item) {
        return;
    }
    [self updateViewToContentViewWithViewController:self.childViewControllers[item.tag]];
    
    self.selectedCenterMenuItem = item;
}

- (void)dockView:(JCDockView *)dock didSelectedBottomMenuItem:(UIButton *)item
{
    // 弹出小小的模态视图
    JCModalVC *vc = [[JCModalVC alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    // 修改弹出样式
    nav.modalPresentationStyle = UIModalPresentationFormSheet;
    
    [self presentViewController:nav animated:YES completion:nil];
}
- (void)dealloc{
    DLog(@"");
}
@end















