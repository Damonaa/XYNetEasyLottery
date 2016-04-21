//
//  XYSettingCell.h
//  XYLottery
//
//  Created by 李小亚 on 1/24/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYSettingItem;

@interface XYSettingCell : UITableViewCell


/**
 *  放置item的信息， 重写setter
 */
@property (nonatomic, strong) XYSettingItem *item;




/**
 *  自定义生成cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
