//
//  MainTabBarController.m
//  MyDemo
//
//  Created by a on 2020/6/29.
//  Copyright © 2020 good. All rights reserved.
//

#import "MainTabBarController.h"
#import "GoodListViewController.h"
#import "ShakeeViewController.h"
#import "SWRevealViewController.h"
#import "PostViewController.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSMutableArray *array = [NSMutableArray alloc]initWithArray:@"";
    
//    SWRevealViewController *revealViewController =self.revealViewController;
//
//    if(revealViewController)
//
//    {
//
////    [self.navigationItem.leftBarButtonItemsetTarget:self.revealViewController];
////
////    [self.navigationItem.leftBarButtonItemsetAction:@selector(revealToggle: )];
//// [self.navigationController.navigationBaraddGestureRecognizer:self.revealViewController.panGestureRecognizer];
//
//    }
//    SWRevealViewController *revealController = [self revealViewController];
//    [revealController panGestureRecognizer];
//    [revealController tapGestureRecognizer];
    PostViewController *postViewController = [PostViewController new];
    
       UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:@"商品列表" image:[UIImage imageNamed:@"write"] tag:1];
       postViewController.tabBarItem = item;
       [self addChildViewController:[[UINavigationController alloc]initWithRootViewController:postViewController]];

    GoodListViewController *goodsController = [GoodListViewController new];
    UITabBarItem *item1 = [[UITabBarItem alloc]initWithTitle:@"商品列表" image:[UIImage imageNamed:@"shop"] tag:2];
    goodsController.tabBarItem = item1;
    [self addChildViewController:[[UINavigationController alloc]initWithRootViewController:goodsController]];

    ShakeeViewController *shakeeViewController = [ShakeeViewController new];
    UITabBarItem *item2 = [[UITabBarItem alloc]initWithTitle:@"摇一摇" image:[UIImage imageNamed:@"shake"] tag:3];
    shakeeViewController.tabBarItem = item2;
    [self addChildViewController:[[UINavigationController alloc]initWithRootViewController:shakeeViewController]];
}

@end
