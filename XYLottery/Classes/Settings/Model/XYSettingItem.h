//
//  XYSettingItem.h
//  XYLottery
//
//  Created by 李小亚 on 1/23/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^OperationBlock) ();

@interface XYSettingItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *subTitle;

/**
 *  控制器的类型
 */
@property (nonatomic, assign) Class vcClass;


/**
 *  无参无返回值的block， 用于检测版本更新的时候调用
*/
@property (nonatomic, copy) OperationBlock operation;


/**
 *  label 时间
 */
@property (nonatomic, copy) NSString *dateString;

- (instancetype)initWithIcon:(NSString *)icon andTitle:(NSString *)title;
+ (instancetype)itemWithIcon:(NSString *)icon andTitle:(NSString *)title;

+ (instancetype)itemWithIcon:(NSString *)icon andTitle:(NSString *)title andClass:(Class)vcClass;

@end
