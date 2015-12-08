//
//  JCLoginController.m
//  test iPad
//
//  Created by mac on 15/12/6.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "JCLoginController.h"
#import "JCHomeController.h"

@interface JCLoginController ()

@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UITextField *accountView;

@property (weak, nonatomic) IBOutlet UITextField *psdView;
@property (weak, nonatomic) IBOutlet UIButton *rmbPasswordBtn;
@property (weak, nonatomic) IBOutlet UIButton *autoLoginBtn;
- (IBAction)onClickRmb;
- (IBAction)onClickAuto;
- (IBAction)onClickLogin;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;



@end

@implementation JCLoginController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadInfo];
    
    
}
#pragma mark - private
- (void)loadInfo{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *account = [defaults objectForKey:JCACCOUNT];
    if (account) {
        self.accountView.text = account;
    }
    //  2.判断是否记住密码,如果记住密码,填充密码框
    BOOL isRemeberPwd = [defaults boolForKey:JCLoginRemeberPsd];
    if (!isRemeberPwd) {
        return;
    }
    self.rmbPasswordBtn.selected = YES;
    
        NSString *psd = [SSKeychain passwordForService:BUNDLE_ID account:account];
    self.psdView.text = psd;
    
    //  3.判断是否自动登录,如果自动登录,调用登录的代码
    BOOL isAutoLogin = [defaults boolForKey:JCLoginAutoLogin];
    if (isAutoLogin) {
        self.autoLoginBtn.selected = YES;
        //      自动登录
        [self login];
    }
}

- (void)login{

    [self onClickLogin];
    
}

- (IBAction)onClickRmb {
    
    //  当点击按钮时候,如是没有记住密码,现在就要记住密,反之一样
    self.rmbPasswordBtn.selected = !self.rmbPasswordBtn.selected;
    //  如果取消记住密码,就不可以自动登录
    if (!self.rmbPasswordBtn.selected) {
        self.autoLoginBtn.selected = NO;
    }
    
}

- (IBAction)onClickAuto {
    
    self.autoLoginBtn.selected = !self.autoLoginBtn.selected;
    //  如果自动登录了,就必须记住密码
    if (self.autoLoginBtn.selected) {
        self.rmbPasswordBtn.selected = YES;
    }
    
}

- (IBAction)onClickLogin {
    
    NSString *account = self.accountView.text;
    NSString *psd = self.psdView.text;
    
    if (account.length == 0) {
        [self alertMessage:UserNameErrorHint];
        return;
    }
    if (psd.length == 0) {
        [self alertMessage:PasswordErrorHint];
        return;
    }
    if (!([account isEqualToString:@"dC_R"] && [psd isEqualToString:@"dC_R"])) {
        [self alertMessage:LoginErrorHint];
        return;
    }
    [self.loading startAnimating];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.loading stopAnimating];
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        // 记录登录信息
        [userDefaults setObject:account forKey:JCACCOUNT];
        [SSKeychain setPassword:psd forService:BUNDLE_ID account:account];
        [userDefaults setBool:self.rmbPasswordBtn.selected forKey:JCLoginRemeberPsd];
        [userDefaults setBool:self.autoLoginBtn.selected forKey:JCLoginAutoLogin];

        JCHomeController *homeC = [[JCHomeController alloc] init];
        
        WINDOW.rootViewController = homeC;
        
    });
    
}

// 弹出提示
- (void)alertMessage:(NSString *)message
{
    [SVProgressHUD showErrorWithStatus:message];
    
    // 抖动动画
    // 1. 创建帧动画
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    animation.repeatCount = 4;  // 重复次数
    animation.values = @[@(10), @(0), @(-10), @(0)];    // 动画的值
    animation.duration = 0.1;   // 动画时间
    // 2. 添加动画
    [self.loginView.layer addAnimation:animation forKey:@"DouDongAnimation"];
}


@end











