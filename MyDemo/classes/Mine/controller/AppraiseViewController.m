//
//  AppraiseViewController.m
//  MyDemo
//
//  Created by a on 2020/6/29.
//  Copyright © 2020 good. All rights reserved.
//

#import "AppraiseViewController.h"

#import "AppraiseTableViewCell.h"
#import "NetworkTool.h"
#import "AppraiseModel.h"
#import "SVProgressHUD+LAN.h"

#import "appraisewViewController.h"
@interface AppraiseViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (strong,nonatomic)  UIButton* button;
@property (strong, nonatomic)  UITableView *tableview;
///*  所有的 数据源  */
@property NSMutableArray *allDataSourceArr;
/*  展示结果的 数据源  */
@property (nonatomic, strong) NSMutableArray *dataSourceArr;
@end
@implementation AppraiseViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage           imageNamed:@"navigationButtonReturnClick"] style:(UIBarButtonItemStylePlain) target:self action:@selector(l)];
    
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
    //self.navigationController.navigationBar.hidden=YES;
    [self.view addSubview:self.button];
    [self loadInfoArray];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];

     UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(back)];
        self.navigationItem.leftBarButtonItem = leftItem;
}
- (void)loadInfoArray
{
    //清空会议列表
    self.allDataSourceArr = [[NSMutableArray alloc] init];
    self.dataSourceArr = [[NSMutableArray alloc] init];
    //访问网络
    NSString *stringInt = [NSString stringWithFormat:@"%ld", (long)self.shopId];
//    NSDictionary *parameters = @{ @"shopId": stringInt };
    NSString* url =[NSString stringWithFormat:@"%@%@",@"/allappraiseByShopId/",stringInt];
    [[NetworkTool shareInstance] requireMethodType:GETType
                                         URLString:url parameters:nil success:^(NSDictionary
                                                                                                                       *respondDictionary) {
//        if ([respondDictionary[@"result"] isEqualToString:@"1"]) {
           NSLog(@"%@", respondDictionary);
            for (NSDictionary *dic in respondDictionary[@"data"]) {
             
                AppraiseModel *model = [AppraiseModel yy_modelWithDictionary:dic];
                [self.allDataSourceArr addObject:model];
                [self.dataSourceArr addObject:model];
//            }s
            [self.tableview reloadData];
        }
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"请求网络失败"];
        //  正常结束刷新
        //[self.tableView.mj_header endRefreshing];
    }];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (void)l
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //返回 nib 中 cell 的高度
    return 120;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSourceArr.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppraiseTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"AppraiseTableViewCell" owner:nil
                                           options:nil].firstObject;
    }
    cell.model = self.dataSourceArr[indexPath.row];
    return cell;
}

- (void)appraise:(id)sender
{
//    NSLog(@"ok");
    appraisewViewController *infoDetailViewController = [[appraisewViewController alloc] init];
    infoDetailViewController.shopId = self.shopId;
    [self.navigationController pushViewController:infoDetailViewController animated:true];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
//       [self.tabBarController.navigationController.navigationBar setHidden:NO];
}


- (UITableView *)tableview {
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    }
    return _tableview;
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_button setTintColor:[UIColor blueColor]];
        [_button setTitle:@"点击评论" forState:UIControlStateNormal];
        _button.frame = CGRectMake(87, 550, 200, 50);
        _button.backgroundColor  = [UIColor yellowColor];
        [_button addTarget:self action:@selector(appraise:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}
@end
