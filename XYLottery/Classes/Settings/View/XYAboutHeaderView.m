//
//  XYAboutHeaderView.m
//  XYLottery
//
//  Created by 李小亚 on 1/27/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import "XYAboutHeaderView.h"

@implementation XYAboutHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (instancetype)aboutHeaderView{
    return [[[NSBundle mainBundle] loadNibNamed:@"XYAboutHeaderView" owner:nil options:nil] lastObject];
}
@end
