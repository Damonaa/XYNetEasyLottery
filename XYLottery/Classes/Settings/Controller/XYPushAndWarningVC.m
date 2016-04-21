//
//  XYPushAndWarningVC.m
//  XYLottery
//
//  Created by 李小亚 on 1/25/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import "XYPushAndWarningVC.h"
#import "XYLatteryNumberPushVC.h"
#import "XYScoreLiveVC.h"

@implementation XYPushAndWarningVC


- (void)viewDidLoad{
    [super viewDidLoad];
    
    XYSettingItem *item1 = [XYSettingItemArrow itemWithIcon:nil andTitle:@"开奖号码推送" andClass:[XYLatteryNumberPushVC class]];
    XYSettingItem *item2 = [XYSettingItemArrow itemWithIcon:nil andTitle:@"中奖动画"];
    XYSettingItem *item3 = [XYSettingItemArrow itemWithIcon:nil andTitle:@"比分直播提醒" andClass:[XYScoreLiveVC class]];
    XYSettingItem *item4 = [XYSettingItemArrow itemWithIcon:nil andTitle:@"购彩定时提醒"];
    
    NSArray *items = @[item1, item2, item3, item4];
    XYSettingGroup *group = [[XYSettingGroup alloc] init];
    group.items = items;
    
    [self.items addObject:group];

}

@end
