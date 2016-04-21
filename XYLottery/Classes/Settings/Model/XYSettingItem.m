//
//  XYSettingItem.m
//  XYLottery
//
//  Created by 李小亚 on 1/23/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import "XYSettingItem.h"

@implementation XYSettingItem

- (instancetype)initWithIcon:(NSString *)icon andTitle:(NSString *)title{
    if (self = [super init]) {
        self.icon = icon;
        self.title = title;
    }
    return self;
}
+ (instancetype)itemWithIcon:(NSString *)icon andTitle:(NSString *)title{
    return [[self alloc] initWithIcon:icon andTitle:title];
}

+ (instancetype)itemWithIcon:(NSString *)icon andTitle:(NSString *)title andClass:(Class)vcClass{
    
#warning mark - XYSettingItem -> self
    /**
     *  起初用的是XYSettingItem， 导致此方法创建的class是基类，不带附件的，要用self
     */
    XYSettingItem *si = [self itemWithIcon:icon andTitle:title];
    si.vcClass = vcClass;
    return si;
}


@end
