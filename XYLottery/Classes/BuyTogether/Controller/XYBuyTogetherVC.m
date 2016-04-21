//
//  XYBuyTogetherVC.m
//  XYLottery
//
//  Created by 李小亚 on 1/23/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import "XYBuyTogetherVC.h"



@implementation XYBuyTogetherVC
- (IBAction)clickBtn:(UIButton *)sender {
        NSLog(@"%s",__func__);
    [UIView animateWithDuration:0.25 animations:^{
        if (CGAffineTransformIsIdentity(sender.imageView.transform)) {
            sender.imageView.transform = CGAffineTransformMakeRotation(M_PI);
        }else{
            sender.imageView.transform = CGAffineTransformIdentity;
        }
    }];
}

@end
