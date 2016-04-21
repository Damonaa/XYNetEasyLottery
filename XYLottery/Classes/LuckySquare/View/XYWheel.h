//
//  XYWheel.h
//  XYLottery
//
//  Created by 李小亚 on 1/27/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYWheel : UIView


+ (instancetype)luckyWheel;

- (void)startRotate;
- (void)stopRotate;

@end
