//
//  XYLuckySquareVC.m
//  XYLottery
//
//  Created by 李小亚 on 1/27/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import "XYLuckySquareVC.h"
#import "XYWheel.h"

@interface XYLuckySquareVC ()
@property (nonatomic, weak) XYWheel *wheel;
@end

@implementation XYLuckySquareVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    XYWheel *wheel = [XYWheel luckyWheel];
    self.wheel = wheel;
    [self.view addSubview:wheel];
    wheel.center = self.view.center;
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.wheel startRotate];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.wheel stopRotate];
}

@end
