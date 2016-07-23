##  状态栏的控制

> 引言

iOS 9.0之后,状态栏通过设置默认的样式,不起作用了,为此,需要在添加一个显示级别高的window,来控制器当前状态栏的	`显示`,`隐藏`,`白色`,`黑色`等!

****

### Lib介绍
主要有两个类,使用方便

* LX_StatusBar -> UIWindow

在当前的window添加一个自定义的window,用于控制状态栏;

* LX_TopWindowViewController -> UIViewController

通过添加一个透明的控制器,控制当前控制器的状态栏显示,采用单例设计,因为整个项目中,用的地方比较多;

### 效果图如下

![](http://o9zpq25pv.bkt.clouddn.com/github/gif/statsuBarControl.gif)

### 使用方法

* 直接导入lib;
* 在pch文件中导入头文件`#import "LX_TopWindowViewController.h"`
	* 在pch文件中配置如下:
	
	```
	/**** 状态栏颜色 ****/
 #define STATUSBAR_DEFAULT [LX_TopWindowViewController sharedInstance].statusBarStyle = UIStatusBarStyleDefault
 #define STATUSBAR_LIGHT [LX_TopWindowViewController sharedInstance].statusBarStyle = UIStatusBarStyleLightContent;
/**** 状态栏显示或者隐藏 ****/
 #define STATUSBAR_SHOW [LX_TopWindowViewController sharedInstance].statusBarHidden = NO;
 #define STATUSBAR_HIDDEN   [LX_TopWindowViewController sharedInstance].statusBarHidden = YES;

	```

__[温馨提示]__

当然,如果你不喜欢通过宏的方式定义状态栏的显示,隐藏,那么你也可以在当前想控制的页面是使用如下:

```
  状态栏白色 
   [LX_TopWindowViewController sharedInstance].statusBarStyle = UIStatusBarStyleLightContent;
  状态栏黑色
   [LX_TopWindowViewController sharedInstance].statusBarStyle = UIStatusBarStyleLightContent;
   显示状态栏
   [LX_TopWindowViewController sharedInstance].statusBarHidden = NO;
   隐藏状态栏
  [LX_TopWindowViewController sharedInstance].statusBarHidden = YES;

```

#### last

* 如果在使用过程中,有什么问题,welcome issue.
* 欢迎访问的[我的博客](www.liluxin.com).


	