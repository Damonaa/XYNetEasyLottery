//
//  XYScoreLiveVC.m
//  XYLottery
//
//  Created by 李小亚 on 1/25/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import "XYScoreLiveVC.h"


@interface XYScoreLiveVC ()


/**
 *  textfield 用于调用显示 date picker View
 */

@property (nonatomic, weak) UITextField *invisibleField;

/**
 *  标记选中开始lable的事件
 */
@property (nonatomic, assign) BOOL startTime;
/**
 *  标记选中结束lable的事件
 */
@property (nonatomic, assign) BOOL endTime;

@end
@implementation XYScoreLiveVC

- (void)viewDidLoad{
    [super viewDidLoad];
    
    /**
     创建一个textfiled添加到table View上
    再创建一个date picker，用于作为textfiled的输入窗口
     */
    
    UITextField *invisibleField = [[UITextField alloc] init];
    self.invisibleField = invisibleField;
    [self.tableView addSubview:invisibleField];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeTime;
    datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    self.invisibleField.inputView = datePicker;
    
//    为datepicker注册通知事件
    [datePicker addTarget:self action:@selector(datePickerValueChange:) forControlEvents:UIControlEventValueChanged];
    
    __weak typeof(self) selfObj = self;
    
    
    XYSettingItem *item1 = [XYSettingItemSwitch itemWithIcon:nil andTitle:@"提醒我关注的比赛"];
    XYSettingGroup *group1 = [[XYSettingGroup alloc] init];
    group1.items = @[item1];
    group1.footerTitle = @"看毛线个比分呀，你又中不了";
    [self.items addObject:group1];
    
    XYSettingItem *item2 = [XYSettingItemLabel itemWithIcon:nil andTitle:@"开始时间"];
    
    
    XYSettingGroup *group2 = [[XYSettingGroup alloc] init];
    
    item2.operation = ^{
        self.startTime = YES;
        self.endTime = NO;
//        使textfield成为第一响应
        [selfObj.invisibleField becomeFirstResponder];
    };
    group2.items = @[item2];
    group2.headerTitle = @"你要什么时间范围内通知你呀";
    [self.items addObject:group2];
    
    XYSettingItem *item3 = [XYSettingItemLabel itemWithIcon:nil andTitle:@"结束时间"];
    item3.operation = ^{
        self.startTime = NO;
        self.endTime = YES;
        [selfObj.invisibleField becomeFirstResponder];
    };
    XYSettingGroup *group3 = [[XYSettingGroup alloc] init];
    group3.items = @[item3];
    [self.items addObject:group3];
    
    
}


- (void)datePickerValueChange:(UIDatePicker *)picker{
  
    NSDate *date = picker.date;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"HH:mm";
    NSString *dateStr = [dateFormatter stringFromDate:date];

    
    if (self.startTime) {
        [self changeLabelTime:dateStr andLoc:1 section:1];

    }else if (self.endTime){

        [self changeLabelTime:dateStr andLoc:2 section:2];        
    }
}
//修改label的时间
- (void)changeLabelTime:(NSString *)dateStr andLoc:(NSInteger)index section:(NSInteger)section{
    XYSettingGroup *startGroup = self.items[index];
    XYSettingItem *item = [startGroup.items lastObject];
    item.dateString = dateStr;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:section];
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.invisibleField endEditing:YES];
//    [self.invisibleField resignFirstResponder];
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [super touchesBegan:touches withEvent:event];
//    NSLog(@"%s", __func__);
//    [self.invisibleField resignFirstResponder];
//}
@end
