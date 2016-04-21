//
//  XYWheelButton.m
//  XYLottery
//
//  Created by 李小亚 on 1/27/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import "XYWheelButton.h"

@implementation XYWheelButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setHighlighted:(BOOL)highlighted{
    
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageW = 40;
    CGFloat imageH = 48;
//    图片X轴居中， Y轴偏上一点
    CGFloat imageX = (contentRect.size.width - imageW) * 0.5;
    return CGRectMake(imageX, 20, imageW, imageH);
}

@end
