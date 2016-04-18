//
//  LX_TopWindowViewController.m
//  菜单的选择
//
//  Created by 李lucy on 15/10/18.
//  Copyright © 2016年 com.liluxin.test.Co.,Ltd. All rights reserved.
//

#import "LX_TopWindowViewController.h"

@interface LX_TopWindowViewController ()

@end

@implementation LX_TopWindowViewController


+ (instancetype)topWindow
{
    return [[self alloc] init];
}

#pragma mark - 单例
static id instance_;
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance_ = [[self alloc] init];
    });
    return instance_;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance_ = [super allocWithZone:zone];
    });
    return instance_;
}

#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
}

#pragma mark - 状态栏控制
- (BOOL)prefersStatusBarHidden
{
    return self.statusBarHidden;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return self.statusBarStyle;
}

#pragma mark - setter
- (void)setStatusBarHidden:(BOOL)statusBarHidden
{
    _statusBarHidden = statusBarHidden;
    
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle
{
    _statusBarStyle = statusBarStyle;
    
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
