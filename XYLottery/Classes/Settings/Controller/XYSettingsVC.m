//
//  XYSettingsVC.m
//  XYLottery
//
//  Created by 李小亚 on 1/23/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import "XYSettingsVC.h"
#import "XYPushAndWarningVC.h"
#import "MBProgressHUD+Extend.h"
#import "XYHelpVC.h"
#import "XYProductsVC.h"
#import "XYShareVC.h"
#import "XYAboutVC.h"

@interface XYSettingsVC ()

/**
 * 该数组中有两个元素， 这两个元素也是两个数组，用来存放两组setting item
 */
//@property (nonatomic, strong) NSMutableArray  *items;

@end

@implementation XYSettingsVC

//未能执行， 在story board中设置的此参数
//- (instancetype)init{
//    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
//        NSLog(@"%s", __func__);
//    }
//    return self;
//}

//lazy load
//- (NSMutableArray *)items{
//    if (!_items) {
//        _items = [NSMutableArray array];
//    }
//    return _items;
//}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    XYSettingItem *item1 = [XYSettingItemArrow itemWithIcon:@"MorePush" andTitle:@"推送和提醒" andClass:[XYPushAndWarningVC class]];
    
    
    XYSettingItem *item2 = [XYSettingItemSwitch itemWithIcon:@"handShake" andTitle:@"摇一摇"];
    XYSettingItem *item3 = [XYSettingItemSwitch itemWithIcon:@"sound_Effect" andTitle:@"音效"];
    XYSettingItem *item4 = [XYSettingItemArrow itemWithIcon:@"IDInfo" andTitle:@"个人信息"];
    
    NSArray *groupItem1 = @[item1, item2, item3, item4];
    XYSettingGroup *group1 = [[XYSettingGroup alloc] init];
    group1.items = groupItem1;
    
    XYSettingItem *item5 = [XYSettingItemArrow itemWithIcon:@"MoreUpdate" andTitle:@"检测版本更新"];
    
    
    /**
     *  检测版本更新，使用block
     * 显示小窗口
     */
    item5.operation = ^(){
        NSLog(@"blockkkk");
        [MBProgressHUD showMessage:@"正在检测版本。。。。"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
            [MBProgressHUD showSuccess:@"已经是最新的啦"];
            
        });
    };
    
    XYSettingItem *item6 = [XYSettingItemArrow itemWithIcon:@"MoreHelp" andTitle:@"帮助" andClass:[XYHelpVC class]];
    XYSettingItem *item7 = [XYSettingItemArrow itemWithIcon:@"MoreShare" andTitle:@"分享"
                            andClass:[XYShareVC class]];
    XYSettingItem *item8 = [XYSettingItemArrow itemWithIcon:@"MoreMessage" andTitle:@"查看消息"];
    XYSettingItem *item9 = [XYSettingItemArrow itemWithIcon:@"MoreNetease" andTitle:@"产品推荐"
                            andClass:[XYProductsVC class]];
    XYSettingItem *item10 = [XYSettingItemArrow itemWithIcon:@"MoreAbout" andTitle:@"关于"
                             andClass:[XYAboutVC class]];
    
    NSArray *groupItem2 = @[item5, item6, item7, item8, item9, item10];
    XYSettingGroup *group2 = [[XYSettingGroup alloc] init];
    group2.items = groupItem2;
    group2.footerTitle = @"哈哈哈哈";
    group2.headerTitle = @"嘿嘿额黑";
    
    [self.items addObject:group1];
    [self.items addObject:group2];
}

//
//#pragma tableView date source

@end
