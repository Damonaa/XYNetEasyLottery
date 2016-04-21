//
//  XYTitleButton.m
//  XYLottery
//
//  Created by 李小亚 on 1/23/16.
//  Copyright © 2016 李小亚. All rights reserved.
//
#define IMAAGE_WIDTH 30

#import "XYTitleButton.h"

@implementation XYTitleButton


/**
 *  未能全部显示文字， 代码设定button的宽
 */
- (void)layoutSubviews{
    [super layoutSubviews];
    self.bounds = CGRectMake(0, 0, 90, 44);
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}


/**
 *  重新布局按钮
 *  设置文字在左边，图片在右边
 *
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect{

    CGFloat titleW = contentRect.size.width - IMAAGE_WIDTH;
    CGFloat titleH = contentRect.size.height;
    
    NSLog(@"titleW: %f   contentRect.size.width %f",titleW, contentRect.size.width);
    
    return CGRectMake(0, 0, titleW, titleH);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{

    CGFloat imageX = contentRect.size.width - IMAAGE_WIDTH;
    CGFloat imageH = contentRect.size.height;

    return CGRectMake(imageX, 0, IMAAGE_WIDTH, imageH);
    
}

@end
