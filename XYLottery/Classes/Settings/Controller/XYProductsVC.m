//
//  XYProductsVC.m
//  XYLottery
//
//  Created by 李小亚 on 1/26/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import "XYProductsVC.h"
#import "XYProduct.h"
#import "XYProductCell.h"

@interface XYProductsVC ()

/**
 *  所有产品信息
 */
@property (nonatomic, strong) NSArray *products;

@end

@implementation XYProductsVC

- (NSArray *)products{
    if (!_products) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"products.json" ofType:nil];
        
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        NSArray *tempArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSMutableArray *productsMu = [NSMutableArray array];
        
        for (NSDictionary *dic in tempArray) {
            XYProduct *product = [XYProduct productWithDic:dic];
            [productsMu addObject:product];
        }
        _products = productsMu;
        
    }
    return _products;
}

/**
 *  重用id
 */
static NSString *const reuseIdentifier = @"cell";

- (instancetype)init{
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    
    if (self = [super initWithCollectionViewLayout:flow]) {
        flow.itemSize = CGSizeMake(80, 100);
        flow.minimumLineSpacing = 50;
        flow.sectionInset = UIEdgeInsetsMake(20, 5, 0, 5);
        
    }
    return self;
}
- (void)viewDidLoad{
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"XYProductCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
}


#pragma mark - collection view data source
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.products.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XYProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.product = self.products[indexPath.row];
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@", indexPath);
}
@end
