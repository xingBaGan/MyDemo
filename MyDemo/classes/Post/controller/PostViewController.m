//
//  PostViewController.m
//  MyDemo
//
//  Created by a on 2020/6/30.
//  Copyright © 2020 good. All rights reserved.
//

#import "PostViewController.h"
#import "GoodsModel.h"
#import "NetworkTool.h"
#import "SVProgressHUD+LAN.h"
@interface PostViewController ()<UIActionSheetDelegate,UITabBarDelegate>
@property NSUInteger searchType;
@property (strong,nonatomic)GoodsModel * model;
@end

@implementation PostViewController


- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tabBarController.delegate = self;
    [self addDate];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     [self.tabBarController.navigationController.navigationBar setHidden:YES];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UITabBarSystemItemMore target:self action:@selector(post)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (IBAction)get_type:(id)sender {
      UIActionSheet *sheet = [[UIActionSheet  alloc]initWithTitle:@" 请选择商户类型 "
    delegate:self  cancelButtonTitle:@"取消"  destructiveButtonTitle:nil otherButtonTitles:@"餐饮美食", @"休闲娱乐", @"全部类型", nil];
        sheet.tag = 100;
        [sheet showInView:self.view];
}
-(void)addDate{
    self.shopName_fld.text = @"肯德基";
    self.shopDesc_txtfld.text = @"wei d";
    self.shopAddress_txtfld.text = @"市中心广场";
    self.spend_txtfld.text = @"78";
    self.shopPhone_txtfld.text = @"154981847";
//    self.time_txtfld.text = @"肯德基";
  
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
if ((actionSheet.tag == 100)) {
    _searchType = buttonIndex + 1;
    switch (buttonIndex) {
        case 0:
            [_getType_btn setTitle:@"餐饮美食" forState:UIControlStateNormal];
            break;
        case 1:
            [_getType_btn setTitle:@"休闲娱乐" forState:UIControlStateNormal];
            break;
        case 2:
            [_getType_btn setTitle:@"全部类型" forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}
    
    
}
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
//    if(item.tag == 1){
//         [self.tabBarController.navigationController.navigationBar setHidden:YES];
//    }else{
       
//    }
   
}
-(void)post{
//    NSLog(@"ok");
//    self.model.shopName = self.shopName_fld.text;
//    self.model.shopDesc = self.shopDesc_txtfld.text;
//    self.model.shopAddress = self.shopAddress_txtfld.text;
//    self.model.shopPhone = self.shopPhone_txtfld.text;
//    self.model.shopType = self.getType_btn.titleLabel.text;
//    NSLog(@"%@",[GoodsModel yy_modelToJSONObject]);
      id temp  =  [NetworkTool shareInstance].requestSerializer;
    [NetworkTool shareInstance].requestSerializer = [AFJSONRequestSerializer serializer];
    NSMutableDictionary* dic = [[NSMutableDictionary alloc]init];
    dic[@"shopName"] =self.shopName_fld.text;
    dic[@"shopDesc"] = self.shopDesc_txtfld.text;
    dic[@"shopAddress"] = self.shopAddress_txtfld.text;
    dic[@"shopPhone"] = self.shopPhone_txtfld.text;
    dic[@"shopType"] = self.getType_btn.titleLabel.text;
    //    NSLog(@"%@",[GoodsModel yy_modelToJSONObject]);
    [[NetworkTool shareInstance]requireMethodType:POSTType URLString:@"/postShop" parameters:dic  success:^(NSDictionary * _Nonnull respondDictionary) {
//        NSLog(@"%@",respondDictionary);
        [SVProgressHUD showWithStatus:@"修改成功！"];

//        [NetworkTool shareInstance].requestSerializer = temp;
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"fail");
    }];


    
}



- (GoodsModel *)model {
    if (!_model) {
        _model = [[GoodsModel alloc] init];
    }
    return _model;
}
@end
