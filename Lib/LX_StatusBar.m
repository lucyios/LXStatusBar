//
//  LX_StatusBar.m
//  菜单的选择
//
//  Created by 李lucy on 16/4/18.
//  Copyright © 2016年 com.liluxin.test.Co.,Ltd. All rights reserved.
//

#import "LX_StatusBar.h"
#import "LX_TopWindowViewController.h"


@implementation LX_StatusBar

static UIWindow *window_;
+ (void)statusBarShow
{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        window_ = [[UIWindow alloc] init];
        window_.frame = [UIApplication sharedApplication].statusBarFrame;
        window_.backgroundColor = [UIColor clearColor];
        window_.rootViewController = [LX_TopWindowViewController topWindow];
        window_.windowLevel = UIWindowLevelAlert;
        window_.hidden = NO;
        [window_ addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(topWindowClick)]];
    });

}


+ (void)topWindowClick
{
    // 主窗口
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    // 查找主窗口中的所有scrollView
    [self findScrollViewsInView:window];
    
#pragma mark - 点击顶部窗口,返回顶部,发送通知(可选)
    //    [HP_NotificationCenter postNotificationName:kBackTheBeginPositionByTapStatusBar object:nil];
}

/**
 *  查找view中的所有scrollView
 */
+ (void)findScrollViewsInView:(UIView *)view
{
    // 利用递归查找所有的子控件
    for (UIView *subview in view.subviews) {
        [self findScrollViewsInView:subview];
    }
    
    // 如果不是scrollView
    if (![view isKindOfClass:[UIScrollView class]]) return;
    
    // 判断是否跟window有重叠
    UIView *windowView = [UIApplication sharedApplication].keyWindow;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect selfRect = [view convertRect:view.bounds toView:window];
    CGRect viewRect = [windowView convertRect:windowView.bounds toView:window];
    
    if (!CGRectIntersectsRect(selfRect, viewRect)) return;
    // 如果是scrollView
    UIScrollView *scrollView = (UIScrollView *)view;
    
    // 修改offset
    CGPoint offset = scrollView.contentOffset;
    offset.y = - scrollView.contentInset.top;
    [scrollView setContentOffset:offset animated:YES];
    
}


@end
