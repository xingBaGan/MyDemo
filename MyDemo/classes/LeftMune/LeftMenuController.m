//
//  LeftMenuController.m
//  MyDemo
//
//  Created by a on 2020/6/30.
//  Copyright © 2020 good. All rights reserved.
//

#import "LeftMenuController.h"
#import "GoodsListViewController.h"
#import "MineViewController.h"
//#import "UIViewController+YQSlideMenu.h"
#import "PostViewController.h"
#import "ShakeeViewController.h"
@interface LeftMenuController ()
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *dataArray1;
@property (nonatomic,strong)UITableView* tableView;
@end

@implementation LeftMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    UIImageView *imageView = [[UIImageView alloc]init];
    UIImage *image = [UIImage imageNamed:@"程序员"];
    [imageView setImage:image];
    [imageView setFrame:CGRectMake(20, 20, 100, 100)];

    [self.view addSubview:imageView];
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(130, 20, 100, 50)];
    name.text = @"程序员";
    name.font = [UIFont fontWithName:@"STHeiti-Medium.ttc"size:18];
    [self.view addSubview:name];
    UILabel *name1 = [[UILabel alloc]initWithFrame:CGRectMake(130, 70, 100, 50)];
    name1.text = @"没有黑夜";
    name1.font = [UIFont fontWithName:@"STHeiti-Medium.ttc"size:15];
    [self.view addSubview:name1];
   
    //Uncommentthefollowinglinetopreserveselectionbetweenpresentations.
    //self.clearsSelectionOnViewWillAppear=NO;

    //UncommentthefollowinglinetodisplayanEditbuttoninthenavigationbarforthisviewcontroller.
    //self.navigationItem.rightBarButtonItem=self.editButtonItem;
//    self.dataArray = @[@"商铺列表", @"搜索", @"添加商铺", @"摇一摇"];
//    self.dataArray1 = @[[UIImage imageNamed:@" 列 表 "], [UIImage imageNamed:@" 搜 索 "],[UIImage imageNamed:@"新增"], [UIImage imageNamed:@"摇一摇"]];
//    [self.tableView registerClass:[UITableViewCell class]
//           forCellReuseIdentifier:@"reuseIdentifier"];
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.tableView.bounds.size.width, 150)];
//    self.tableView.tableHeaderView = headerView;
//    [self.tableView reloadData];
//    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    //Disposeofanyresourcesthatcanberecreated.
}

#pragma mark -Tableviewdatasource
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    //Returnthenumberofsections.
//    return 1;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath
//                                                                       *)indexPath
//{
//    //返回 nib 中 cell 的高度
//    return 80;
//}
//
//- (NSInteger)tableView:(UITableView *)tableViewnumberOfRowsInSection:(NSInteger)section
//{
//    //Returnthenumberofrowsinthesection.
//    return self.dataArray.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath
//                                                                               *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"
//                                                            forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor whiteColor];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    //Configurethecell...
//    cell.textLabel.text = self.dataArray[indexPath.row];
//    cell.imageView.image = self.dataArray1[indexPath.row];
//    return cell;
//}

/*
//Overridetosupportconditionaleditingofthetableview.
-(BOOL)tableView:(UITableView*)tableViewcanEditRowAtIndexPath:(NSIndexPath*)indexPath{
    //ReturnNOifyoudonotwantthespecifieditemtobeeditable.
    returnYES;
}
*/
/*
//Overridetosupporteditingthetableview.
- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath
*)indexPath{
    if(editingStyle==UITableViewCellEditingStyleDelete){
        //Deletetherowfromthedatasource
        [tableView deleteRowsAtIndexPaths:@[indexPath]
withRowAnimation:UITableViewRowAnimationFade];
    }elseif(editingStyle==UITableViewCellEditingStyleInsert){
        //Createanewinstanceoftheappropriateclass,insertitintothearray,andaddanew
rowtothetableview
    }
}
*/
/*
//Overridetosupportrearrangingthetableview.
-(void)tableView:(UITableView*)tableViewmoveRowAtIndexPath:(NSIndexPath*)fromIndexPath
toIndexPath:(NSIndexPath*)toIndexPath{
}
*/
/*
//Overridetosupportconditionalrearrangingofthetableview.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath
*)indexPath{
    //ReturnNOifyoudonotwanttheitemtobere-orderable.
    returnYES;
}
*/
#pragma mark -Tableviewdelegate
// In a xib-based application, navigation from a table can be handled in- tableView :didSelectRowAtIndexPath:
    - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    Navigationlogicmaygohere,forexample:Createthenextviewcontroller.

//    if (indexPath.row == 0) {
//        GoodsListViewController *one = [[GoodsListViewController alloc]
//                                        initWithNibName:@"GoodsListViewController"bundle:nil];
//        [self.slideMenuController showViewController:one];
//        one.title = self.dataArray[indexPath.row];
//    }
//    elseif(indexPath.row == 1){
//        MineViewController *two = [[MineViewController alloc]
//                                   initWithNibName:@"MineViewController"bundle:nil];
//        [self.slideMenuController showViewController:two];
//        two.title = self.dataArray[indexPath.row];
//    } elseif(indexPath.row == 2){
//        PostViewController *three = [[PostViewController alloc]
//                                     initWithNibName:@"PostViewController"bundle:nil];
//        [self.slideMenuController showViewController:three];
//        three.title = self.dataArray[indexPath.row];
//    } elseif(indexPath.row == 3){
//        ShakeeViewController *four = [[ShakeeViewController alloc]
//                                      initWithNibName:@"ShakeeViewController"bundle:nil];
//        [self.slideMenuController showViewController:four];
//        four.title = self.dataArray[indexPath.row];
//    }
}

/*
#pragmamark-Navigation
// In a storyboard-based application, you will often want to do a little preparation before
navigation
-(void)prepareForSegue:(UIStoryboardSegue*)seguesender:(id)sender{
    //Getthenewviewcontrollerusing[seguedestinationViewController].
    //Passtheselectedobjecttothenewviewcontroller.
}
*/

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    }
    return _tableView;
}
@end
