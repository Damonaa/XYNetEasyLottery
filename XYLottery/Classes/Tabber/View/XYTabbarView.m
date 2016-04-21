//
//  XYTabbarView.m
//  XYLottery
//
//  Created by 李小亚 on 1/23/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import "XYTabbarView.h"


@interface XYTabbarView ()

/**
 此按钮为保存选中的按钮
 */
@property (nonatomic, weak) UIButton *selectedBtn;

@end

@implementation XYTabbarView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}


/**
 *  局部View上按钮的位置
 */
- (void)layoutSubviews{
    [super layoutSubviews];
    
    //
    NSInteger count = self.subviews.count;
    
    CGFloat btnW = self.bounds.size.width / count;
    CGFloat btnH = self.bounds.size.height;

    for (UIButton *btn in self.subviews) {
        CGFloat btnX = btnW * btn.tag;
        btn.frame = CGRectMake(btnX, 0, btnW, btnH);
        
        //设置默认第一个为选中
        if (btn.tag == 0) {
            [self clickBtn:btn];
        }
    }
    
}

/**
 *  此方法用于添加按钮，设置其图片
 */
- (void)addTabbarButtonWithNormalImage:(NSString *)norName andSelectedIamge:(NSString *)selImage{
    
    UIButton *btn = [XYTabbarButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:norName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selImage] forState:UIControlStateSelected];
    /**
     *  为其添加tag
     */
    btn.tag = self.subviews.count;
    //添加绑事件
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:btn];
}

/**
 *  响应按钮点击事件
 */
- (void)clickBtn:(UIButton *)sender{
    
    
    if ([self.delegate respondsToSelector:@selector(tabBarView:clickBtnWithTag:)]) {
        [self.delegate tabBarView:self clickBtnWithTag:sender.tag];
    }
    
    NSLog(@"btn tag :%ld", (long)sender.tag);
    
    //点击更改选中状态
    self.selectedBtn.selected = NO;
    sender.selected = YES;
    self.selectedBtn = sender;
}


@end


@implementation XYTabbarButton

- (void)setHighlighted:(BOOL)highlighted{
    
}

@end
