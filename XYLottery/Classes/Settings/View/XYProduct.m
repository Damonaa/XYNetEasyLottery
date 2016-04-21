//
//  XYProduct.m
//  XYLottery
//
//  Created by 李小亚 on 1/26/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import "XYProduct.h"

@implementation XYProduct

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        self.title = dic[@"title"];
        self.ID = dic[@"id"];
        self.url = dic[@"url"];
        self.icon = dic[@"icon"];
        self.customUrl = dic[@"customUrl"];
    }
    return self;
}
+ (instancetype)productWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}
@end
