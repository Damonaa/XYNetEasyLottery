//
//  XYWebVC.m
//  XYLottery
//
//  Created by 李小亚 on 1/26/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import "XYWebVC.h"
#import "XYHelpPage.h"

@interface XYWebVC ()<UIWebViewDelegate>

@property (nonatomic, weak) UIWebView *webView;

@end

@implementation XYWebVC

- (void)loadView{
    UIWebView *webView = [[UIWebView alloc] init];
    self.view = webView;
    self.webView = webView;
    self.webView.delegate = self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.title = @"帮助";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(clickLetfBtn)];
    
    
//    加载数据
    NSURL *url = [[NSBundle mainBundle] URLForResource:self.helpPage.html withExtension:nil];
    NSURLRequest *request= [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)clickLetfBtn{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - web delegate
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    if (!self.helpPage.ID) {
        return;
    }
    
    //执行javascript
    
    NSString *jsStr = [NSString stringWithFormat:@"window.location.href = '#%@'", self.helpPage.ID];
    [webView stringByEvaluatingJavaScriptFromString:jsStr];
}
@end
