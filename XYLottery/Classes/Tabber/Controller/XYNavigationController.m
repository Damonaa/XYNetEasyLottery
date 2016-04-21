//
//  XYNavigationController.m
//  XYLottery
//
//  Created by 李小亚 on 1/23/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import "XYNavigationController.h"

@implementation XYNavigationController

- (void)viewDidLoad{
    [super viewDidLoad];

}
/**
 设置主题
 */
//此方法近会被调用一次
+ (void)initialize{
    //设置导航栏背景图片
    UINavigationBar *bar = [UINavigationBar appearance];
    
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    //设置状态栏颜色
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    //设置字体颜色
    NSDictionary *title = @{NSForegroundColorAttributeName:[UIColor whiteColor],
                            NSFontAttributeName:[UIFont systemFontOfSize:24]};
    
    [bar setTitleTextAttributes:title];
    
    //导航条上所有item的颜色
    bar.tintColor = [UIColor whiteColor];
    
    //bar button的字体
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]} forState:UIControlStateNormal];
}
//跳转到下一个界面的时候，移除 table bar view, 同时还需要继承原有的方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    viewController.hidesBottomBarWhenPushed = YES;
    return [super pushViewController:viewController animated:animated];
}
@end
