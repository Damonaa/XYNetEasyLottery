//
//  XYTabBarController.m
//  XYLottery
//
//  Created by 李小亚 on 1/23/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import "XYTabBarController.h"
#import "XYTabbarView.h"

@interface XYTabBarController ()<XYTabbarViewDelegate>

@end

@implementation XYTabBarController

- (void)viewDidLoad{
    [super viewDidLoad];

    //将自定义的table bar View 添加上去
    XYTabbarView *tbv = [[XYTabbarView alloc] init];
    tbv.frame = self.tabBar.bounds;
    [self.tabBar addSubview:tbv];
    
    tbv.delegate = self;
    
    //循环添加按钮
    for (int i = 0; i < 5; i ++) {
        NSString *norName = [NSString stringWithFormat:@"TabBar%d", i+1];
        NSString *selName = [NSString stringWithFormat:@"TabBar%dSel", i+1];
        
        [tbv addTabbarButtonWithNormalImage:norName andSelectedIamge:selName];

    }

}


#pragma  mark - XYTabbarViewDelegate
- (void)tabBarView:(XYTabbarView *)tabBarView clickBtnWithTag:(NSInteger)tag{
    self.selectedIndex = tag;
}
@end
