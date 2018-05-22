////
////  MapTool_GD.m
////  AnXin
////
////  Created by 谢贤彬 on 2018/2/27.
////  Copyright © 2018年 xxb. All rights reserved.
////
//
//#import "MapTool_GD.h"
//
//@interface MapTool_GD ()<AMapLocationManagerDelegate,AMapSearchDelegate>
//
/////定位
//@property (nonatomic,strong) AMapLocationManager *locationManager;
//
/////搜索
//@property (nonatomic,strong) AMapSearchAPI *search;
//@property (nonatomic,copy) SearchAddressSuccessBlock bl_searchAddressSuccess;
//@property (nonatomic,copy) SearchFailureBlock bl_searchAddressFailure;
//@property (nonatomic,copy) SearchLocationSuccessBlock bl_searchLocationSuccess;
//@property (nonatomic,copy) SearchFailureBlock bl_searchLocationFailure;
//@property (nonatomic,copy) SearchKeywordSuccessBlock bl_searchKeywordSuccess;
//@property (nonatomic,copy) SearchFailureBlock bl_searchKeywordFailure;
//@property (nonatomic,copy) SearchInputTipsSuccessBlock bl_searchInputTipsSuccess;
//@property (nonatomic,copy) SearchFailureBlock bl_searchInputTipsFailure;
//
/////正在搜索地名（把地名转换为坐标）
//@property (nonatomic,assign) BOOL isSearchAddress;
/////正在搜索坐标（把坐标转换为地名）
//@property (nonatomic,assign) BOOL isSearchLocation;
/////正在搜索关键字
//@property (nonatomic,assign) BOOL isSearchKeyword;
//
//
//
//
//@end
//
//@implementation MapTool_GD
//
//+ (BOOL)locationServicesEnabled
//{
//    //判断定位是否开启
//    if ([CLLocationManager locationServicesEnabled])
//    {
//        //  判断用户是否允许程序获取位置权限
//        if ([CLLocationManager authorizationStatus]==kCLAuthorizationStatusAuthorizedWhenInUse||[CLLocationManager authorizationStatus]==kCLAuthorizationStatusAuthorizedAlways)
//        {
//            //用户允许获取位置权限
//            return YES;
//        }else
//        {
//            //用户拒绝开启用户权限
////            UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"打开[定位服务权限]来允许[XXX]确定您的位置" message:@"请在系统设置中开启定位服务(设置>隐私>定位服务>开启)" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"去设置", nil];
////            alertView.delegate=self;
////            alertView.tag=2;
////            [alertView show];
//            return NO;
//        }
//    }
//    else
//    {
////        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"打开[定位服务]来允许[XXX]确定您的位置" message:@"请在系统设置中开启定位服务(设置>隐私>定位服务>XXX>始终)" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"去设置", nil];
////        alertView.delegate=self;
////        alertView.tag=1;
////        [alertView show];
//        return NO;
//    }
//}
//
//+ (instancetype)shared
//{
//    return [self new];
//}
//
//+ (instancetype)allocWithZone:(struct _NSZone *)zone
//{
//    static MapTool_GD *tool = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        tool = [super allocWithZone:zone];
//    });
//    return tool;
//}
//
//- (instancetype)init
//{
//    if (self = [super init])
//    {
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            [self startSerialLocation];
//            ///搜索
//            self.search = [[AMapSearchAPI alloc] init];
//            self.search.delegate = self;
//        });
//    }
//    return self;
//}
//
//#pragma mark - 方法重写
//- (NSString *)str_currentLocation
//{
//    if (self.currentRegeocode)
//    {
//        if (self.currentRegeocode.aois.count)
//        {
//            if (self.currentRegeocode.aois[0].name.length)
//            {
//                return self.currentRegeocode.aois[0].name;
//            }
//        }
//        return self.currentRegeocode.formattedAddress;
//    }
//    else
//    {
//        return XBText_正在定位;
//    }
//}
//
//#pragma mark - 其他方法
/////获取地图中心点的坐标
//- (CLLocationCoordinate2D)getCenterCoordinateForMapview:(MAMapView *)mapView
//{
//    CLLocationCoordinate2D centerCoordinate = mapView.region.center;
//    return centerCoordinate;
//}
//
//#pragma mark - 定位相关
//- (AMapLocationManager *)locationManager
//{
//    if (_locationManager == nil)
//    {
//        _locationManager = [[AMapLocationManager alloc] init];
//
//        [_locationManager setDelegate:self];
//
//        [_locationManager setPausesLocationUpdatesAutomatically:NO];
//
//        [_locationManager setAllowsBackgroundLocationUpdates:NO];
//    }
//    return _locationManager;
//}
//
//- (void)checkLocationService
//{
//    if ([MapTool_GD locationServicesEnabled])
//    {
//        //        //配置高德地图key
//        //        [AMapServices sharedServices].apiKey = XBText_AMapServices_APiKEY;
//        //
//        //        //开始定位
//        //        [[MapTool_GD shared] startSerialLocation];
//        //        //    [[MapTool_GD shared] locateAction];
//    }
//    else
//    {
//        XBAlertView *alertView = [[XBAlertView alloc]initWithTitle:XBText_定位服务未开启 message:XBText_打开定位服务提示 delegate:self cancelButtonTitle:XBText_取消 otherButtonTitles:@[XBText_立即开启]];
//        [alertView showUsingBlock:^(XBAlertView *alertView, NSInteger index) {
//            if (index == 1)
//            {
//                //跳转到定位权限页面
//                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
//                if( [[UIApplication sharedApplication]canOpenURL:url] ) {
//                    [[UIApplication sharedApplication] openURL:url];
//                }
//            }
//        }];
//    }
//}
//
//- (void)amapLocationManager:(AMapLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
//{
//    if (status != kCLAuthorizationStatusNotDetermined)
//    {
//        [self startSerialLocation];
//    }
//    else
//    {
////        if ([AppTool firstRequestLocationService] == NO)
////        {
////            XBAlertView *alertView = [[XBAlertView alloc]initWithTitle:XBText_定位服务未开启 message:XBText_打开定位服务提示 delegate:self cancelButtonTitle:XBText_取消 otherButtonTitles:@[XBText_立即开启]];
////            [alertView showUsingBlock:^(XBAlertView *alertView, NSInteger index) {
////                if (index == 1)
////                {
////                    //跳转到定位权限页面
////                    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
////                    if( [[UIApplication sharedApplication]canOpenURL:url] ) {
////                        [[UIApplication sharedApplication] openURL:url];
////                    }
////                }
////            }];
////        }
//        [AppTool setNotFirstRequestLocationService];
//    }
//    return;
////        switch (status) {
////            case kCLAuthorizationStatusNotDetermined:
////            {
////                NSLog(@"用户还未决定授权");
////                break;
////            }
////            case kCLAuthorizationStatusRestricted:
////            {
////                NSLog(@"访问受限");
////                break;
////            }
////            case kCLAuthorizationStatusDenied:
////            {
////                // 类方法，判断是否开启定位服务
////                if ([CLLocationManager locationServicesEnabled]) {
////                    NSLog(@"定位服务开启，被拒绝");
////                } else {
////                    NSLog(@"定位服务关闭，不可用");
////                }
////                break;
////            }
////            case kCLAuthorizationStatusAuthorizedAlways:
////            {
////                NSLog(@"获得前后台授权");
////                break;
////            }
////            case kCLAuthorizationStatusAuthorizedWhenInUse:
////            {
////                NSLog(@"获得前台授权");
////                break;
////            }
////            default:
////                break;
////        }
//}
//
//
//- (void)startSerialLocation
//{
//    //开始定位
//    [self.locationManager startUpdatingLocation];
//}
//
//- (void)stopSerialLocation
//{
//    //停止定位
//    [self.locationManager stopUpdatingLocation];
//}
//
//- (void)amapLocationManager:(AMapLocationManager *)manager didFailWithError:(NSError *)error
//{
//    //定位错误
//    NSLog(@"%s, amapLocationManager = %@, error = %@", __func__, [manager class], error);
//}
//
//- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location
//{
//    NSLog(@"定位结果111");
//    //定位结果
//    NSLog(@"location:{lat:%f; lon:%f; accuracy:%f}", location.coordinate.latitude, location.coordinate.longitude, location.horizontalAccuracy);
//    self.currentCALocation = location;
//    WEAK_SELF
//    [self searchLocation:location.coordinate completeBlock:^(AMapReGeocodeSearchResponse *response) {
//        weakSelf.currentRegeocode = response.regeocode;
//        NSLog(@"%@",response.regeocode);
//        [[NSNotificationCenter defaultCenter] postNotificationName:XBNotice_getCurrentLocation object:location];
//    } failureBlock:^(NSError *error) {
//        NSLog(@"定位失败，错误：%@",error);
//    }];
//    [self stopSerialLocation];
//}
//
////- (void)locateAction
////{
////    NSLog(@"定位结果222");
////    //带逆地理的单次定位
////    [self.locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
////
////        if (error)
////        {
////            NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
////
////            if (error.code == AMapLocationErrorLocateFailed)
////            {
////                return;
////            }
////        }
////
////        self.locationModel.location = location;;
////
////        //定位信息
////        NSLog(@"location:%@", location);
////
////        //逆地理信息
////        if (regeocode)
////        {
////            NSLog(@"reGeocode:%@", regeocode);
////            self.str_currentLocation = regeocode.POIName;
////            self.locationModel.regeocode = regeocode;
////            [[NSNotificationCenter defaultCenter] postNotificationName:XBNotice_getCurrentLocation object:nil];
////        }
////    }];
////}
//
//#pragma mark - 地理编码
/////搜索地址（根据地址，获取坐标）,精确搜索
//- (void)searchAddress:(NSString *)address completeBlock:(SearchAddressSuccessBlock)completeBlock failureBlock:(SearchFailureBlock)failureBlock
//{
//    if (self.isSearchAddress == YES)
//    {
//        NSLog(@"正在搜索地址，请稍后重试");
//        return;
//    }
//    self.isSearchAddress = YES;
//    self.bl_searchAddressSuccess = completeBlock;
//    self.bl_searchAddressFailure = failureBlock;
//    AMapGeocodeSearchRequest *geo = [[AMapGeocodeSearchRequest alloc] init];
//    geo.address = address;
////    geo.address = @"杭州市西湖区山水人家";
//    [self.search AMapGeocodeSearch:geo];
//}
/////搜索坐标（根据坐标，获取地址）,精确搜索
//- (void)searchLocation:(CLLocationCoordinate2D)coordinate completeBlock:(SearchLocationSuccessBlock)completeBlock failureBlock:(SearchFailureBlock)failureBlock
//{
//    if (self.isSearchLocation == YES)
//    {
//        NSLog(@"正在搜索坐标，请稍后重试");
//        return;
//    }
//    self.isSearchLocation = YES;
//    self.bl_searchLocationFailure = failureBlock;
//    self.bl_searchLocationSuccess = completeBlock;
//    AMapReGeocodeSearchRequest *regeo = [[AMapReGeocodeSearchRequest alloc] init];
//    regeo.location = [AMapGeoPoint locationWithLatitude:coordinate.latitude longitude:coordinate.longitude];
//    regeo.requireExtension = YES;
//    [self.search AMapReGoecodeSearch:regeo];
//}
/////关键词搜索
//- (void)searchKeyword:(NSString *)keyword city:(NSString *)city completeBlock:(SearchKeywordSuccessBlock)completeBlock failureBlock:(SearchFailureBlock)failureBlock
//{
//    if (self.isSearchKeyword == YES)
//    {
//        NSLog(@"正在搜索关键字，请稍后重试");
//        return;
//    }
//    self.isSearchKeyword = YES;
//    self.bl_searchKeywordFailure = failureBlock;
//    self.bl_searchKeywordSuccess = completeBlock;
//    AMapPOIKeywordsSearchRequest *request = [[AMapPOIKeywordsSearchRequest alloc] init];
//
//    request.keywords            = keyword;
//    request.city                = city;
////    request.types               = @"高等院校";
//    request.requireExtension    = YES;
//
//    /*  搜索SDK 3.2.0 中新增加的功能，只搜索本城市的POI。*/
//    request.cityLimit           = YES;
//    request.requireSubPOIs      = YES;
//    [self.search AMapPOIKeywordsSearch:request];
//}
/////获取输入提示，如：输入“方恒”，提示“方恒国际中心A座”，“方恒购物中心”等
//- (void)searchInputTipsKeyword:(NSString *)keyword city:(NSString *)city completeBlock:(SearchInputTipsSuccessBlock)completeBlock failureBlock:(SearchFailureBlock)failureBlock
//{
//    self.bl_searchInputTipsSuccess = completeBlock;
//    self.bl_searchInputTipsFailure = failureBlock;
//    AMapInputTipsSearchRequest *tips = [[AMapInputTipsSearchRequest alloc] init];
//    tips.keywords = keyword;
//    tips.city     = city;
//    tips.cityLimit = YES; //是否限制城市
//    [self.search AMapInputTipsSearch:tips];
//}
/////获取两个2D坐标间的直线距离
//- (double)getDistanceWithCoordinateOne:(CLLocationCoordinate2D)coordinateOne coordinateTwo:(CLLocationCoordinate2D)coordinateTwo
//{
//    //1.将两个经纬度点转成投影点
//    MAMapPoint point1 = MAMapPointForCoordinate(coordinateOne);
//    MAMapPoint point2 = MAMapPointForCoordinate(coordinateTwo);
//    //2.计算距离
//    CLLocationDistance distance = MAMetersBetweenMapPoints(point1,point2);
//    return distance;
//}
/////获取输入坐标与当前定位位置的距离
//- (double)getDistanceBetweenCurrentLocationAndCoordinate:(CLLocationCoordinate2D)coordinate
//{
//    return [self getDistanceWithCoordinateOne:self.currentCALocation.coordinate coordinateTwo:coordinate];
//}
//
//
//#pragma mark - AMapSearchDelegate
/////地理编码回调
//- (void)onGeocodeSearchDone:(AMapGeocodeSearchRequest *)request response:(AMapGeocodeSearchResponse *)response
//{
//    if (response.geocodes.count != 0)
//    {
//        if (self.bl_searchAddressSuccess)
//        {
//            self.bl_searchAddressSuccess(response);
//        }
//    }
//    self.isSearchAddress = NO;
//}
/////逆地理编码回调
//- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response
//{
//    if (response.regeocode != nil)
//    {
//        if (self.bl_searchLocationSuccess)
//        {
//            self.bl_searchLocationSuccess(response);
//        }
//    }
//    self.isSearchLocation = NO;
//}
///// POI 关键字 搜索回调
//- (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response
//{
//    if (response.pois.count == 0)
//    {
//        return;
//    }
//
//    if (self.bl_searchKeywordSuccess)
//    {
//        self.bl_searchKeywordSuccess(response);
//    }
//    self.isSearchKeyword = NO;
//}
///* 输入提示回调. */
//- (void)onInputTipsSearchDone:(AMapInputTipsSearchRequest *)request response:(AMapInputTipsSearchResponse *)response
//{
//    //解析response获取提示词，具体解析见 Demo
//    if (self.bl_searchInputTipsSuccess)
//    {
//        self.bl_searchInputTipsSuccess(response);
//    }
//}
//
/////搜索失败
//- (void)AMapSearchRequest:(id)request didFailWithError:(NSError *)error
//{
//    NSLog(@"Error: %@", error);
//
//    if ([request isKindOfClass:[AMapGeocodeSearchRequest class]])
//    {
//        if (self.bl_searchAddressFailure)
//        {
//            self.bl_searchAddressFailure(error);
//        }
//        self.isSearchAddress = NO;
//    }
//
//    if ([request isKindOfClass:[AMapReGeocodeSearchRequest class]])
//    {
//        if (self.bl_searchLocationFailure)
//        {
//            self.bl_searchLocationFailure(error);
//        }
//        self.isSearchLocation = NO;
//    }
//
//    if ([request isKindOfClass:[AMapPOIKeywordsSearchRequest class]])
//    {
//        if (self.bl_searchKeywordFailure)
//        {
//            self.bl_searchKeywordFailure(error);
//        }
//        self.isSearchKeyword = NO;
//    }
//
//    if ([request isKindOfClass:[AMapInputTipsSearchRequest class]])
//    {
//        if (self.bl_searchInputTipsFailure)
//        {
//            self.bl_searchInputTipsFailure(error);
//        }
//    }
//}
//@end

