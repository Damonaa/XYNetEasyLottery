//
//  XYSettingGroup.h
//  XYLottery
//
//  Created by 李小亚 on 1/25/16.
//  Copyright © 2016 李小亚. All rights reserved.
//
/**
 * 用于设置组的头和尾巴，也包含组的数据
 */
#import <Foundation/Foundation.h>

@interface XYSettingGroup : NSObject

/**
 *  设置头标题
 */
@property (nonatomic, copy) NSString *headerTitle;

/**
 *  设置尾标题
 */
@property (nonatomic, copy) NSString *footerTitle;

/**
 *  组的每一行的数据模型
 */
@property (nonatomic, strong) NSArray *items;


@end
