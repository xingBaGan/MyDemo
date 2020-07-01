//
//  AppraiseTableViewCell.m
//  MyDemo
//
//  Created by a on 2020/6/29.
//  Copyright © 2020 good. All rights reserved.
//

#import "AppraiseTableViewCell.h"

@implementation AppraiseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setModel:(AppraiseModel *)model {
    _model = model;
    self.username.text = self.model.username;
    self.appraise.text = self.model.aappraiseContent;
    self.starNum.text =  [NSString stringWithFormat:@"%@%@", self.model.appraisePoint ,@"星级" ];
//    [self.image setImage:[UIImage imageNamed:self.model.appraiseImage]];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
