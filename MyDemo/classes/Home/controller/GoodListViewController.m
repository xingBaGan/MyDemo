//
//  GoodListViewController.m
//  MyDemo
//
//  Created by a on 2020/6/29.
//  Copyright © 2020 good. All rights reserved.
//

#import "GoodListViewController.h"
#import "GoodsTableViewCell.h"
#import "gDetailViewController.h"
#import "NetworkTool.h"
#import "UserInfoModel.h"
#import "GoodsModel.h"
#import "SVProgressHUD+LAN.h"
#import "MineViewController.h"
@interface GoodListViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic)  UITableView *tableview;
@property (strong, nonatomic) NSMutableArray *allDataSourceArr;
@property (strong, nonatomic) NSMutableArray *dataSourceArr;
@end

@implementation GoodListViewController

- (void)viewWillAppear:(BOOL)animated
{
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:216 / 255.0f green:209 / 255.0f
                                                                   blue:192 / 255.0f alpha:1]];
    self.navigationController.navigationBarHidden = NO;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:self.tableview];
    //搜索按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithImage:[UIImage
                                                             imageNamed:@"search_tabBar"]
                                                      style:UIBarButtonItemStylePlain
                                                     target:self                  action:@selector(x)];
    [self loadInfoArray];
}

- (void)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)l {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)x {
    MineViewController *infoDetailViewController = [[MineViewController alloc] init];
    [self.navigationController pushViewController:infoDetailViewController animated:true];
}

#pragma mark -  根据职工号查找会议
- (void)loadInfoArray {
    //清空会议列表
    self.allDataSourceArr = [[NSMutableArray alloc] init];
    self.dataSourceArr = [[NSMutableArray alloc] init];
    //访问网络
    [[NetworkTool shareInstance] requireMethodType:GETType
                                         URLString:@"/listAll" parameters:nil success:^(NSDictionary *respondDictionary) {
        
        
//        if ([respondDictionary[@"code"] == 200 ) {
            for (NSDictionary *dic in respondDictionary[@"data"]) {
                GoodsModel *model = [GoodsModel yy_modelWithDictionary:dic];
                [self.allDataSourceArr addObject:model];
                [self.dataSourceArr addObject:model];
            }
            [self.tableview reloadData];
//        }
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"请求网络失败"];
        //  正常结束刷新
        //[self.tableView.mj_header endRefreshing];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //返回 nib 中 cell 的高度
    return 120;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GoodsTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"GoodsTableViewCell" owner:nil
                                           options:nil].firstObject;
    }
    cell.model = self.dataSourceArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    //  取出 cell
    GoodsTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //  弹出会议详情页
    gDetailViewController *infoDetailViewController = [[gDetailViewController alloc] initWithModel:self.dataSourceArr[indexPath.row]];
//    infoDetailViewController.shopId = cell.model.shopId;
   
    [self.navigationController pushViewController:infoDetailViewController animated:true];
}

/*
#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
}
*/

- (UITableView *)tableview {
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    }
    return _tableview;
}

@end
