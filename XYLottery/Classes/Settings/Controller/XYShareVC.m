//
//  XYShareVC.m
//  XYLottery
//
//  Created by 李小亚 on 1/26/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import "XYShareVC.h"
#import <MessageUI/MessageUI.h>

@interface XYShareVC ()<MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate>

@end

@implementation XYShareVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    __weak typeof(self) weakSelf = self;
    
    XYSettingItem *item1 = [XYSettingItemArrow itemWithIcon:@"WeiboSina" andTitle:@"新浪微博"];
    
    XYSettingItemArrow *item2 = [XYSettingItemArrow itemWithIcon:@"MailShare" andTitle:@"邮件分享"];
    item2.operation = ^{
      
        MFMailComposeViewController *mcvc = [[MFMailComposeViewController alloc] init];
        
        [mcvc setSubject:@"hahah"];
        [mcvc setToRecipients:@[@"lixiaoy_a@163.com", @"1234@qq.com"]];
        [mcvc setMessageBody:@"我就玩一玩的" isHTML:NO];
        
        mcvc.mailComposeDelegate = weakSelf;
        
        [weakSelf presentViewController:mcvc animated:YES completion:nil];
        
    };
    
    XYSettingItemArrow *item3 = [XYSettingItemArrow itemWithIcon:@"SmsShare" andTitle:@"短信分享"];
    item3.operation = ^{
        //判断能否发短信
        if (![MFMessageComposeViewController canSendText]) {
            return;
        }
        
        MFMessageComposeViewController *mcVC = [[MFMessageComposeViewController alloc] init];
        
        mcVC.recipients = @[@"10086"];
        mcVC.body = @"Are you kidding!";
        
        mcVC.messageComposeDelegate = weakSelf;
        
        [weakSelf presentViewController:mcVC animated:YES completion:nil];
        
    };

    
    XYSettingGroup *group = [[XYSettingGroup alloc] init];
    group.items = @[item1, item2, item3];
    
    [self.items addObject:group];
}


#pragma mark - 短信分享代理
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    if (result == MessageComposeResultCancelled || result == MessageComposeResultSent) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    if (result == MFMailComposeResultSent || result == MFMailComposeResultCancelled) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)dealloc{
    NSLog(@"%s", __func__);
}
@end
