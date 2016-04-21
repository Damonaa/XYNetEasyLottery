//
//  XYHelpPage.m
//  XYLottery
//
//  Created by 李小亚 on 1/26/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import "XYHelpPage.h"

@implementation XYHelpPage
- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        self.title = dic[@"title"];
        self.html = dic[@"html"];
        self.ID = dic[@"id"];
    }
    return self;
}
+ (instancetype)helpPageWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

@end
