//
//  ShakeeViewController.m
//  MyDemo
//
//  Created by a on 2020/6/30.
//  Copyright © 2020 good. All rights reserved.
//

#import "ShakeeViewController.h"
//#import "GoodsListViewController.h"
#import "searchViewController.h"
@interface ShakeeViewController ()
@property  (strong,nonatomic) UIImageView* image;
@end

@implementation ShakeeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.image];
    self.view.backgroundColor = [UIColor yellowColor];
    
}

- (void)loadView
{
    [super loadView];
}

//这里需要返回 yes
- (BOOL)canBecomeFirstResponder
{
    return YES;
}

//摇动开始
- (void)motionBegan:(UIEventSubtype)motion withEvent:(nullable UIEvent *)event
{
}

//摇动结束
- (void)motionEnded:(UIEventSubtype)motion withEvent:(nullable UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake) {
        //这里插入事件代码
        searchViewController *infoDetailViewController =  [[searchViewController  alloc]
                                                              init];

        [self.navigationController pushViewController:infoDetailViewController animated:true];
    }
}

//摇动取消
- (void)motionCancelled:(UIEventSubtype)motion withEvent:(nullable UIEvent *)event
{
}

- (void)didReceiveMemoryWarning
{
    //dispose of any resources that can be recreated.
}


- (UIImageView *)image {
    if (!_image) {
        _image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shake"]];
        _image.frame = CGRectMake(150, 150, 50, 50);
    }
    return _image;
}
@end
