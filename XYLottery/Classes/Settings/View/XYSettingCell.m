//
//  XYSettingCell.m
//  XYLottery
//
//  Created by 李小亚 on 1/24/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import "XYSettingCell.h"
#import "XYSettingItem.h"
#import "XYSettingItemArrow.h"
#import "XYSettingItemSwitch.h"
#import "XYSettingItemLabel.h"

#import "XYScoreLiveVC.h"


@interface XYSettingCell ()
/**
 *  自定义附件图片， 箭头
 */
@property (nonatomic, strong) UIImageView *myImageView;
/**
 * 开关
 */
@property (nonatomic, strong) UISwitch *mySwitch;

/**
 *  文本标签附件
 */
@property (nonatomic, strong) UILabel *myLabel;

@end

@implementation XYSettingCell

/**
 *  懒加载
 *
 *  @return 在生成cell的时候，就不需要再加载这些玩意了
 */
- (UIImageView *)myImageView{
    if (!_myImageView) {
        _myImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _myImageView;
}
- (UISwitch *)mySwitch{
    if (!_mySwitch) {
        _mySwitch = [[UISwitch alloc] init];
        //添加监听事件，用于保存设置
        [_mySwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mySwitch;
}
//- (UILabel *)myLabel{
//    if (!_myLabel) {
//        _myLabel = [[UILabel alloc] init];
//        _myLabel.bounds = CGRectMake(0, 0, 88, 40);
//        _myLabel.textAlignment = NSTextAlignmentCenter;
// 
//        _myLabel.text = @"00:00";
//
//        
//    }
//    return _myLabel;
//}

- (void)switchValueChanged:(UISwitch *)sender{
    //使用用户偏好设置保存开关状态
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //使用这个开关所对应的行的 title 作为关键字
    [defaults setBool:sender.isOn forKey:self.item.title];
    //同步
    [defaults synchronize];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
      static  NSString *reuse = @"cell";
    XYSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[XYSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuse];
    }
    return cell;
}

- (void)setItem:(XYSettingItem *)item{
    _item = item;
    
    self.textLabel.text = item.title;
    
    self.detailTextLabel.text = item.subTitle;
    
    if (item.icon) {
        self.imageView.image = [UIImage imageNamed:item.icon];
    }
    
    
    if ([item isKindOfClass:[XYSettingItemArrow class]]) {
        
        self.accessoryView = self.myImageView;
//        设置cell是否可选中 箭头  可选中
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        
        
    }else if ([item isKindOfClass:[XYSettingItemSwitch class]]){
        
        //使用默认的设置
        self.mySwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:item.title];
        
        self.accessoryView = self.mySwitch;
//        switch 不可选中
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }else if ([item isKindOfClass:[XYSettingItemLabel class]]){
        
        
        _myLabel = [[UILabel alloc] init];
        _myLabel.bounds = CGRectMake(0, 0, 88, 40);
        _myLabel.textAlignment = NSTextAlignmentCenter;
        if (item.dateString) {
            _myLabel.text = item.dateString;
        }else{
            _myLabel.text = @"00:00";
        }
        
        self.accessoryView = self.myLabel;
        //可选中
        self.selectionStyle = UITableViewCellSelectionStyleDefault;

    }
    
}

@end
