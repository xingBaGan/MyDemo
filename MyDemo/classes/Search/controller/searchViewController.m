//
//  searchViewController.m
//  MyDemo
//
//  Created by a on 2020/6/29.
//  Copyright © 2020 good. All rights reserved.
//

#import "searchViewController.h"
#import "NetworkTool.h"
#import "SVProgressHUD+LAN.h"
#import "GoodsModel.h"
#import "GoodsListViewController.h"
@interface searchViewController ()<UITextFieldDelegate, UIActionSheetDelegate>
//@property UITextField *shopName;
@property (weak, nonatomic) IBOutlet UITextField *shopName;
@property (weak, nonatomic) IBOutlet UIButton *type;
@property (weak, nonatomic) IBOutlet UIButton *area;
@property NSUInteger searchType;
@property NSUInteger searchRange;
/*  所有的 数据源  */
@property NSMutableArray *allDataSourceArr;

@end

@implementation searchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    self.title = @"搜索商户信息";
    self.view.backgroundColor = [UIColor whiteColor];
    _searchType = 3;
    _searchRange = 3;
    self.shopName.delegate = self;
    self.shopName.returnKeyType = UIReturnKeyDone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//-(void)loadView{
//        self.title=@"查找商户";
//
//}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    [textField resignFirstResponder];
    [self.view endEditing:YES];
    return YES;
}

- (IBAction)searchBtn:(id)sender {
//        NSDictionary *parameters = @{@"shopType":[NSString stringWithFormat:@"%lu",(unsigned
//long)self.searchType],@"shopDistance":[NSString  stringWithFormat:@"%lu",(unsigned
//long)self.searchRange]};
//        NSLog(@"%@",parameters);
//
//        [[NetworkTool shareInstance] requireMethodType:POSTType
//URLString:@"MyDemoInterface/findSelectedAllShop"  parameters:parameters
//success:^(NSDictionary *respondDictionary) {
////                GoodsListViewController    *nav=[[GoodsListViewController alloc]init];
////                if([respondDictionary[@"result"] isEqualToString:@"success"]){
//                        for (NSDictionary *dic in respondDictionary[@"list"]) {
////                                GoodsModel *model = [[GoodsModel yy_modelWithDictionary:dic];
////                                [self.allDataSourceArr addObject:model];
////                                [self.dataSourceArr addObject:model];
////                                [self.navigationController  pushViewController:[[GoodsListViewController
//alloc]init] animated:YES];
//                        }
//
////
//    //                        UINavigationController  *na=[[UINavigationController alloc;]initWithRootViewController:nav];
//    //                        [self presentViewController:na animated:YES completion:nil];
//                    },failure:^(NSError *error) {
//                            [SVProgressHUD showErrorWithStatus:@"搜索商户失败"];
//                            //  正常结束刷新
//                            //[self.tableView.mj_header endRefreshing];
//                    }];
}

- (IBAction)selectType:(id)sender {
    UIActionSheet *sheet = [[UIActionSheet  alloc]initWithTitle:@" 请选择商户类型 "
delegate:self  cancelButtonTitle:@"取消"  destructiveButtonTitle:nil otherButtonTitles:@"餐饮美食", @"休闲娱乐", @"全部类型", nil];
    sheet.tag = 100;
    [sheet showInView:self.view];
}

- (IBAction)selectArea:(id)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@" 请选择商户区域"
delegate:self  cancelButtonTitle:@"取消"  destructiveButtonTitle:nil otherButtonTitles:@"附近500m", @"附近 1000m", @"全部区域", nil];
    sheet.tag = 101;
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if ((actionSheet.tag == 100)) {
        _searchType = buttonIndex + 1;
        switch (buttonIndex) {
            case 0:
                [_type setTitle:@"餐饮美食" forState:UIControlStateNormal];
                break;
            case 1:
                [_type setTitle:@"休闲娱乐" forState:UIControlStateNormal];
                break;
            case 2:
                [_type setTitle:@"全部类型" forState:UIControlStateNormal];
                break;
            default:
                break;
        }
    } else {
        _searchRange = buttonIndex + 1;
        switch (buttonIndex) {
            case 0:

                [_area setTitle:@"附近 500 米" forState:UIControlStateNormal];
                break;
            case 1:
                [_area setTitle:@"附近 1000 米" forState:UIControlStateNormal];
                break;
            case 2:
                [_area setTitle:@"全部区域" forState:UIControlStateNormal];
                break;
            default:
                break;
        }
    }
}

@end
