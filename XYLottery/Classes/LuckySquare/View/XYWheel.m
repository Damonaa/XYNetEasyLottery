//
//  XYWheel.m
//  XYLottery
//
//  Created by 李小亚 on 1/27/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import "XYWheel.h"
#import "XYWheelButton.h"

@interface XYWheel ()
@property (weak, nonatomic) IBOutlet UIImageView *wheelImage;


@property (nonatomic, weak) UIButton *selectedBtn;
@property (nonatomic, strong) CADisplayLink *link;

@end

@implementation XYWheel

- (void)awakeFromNib{
    
    NSInteger count = 12;
    
    UIImage *bigImage = [UIImage imageNamed:@"LuckyAstrology"];
    UIImage *selectedImage = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    
    
    
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat astrologyImageH = bigImage.size.height * scale;
    CGFloat astrologyImageW = bigImage.size.width / count * scale;
    
    CGFloat angle = M_PI / 6;
    for (int i =0; i < count; i++) {
        UIButton *btn = [XYWheelButton buttonWithType:UIButtonTypeCustom];
        btn.bounds = CGRectMake(0, 0, 68, 143);
        
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        btn.tag = i;
        
//        剪裁图片
//        设置normal 状态的图片
        CGRect smallRect = CGRectMake(astrologyImageW * i, 0, astrologyImageW, astrologyImageH);
        CGImageRef smallInageRef = CGImageCreateWithImageInRect(bigImage.CGImage, smallRect);
        [btn setImage:[UIImage imageWithCGImage:smallInageRef] forState:UIControlStateNormal];
//        设置selected的图片
        CGImageRef smallImageSel = CGImageCreateWithImageInRect(selectedImage.CGImage, smallRect);
        [btn setImage:[UIImage imageWithCGImage:smallImageSel] forState:UIControlStateSelected];
        
//        设置按钮锚点
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
        CGFloat center = self.wheelImage.bounds.size.width * 0.5;
        btn.layer.position = CGPointMake(center, center);
        
//旋转button
        btn.transform = CGAffineTransformMakeRotation(angle * i);
//        注册事件
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        [self.wheelImage addSubview:btn];
        
//        设置第一个为默认的选中
        if (i == 0) {
//            btn.selected = YES;
            [self btnClick:btn];
        } 
    }
    
}
- (void)btnClick:(UIButton *)sender{
    
    NSLog(@"dhgfjklj%ld", (long)sender.tag);
//    切换按钮的选中状态
    self.selectedBtn.selected = NO;
    
    sender.selected = YES;
    
    self.selectedBtn = sender;
    
}
+ (instancetype)luckyWheel{
    return [[[NSBundle mainBundle] loadNibNamed:@"XYWheel" owner:nil options:nil] lastObject];
}

//点击中间开始的按钮，开始旋转
- (IBAction)clickCenterBtn {
    
//    先停止当前的转动
    if (self.link) {
        [self stopRotate];
    }
//    禁止选中按钮
    self.userInteractionEnabled = NO;
    
//    创建核心动画， 快速转动， 转动完成后，调用代理方法， 稍停一会，继续自动转动
    CABasicAnimation *ani = [CABasicAnimation animation];
    ani.keyPath = @"transform.rotation";
    ani.toValue = @(M_PI * 6);
    ani.duration = 2;
    ani.delegate = self;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.wheelImage.layer addAnimation:ani forKey:nil];
    
}

//开始旋转
-  (void)startRotate{
//    如若link已经存在，那么返回
    if (self.link) {
        return;
    }
//    添加定时循环
    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateWheel)];
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}
//默认自己转动
- (void)updateWheel{
    self.wheelImage.transform = CGAffineTransformRotate(self.wheelImage.transform, M_PI /200);
//    self.wheelImage.transform = CGAffineTransformMakeRotation(M_PI / 200);
}
//停止转动，清空link
- (void)stopRotate{
    [self.link invalidate];
    self.link = nil;
}

#pragma animation delegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{

    self.userInteractionEnabled = YES;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (!self.link) {
            [self startRotate];
        }
    });
}
@end
