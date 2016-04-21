//
//  XYAboutVC.m
//  XYLottery
//
//  Created by 李小亚 on 1/27/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import "XYAboutVC.h"
#import "XYAboutHeaderView.h"

@interface XYAboutVC ()

@end

@implementation XYAboutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    XYSettingItem *item1 = [XYSettingItemArrow itemWithIcon:nil andTitle:@"评分支持"];
    item1.operation = ^{
      NSString *appID = @"725296055";
        NSString *str = [NSString stringWithFormat:@"items-app://itunes.apple.com/cn/app/%@?mt=8", appID];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    };
    
    XYSettingItem *item2 = [XYSettingItemArrow itemWithIcon:nil andTitle:@"客服电话"];
    item2.subTitle = @"10086";
    item2.operation = ^{
        
        NSURL *telURL = [NSURL URLWithString:@"tel://10086"];
        if (![[UIApplication sharedApplication] canOpenURL:telURL]) {
            return;
        }
        
        [[UIApplication sharedApplication] openURL:telURL];
    };
    
    XYSettingGroup *group = [[XYSettingGroup alloc] init];
    group.items = @[item1,item2];
    [self.items addObject:group];
    
    
    self.tableView.tableHeaderView = [XYAboutHeaderView aboutHeaderView];
}



@end
