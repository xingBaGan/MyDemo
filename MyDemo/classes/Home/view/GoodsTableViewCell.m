//
//  GoodsTableViewCell.m
//  MyDemo
//
//  Created by a on 2020/6/29.
//  Copyright © 2020 good. All rights reserved.
//

#import "GoodsTableViewCell.h"

@implementation GoodsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setModel:(GoodsModel *)model {
    _model = model;
    if(model){
        self.title.text = self.model.shopName;
        self.renjun.text = self.model.shopPhone;
        self.introduce.text = self.model.shopDesc;
        [self.image setImage:[UIImage imageNamed:@""]];
    }
}
@end
