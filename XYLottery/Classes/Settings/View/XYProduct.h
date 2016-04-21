//
//  XYProduct.h
//  XYLottery
//
//  Created by 李小亚 on 1/26/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYProduct : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *customUrl;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)productWithDic:(NSDictionary *)dic;







@end
