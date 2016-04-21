//
//  XYSettingsBaseVC.m
//  XYLottery
//
//  Created by 李小亚 on 1/24/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import "XYSettingsBaseVC.h"
#import "XYSettingCell.h"

@implementation XYSettingsBaseVC



///未能执行， 在story board中设置的此参数
- (instancetype)init{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        NSLog(@"%s", __func__);
    }
    return self;
}

//lazy load
- (NSMutableArray *)items{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
}

#pragma tableView date source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.items.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.items[section] items].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XYSettingCell *cell = [XYSettingCell cellWithTableView:tableView];
    
    /**
     *  获取这一组的全部数据
     */
    XYSettingGroup *group = self.items[indexPath.section];
    
    //获取这个组中存放items的模型的 数组
    NSArray *items = group.items;
    
//获取包含模型的这个数组的item的数据信息
    cell.item = items[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XYSettingGroup *group = self.items[indexPath.section];
    
    XYSettingItem *item = group.items[indexPath.row];
    
    if (item.operation) {
        item.operation();
    }else if (item.vcClass) {
        id vc = [[item.vcClass alloc] init];
        [vc setTitle:item.title];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
}

//设置头标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    XYSettingGroup *group = self.items[section];
    return group.headerTitle;
}
//设置尾部标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    XYSettingGroup *group = self.items[section];
    return group.footerTitle;
}

@end
