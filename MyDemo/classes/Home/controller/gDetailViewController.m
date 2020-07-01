#import "gDetailViewController.h"
#import <Social/Social.h>
#import "NetworkTool.h"

#import "SVProgressHUD+LAN.h"
#import <BMKLocationkit/BMKLocationComponent.h>
#import "UIImageView+WebCache.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AppraiseViewController.h"

@interface gDetailViewController
()< UITableViewDataSource, CLLocationManagerDelegate, MKMapViewDelegate>
{
    MKMapView *myMapView;
    CLLocationManager *mylm;
}
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *shopAddress;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *shopPhone;
//@property (weak, nonatomic) IBOutlet UILabel *label;
@property NSMutableArray *allDataSourceArr;
@property NSString *string2;
@property Float32 shopLatitude;
@property Float32 shopLongitude;
/*  展示结果的 数据源  */
@property (nonatomic, strong) NSMutableArray *dataSourceArr;
@end
@implementation gDetailViewController
- (instancetype)init {
    self = [self initWithModel:nil];
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
//    self.ta
    [super viewWillAppear:animated];
    [self.tabBarController.navigationController.navigationBar setHidden:YES];
}



- (instancetype)initWithModel:(GoodsModel *)model {
    self = [super init];
    if (self && model != nil) {
        self.model = model;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = leftItem;
//    [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"goback_back_orange_on"] style:(UIBarButtonItemStylePlain) target:self action:@selector(back)];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage
                                                                                     imageNamed:@"Share"] style:(UIBarButtonItemStylePlain) target:self action:@selector(share)];
    myMapView.showsUserLocation = YES;
    self.renjun.text = self.model.shopPhone;
    self.introduce.text = self.model.shopDesc;
    //        self.label.text = self.model.shopPhone;
    self.shopName.text = self.model.shopName;
    self.shopPhone.text = self.model.shopPhone;
    self.shopLongitude = [self.model.shopLogitude floatValue];
    self.shopLatitude = [self.model.shopLogitude floatValue];
//        [self loadInfoArray];

    //self.navigationController.navigationBar.hidden=YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)loadInfoArray
{
    //清空会议列表
    self.allDataSourceArr = [[NSMutableArray alloc] init];
    self.dataSourceArr = [[NSMutableArray alloc] init];
    //访问网络
    NSString *sNumber = [NSString stringWithFormat:@"%ld", self.shopId];
//          NSDictionary *parameters = @{@"shopId":sNumber};
    NSString *string3 = [NSString
                         stringWithFormat:@"%@%@", @"shopsById/", sNumber];

    [[NetworkTool shareInstance] requireMethodType:GETType URLString:string3 parameters:nil
                                           success:^(NSDictionary *respondDictionary) {
//        NSLog(@"%@", respondDictionary);
//        if ([respondDictionary[@"result"] isEqualToString:@"0"]) {
        for (NSDictionary *dic in respondDictionary[@"data"]) {
            self.renjun.text = dic[@"shopTime"];
            self.introduce.text = dic[@"shopDesc"];
//            self.label.text = dic[@"shopName"];
            self.shopPhone.text = dic[@"shopPhone"];
            self.shopAddress.text = dic[@"shopAddress"];
            self.shopLongitude = [dic[@"shopLongitude"]floatValue];
            self.shopLatitude = [dic[@"shopLatitude"]floatValue];
//                NSURL *url = [NSURL URLWithString:dic[@"shopImage"]];
//                UIImage *image1 = [UIImage imageNamed:[NSString stringWithFormat:@"2"]];
//                [self.image sd_setImageWithURL:url placeholderImage:image1];

            self.model = [GoodsModel yy_modelWithDictionary:dic];
//            self.shopId = self.model.shopId;
//
//            }
        }
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"请求网络失败"];
    }];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //  需要注意的是请在  SDK  任何类的初始化以及方法调用之前设置正确的  AK
    [[BMKLocationAuth sharedInstance] checkPermisionWithKey:@"xoqpkHkUVqfG7Lk0ouda02qis72oZhZl"
                                               authDelegate:self];
    return YES;
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
       [self.tabBarController.navigationController.navigationBar setHidden:NO];
}



- (IBAction)appraise:(id)sender
{
    AppraiseViewController *activityController = [[AppraiseViewController alloc]init];
    activityController.shopId = self.model.shopId;
    [self.navigationController pushViewController:activityController animated:YES];
}

- (void)share
{
    NSArray *images = @[@"http://boilinggame.cn/liu/4.jpg"];
    UIActivityViewController *activityController = [[UIActivityViewController alloc]initWithActivityItems:images
                                                                                    applicationActivities:nil];
    [self.navigationController presentViewController:activityController animated:YES completion:nil];
}

- (IBAction)local:(id)sender
{
    mylm = [[CLLocationManager alloc]init];
    mylm.delegate = self;
    mylm.desiredAccuracy = kCLLocationAccuracyBest;
    mylm.distanceFilter = 10.0f;
    mylm.showsBackgroundLocationIndicator = YES;
    [mylm startUpdatingLocation];
    myMapView = [[MKMapView alloc]initWithFrame:self.view.bounds];
    myMapView.delegate = self;
    myMapView.showsUserLocation = YES;
    myMapView.mapType = MKMapTypeStandard;
    [self.view addSubview:myMapView];
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(self.shopLatitude, self.shopLongitude);
    MKPointAnnotation *anno = [[MKPointAnnotation alloc]init];
    anno.coordinate = coordinate;
//    anno.title = self.label.text;
    anno.subtitle = self.shopAddress.text;
    [myMapView addAnnotation:anno];
    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
    MKCoordinateRegion regoin = MKCoordinateRegionMake(coordinate, span);
    [myMapView setRegion:regoin animated:YES];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(nonnull NSError *)error
{
    [manager stopUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
