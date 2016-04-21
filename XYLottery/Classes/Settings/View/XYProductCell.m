//
//  XYProductCell.m
//  XYLottery
//
//  Created by 李小亚 on 1/26/16.
//  Copyright © 2016 李小亚. All rights reserved.
//

#import "XYProductCell.h"
#import "XYProduct.h"

@interface XYProductCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation XYProductCell

- (void)awakeFromNib{
    self.imageView.layer.cornerRadius = 15;
    self.imageView.layer.masksToBounds = YES;
}

- (void)setProduct:(XYProduct *)product{
    _product = product;
    self.imageView.image = [UIImage imageNamed:product.icon];
    self.titleLabel.text = product.title;
}
@end
