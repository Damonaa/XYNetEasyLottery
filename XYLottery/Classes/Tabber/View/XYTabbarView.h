//
//  XYTabbarView.h
//  XYLottery
//
//  Created by 李小亚 on 1/23/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYTabbarView;

@protocol XYTabbarViewDelegate <NSObject>

@optional
- (void)tabBarView:(XYTabbarView *)tabBarView clickBtnWithTag:(NSInteger)tag;

@end

@interface XYTabbarView : UIView

@property (nonatomic, weak) id<XYTabbarViewDelegate> delegate;

/**
 *  此方法用于添加按钮，设置其图片
 */
- (void)addTabbarButtonWithNormalImage:(NSString *)norName andSelectedIamge:(NSString *)selImage;

@end


@interface XYTabbarButton : UIButton

@end