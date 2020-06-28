//
//  settinhHeaderViewController.m
//  MyDemo
//
//  Created by a on 2020/6/28.
//  Copyright © 2020 good. All rights reserved.
//

#import "settinhHeaderViewController.h"
//#import "LoginViewController.h"
//#import "NSString+NTES.h"
#import "SVProgressHUD.h"
#import "Merchan.h"
#import "NetworkTool.h"
@interface settinhHeaderViewController ()<UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UIView *bgView;
    UITextField *username;       //昵称
    NSString *imgUrl;                 //图片地址
}
@property (nonatomic, strong) UIButton *head; //头像
@end

@implementation settinhHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
    [self createTextFields];
}

- (void)viewWillAppear:(BOOL)animated {
    self.title = @"注册 3/3";
    self.view.backgroundColor = [UIColor colorWithRed:240 / 255.0f green:240 / 255.0f blue:240 / 255.0f alpha:1];
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain
                                                              target:self action:@selector(clickaddBtn)];
    [addBtn setImage:[UIImage imageNamed:@"goback_back_orange_on"]];
    [addBtn setImageInsets:UIEdgeInsetsMake(0, -15, 0, 15)];
    addBtn.tintColor = [UIColor colorWithRed:248 / 255.0f green:144 / 255.0f blue:34 / 255.0f alpha:1];
    [self.navigationItem setLeftBarButtonItem:addBtn];
}

//点击屏幕空白处去掉键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)createTextFields
{
    CGRect frame = [UIScreen mainScreen].bounds;
    bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 270, frame.size.width, 50)];
    //bgView.layer.cornerRadius=3.0;
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];

    username = [self createTextFielfFrame:CGRectMake(10, 10, self.view.frame.size.width - 20, 30) font:[UIFont
                                                                                                        systemFontOfSize:14] placeholder:@"请输入昵称"];
    username.textAlignment = UITextAlignmentCenter;
    username.clearButtonMode = UITextFieldViewModeWhileEditing;

    UIButton *landBtn = [self createButtonFrame:CGRectMake(10,
                                                           bgView.frame.size.height + bgView.frame.origin.y + 30, self.view.frame.size.width - 20, 37) backImageName:nil
                                          title:@"完成" titleColor:[UIColor whiteColor]    font:[UIFont systemFontOfSize:17] target:self
                                         action:@selector(landClick)];
    landBtn.backgroundColor = [UIColor colorWithRed:248 / 255.0f green:144 / 255.0f blue:34 / 255.0f alpha:1];
    landBtn.layer.cornerRadius = 5.0f;

    [bgView addSubview:username];

    [self.view addSubview:landBtn];
}

//点击完成按钮
- (void)landClick
{
    [SVProgressHUD show];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
//        parameters[@"account"] = self.phone;
    parameters[@"nickName"] = username.text;
    parameters[@"profile"] = imgUrl;
//        parameters[@"password"] = [self.passWard tokenByPassword];
    [[NetworkTool shareInstance] requireMethodType:POSTType URLString:@"User/register"
                                        parameters:parameters success:^(NSDictionary *respondDictionary) {
        if ([respondDictionary[@"result"] isEqualToString:@"0"]) {
            [SVProgressHUD dismiss];
            [SVProgressHUD showErrorWithStatus:@"该号码没有员工在使用"];
        } else if ([respondDictionary[@"result"] isEqualToString:@"1"]) {
            [SVProgressHUD dismiss];
            [SVProgressHUD showSuccessWithStatus:@"注册成功"];
        } else {
            [SVProgressHUD dismiss];
            [SVProgressHUD showErrorWithStatus:@"该账号已经注册"];
        }
        [self.navigationController pushViewController:[[LoginViewController alloc]init] animated:YES];
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:@"服务器连接失败，请确保设备是否联网"];
    }];
}

- (UITextField *)createTextFielfFrame:(CGRect)frame font:(UIFont *)font placeholder:(NSString *)placeholder
{
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];

    textField.font = font;

    textField.textColor = [UIColor grayColor];

    textField.borderStyle = UITextBorderStyleNone;

    textField.placeholder = placeholder;

    return textField;
}

- (UIImageView *)createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName color:(UIColor
                                                                                           *)color
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    if (imageName) {
        imageView.image = [UIImage imageNamed:imageName];
    }
    if (color) {
        imageView.backgroundColor = color;
    }

    return imageView;
}

- (UIButton *)createButtonFrame:(CGRect)frame backImageName:(NSString *)imageName title:(NSString *)title
                     titleColor:(UIColor *)color font:(UIFont *)font target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    if (imageName) {
        [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }

    if (font) {
        btn.titleLabel.font = font;
    }

    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    if (color) {
        [btn setTitleColor:color forState:UIControlStateNormal];
    }
    if (target && action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return btn;
}

- (void)clickaddBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)createUI
{
    UIImageView *bg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250)];
    [bg setImage:[UIImage imageNamed:@"mycenter_bg.png"]];
    bg.backgroundColor = [UIColor grayColor];
    [self.view addSubview:bg];

    _head = [[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 80) / 2, 110, 80, 80)];
    [_head setImage:[UIImage imageNamed:@"head"] forState:UIControlStateNormal];
    _head.layer.cornerRadius = 40;
    _head.layer.masksToBounds = YES;
    _head.backgroundColor = [UIColor whiteColor];
    [_head addTarget:self action:@selector(changeHeadView1:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_head];

    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 80) / 2, 180, 80, 80)];
    label.text = @"点击设置头像";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:label];
}

- (void)changeHeadView1:(UIButton *)tap
{
    UIActionSheet *menu = [[UIActionSheet alloc] initWithTitle:@"更改图像" delegate:self
                                             cancelButtonTitle   :@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"从相册上传", nil];
    menu.delegate = self;
    menu.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [menu showInView:self.view];
}

//*************************代理方法*******************************
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //NSLog(@"index:%zd",buttonIndex);
    //0->拍照，1->相册
    if (buttonIndex == 0) {
        [self snapImage];
    } else if (buttonIndex == 1) {
        [self localPhoto];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary
                                                                                               *)info
{
    //完成选择
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    //NSLog(@"type:%@",type);
    if ([type isEqualToString:@"public.image"]) {
        //获取照片的原图
        //UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        //获取图片裁剪的图
        UIImage *edit = [info objectForKey:UIImagePickerControllerEditedImage];
        //关闭相册界面
        [picker dismissViewControllerAnimated:YES completion:^{
            //设置头像
            [_head setImage:edit forState:UIControlStateNormal];
            //上传头像
            [self updatePhoto:edit];
        }];
    }
}

#pragma mark --头像上传
- (void)updatePhoto:(UIImage *)myImage
{
    //创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *ip = [NSString stringWithFormat:@"%@User/uploadProfile", BASE_URL];

    [manager POST:ip parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>    _Nonnull
                                                                formData)
    {
        UIImage *image = myImage;
        NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
        //使用 formData 拼接数据
        /*  方法一:

                         */
        [formData appendPartWithFileData:imageData name:@"profile" fileName:@"123.jpg"
                                mimeType:@"image/jpg"];
        //方法二:
        //[formData appendPartWithFileURL:[NSURL fileURLWithPath:@""] name:@"file" fileName:[@"xxx.png" mimeType:@"image/png" error:nil];
        //方法三:
        //[formData appendPartWithFileURL:[NSURL fileURLWithPath:@""] name:@"file" error:nil];
    }
         progress:^(NSProgress *_Nonnull uploadProgress) {
        NSLog(@"%f", 1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
    }
          success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        NSLog(@"上传成功.%@", responseObject);
        //将上传头像的地址保存下来
        imgUrl = responseObject[@"result"];
    }
          failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        NSLog(@"上传失败.%@", error);
    }];
}

//*****************************拍照**********************************
- (void)snapImage
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        __block UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
        ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
        ipc.delegate = self;
        ipc.allowsEditing = YES;
        ipc.navigationBar.barTintColor = [UIColor whiteColor];
        ipc.navigationBar.tintColor = [UIColor whiteColor];
        ipc.navigationBar.titleTextAttributes = @{ NSForegroundColorAttributeName: [UIColor whiteColor] };
        [self presentViewController:ipc animated:YES completion:^{
            ipc = nil;
        }];
    } else {
        NSLog(@"模拟器无法打开照相机");
    }
}

#define CommonThimeColor HEXCOLOR(0x11a0ee)
- (void)localPhoto
{
    __block UIImagePickerController *picker = [[UIImagePickerController alloc] init];

    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
    picker.navigationBar.barTintColor = [UIColor whiteColor];
    picker.navigationBar.tintColor = [UIColor blackColor];
    picker.navigationBar.titleTextAttributes = @{ NSForegroundColorAttributeName: [UIColor blackColor] };
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^{
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
