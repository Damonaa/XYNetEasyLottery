//
//  XYLatteryNumberPushVC.m
//  XYLottery
//
//  Created by 李小亚 on 1/25/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import "XYLatteryNumberPushVC.h"

@implementation XYLatteryNumberPushVC

- (void)viewDidLoad{
    [super viewDidLoad];
    
    XYSettingItem *item1 = [XYSettingItemSwitch itemWithIcon:nil andTitle:@"双色球"];
    XYSettingItem *item2 = [XYSettingItemSwitch itemWithIcon:nil andTitle:@"大乐透"];
    
    NSArray *items = @[item1, item2];
    XYSettingGroup *group = [[XYSettingGroup alloc] init];
    group.items = items;
    group.headerTitle = @"想中奖吗！想中奖吗！想的没！哼";
    
    [self.items addObject:group];
}

@end
