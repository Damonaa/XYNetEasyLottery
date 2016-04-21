//
//  XYSettingsBaseVC.h
//  XYLottery
//
//  Created by 李小亚 on 1/24/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYSettingItem.h"
#import "XYSettingCell.h"
#import "XYSettingItemArrow.h"
#import "XYSettingItemSwitch.h"
#import "XYSettingGroup.h"
#import "XYSettingItemLabel.h"

@interface XYSettingsBaseVC : UITableViewController

/**
 * 该数组中有两个元素， 这两个元素也是两个数组，用来存放两组setting item
 * 现在更改存group的数据，内部有头尾 以及item的数据
 */
@property (nonatomic, strong) NSMutableArray  *items;


@end
