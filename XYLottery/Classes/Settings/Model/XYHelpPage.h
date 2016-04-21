//
//  XYHelpPage.h
//  XYLottery
//
//  Created by 李小亚 on 1/26/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYHelpPage : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *html;
@property (nonatomic, copy) NSString *ID;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)helpPageWithDic:(NSDictionary *)dic;



@end
