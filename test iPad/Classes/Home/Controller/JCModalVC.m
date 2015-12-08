//
//  ModalVC.m
//  01-QQ空间-登陆界面
//
//  Created by Zed on 10/10/2015.
//  Copyright © 2015 itcast. All rights reserved.
//

#import "JCModalVC.h"

@implementation JCModalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    // 配置导航栏
    self.title = @"发表说说";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss:)];
}

- (void)dismiss:(UIBarButtonItem *)item {
    if (item == self.navigationItem.rightBarButtonItem) {
        NSLog(@"发表说说");
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
