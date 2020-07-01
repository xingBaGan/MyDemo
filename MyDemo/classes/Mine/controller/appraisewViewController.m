//
//  appraisewViewControllerTableViewController.m
//  MyDemo
//
//  Created by a on 2020/6/29.
//  Copyright © 2020 good. All rights reserved.
//

#import "appraisewViewController.h"
#import "NetworkTool.h"
#import "SVProgressHUD+LAN.h"
@interface appraisewViewController ()

@end

@implementation appraisewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.starView setUpImages:3];

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    UIBarButtonItem * addItem = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(post)];
    self.navigationItem.rightBarButtonItem = addItem;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
-(void)post{
    id temp  =  [NetworkTool shareInstance].requestSerializer;
    [NetworkTool shareInstance].requestSerializer = [AFJSONRequestSerializer serializer];
    NSMutableDictionary* dic = [[NSMutableDictionary alloc]init];
    dic[@"username"] =self.comment_txtfld.text;
    dic[@"aappraiseContent"] = self.username_txtfld.text;
    dic[@"shopId"] = [NSNumber numberWithInteger:self.shopId];
    dic[@"appraisePoint"] = [NSNumber numberWithFloat:self.starView.point];

    [[NetworkTool shareInstance] requireMethodType:POSTType URLString:@"/postAppraise" parameters:dic success:^(NSDictionary *respondDictionary) {
        [SVProgressHUD showWithStatus:@"添加成功"];
//        [NetworkTool shareInstance].requestSerializer = temp;
        [SVProgressHUD dismissWithDelay:2];
    } failure:^(NSError *error) {

    }];
}


@end
