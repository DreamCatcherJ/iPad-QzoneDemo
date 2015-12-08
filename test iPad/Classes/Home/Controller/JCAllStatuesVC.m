//
//  AllStatuesVC.m
//  01-QQ空间-登陆界面
//
//  Created by Zed on 10/10/2015.
//  Copyright © 2015 itcast. All rights reserved.
//

#import "JCAllStatuesVC.h"

@implementation JCAllStatuesVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"退出" style:UIBarButtonItemStylePlain target:self action:@selector(exit)];
    
    // TitleView
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"全部动态", @"好友空间", @"认证空间"]];
    [segment setTintColor:[UIColor lightGrayColor]];
    [segment setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} forState:UIControlStateNormal];
    segment.selectedSegmentIndex = 0;   // 选中值的索引
    self.navigationItem.titleView = segment;
}


- (void)exit
{
    // 返回登陆界面
    
}

@end
