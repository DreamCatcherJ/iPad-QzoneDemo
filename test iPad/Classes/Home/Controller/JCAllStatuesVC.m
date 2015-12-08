//
//  AllStatuesVC.m
//  01-QQ空间-登陆界面
//
//  Created by Zed on 10/10/2015.
//  Copyright © 2015 itcast. All rights reserved.
//

#import "JCAllStatuesVC.h"
#import "JCLoginController.h"
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
    // UIAlertController
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"注销" preferredStyle:UIAlertControllerStyleAlert];
    // 添加按钮
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:NO forKey:JCLoginAutoLogin];

        JCLoginController *loginC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
        
        WINDOW.rootViewController = loginC;
        
    }];
    [alert addAction:cancelAction];
    [alert addAction:confirmAction];
    [self presentViewController:alert animated:YES completion:nil];

    
}

@end
