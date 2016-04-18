//
//  LX_TopWindowViewController.h
//  菜单的选择
//
//  Created by 李lucy on 16/4/18.
//  Copyright © 2016年 com.liluxin.test.Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LX_TopWindowViewController : UIViewController

+ (instancetype)sharedInstance;

@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;
@property (nonatomic, assign) BOOL statusBarHidden;

+ (instancetype)topWindow;
@end
