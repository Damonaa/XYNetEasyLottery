//
//  XYWebHelpVC.m
//  XYLottery
//
//  Created by 李小亚 on 1/26/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import "XYHelpVC.h"
#import "XYHelpPage.h"
#import "XYWebVC.h"

@interface XYHelpVC ()

@property (nonatomic, strong) NSArray *htmls;

@end

@implementation XYHelpVC

- (NSArray *)htmls{
    if (!_htmls) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        NSArray *helpsArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSMutableArray *allHtmls = [NSMutableArray array];
        for (NSDictionary *dic in helpsArray) {
            XYHelpPage *page = [XYHelpPage helpPageWithDic:dic];
            [allHtmls addObject:page];
        }
        _htmls = allHtmls;
        
    }
    return _htmls;
}

- (void)viewDidLoad{
    [super viewDidLoad];

    XYSettingGroup *group = [[XYSettingGroup alloc] init];
    
    NSMutableArray *tempItems = [NSMutableArray array];
    for (XYHelpPage *hp in self.htmls) {
        
        XYSettingItem *item = [XYSettingItemArrow itemWithIcon:nil andTitle:hp.title];
        
        [tempItems addObject:item];
    }
    group.items = tempItems;
    
    [self.items addObject:group];
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    XYHelpPage *helpPage = self.htmls[indexPath.row];
    
    XYWebVC *hvc = [[XYWebVC alloc] init];
    hvc.helpPage = helpPage;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:hvc];
    
    [self presentViewController:nav animated:YES completion:nil];
}
@end
