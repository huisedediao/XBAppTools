////
////  MapTool_GD.h
////  AnXin
////
////  Created by 谢贤彬 on 2018/2/27.
////  Copyright © 2018年 xxb. All rights reserved.
////
//
//#import <Foundation/Foundation.h>
//#import <AMapLocationKit/AMapLocationKit.h>
//#import <AMapSearchKit/AMapSearchKit.h>
//#import "AMapLocationModel.h"
//#import <MAMapKit/MAMapKit.h>
//
//typedef void (^SearchAddressSuccessBlock)(AMapGeocodeSearchResponse *response);
//typedef void (^SearchLocationSuccessBlock)(AMapReGeocodeSearchResponse *response);
//typedef void (^SearchKeywordSuccessBlock)(AMapPOISearchResponse *response);
//typedef void (^SearchInputTipsSuccessBlock)(AMapInputTipsSearchResponse *response);
//
//typedef void (^SearchFailureBlock)(NSError *error);
//
//@interface MapTool_GD : NSObject
//
/////当前定位地址
//@property (nonatomic,copy,readonly) NSString *str_currentLocation;
//@property (nonatomic, strong) AMapReGeocode *currentRegeocode;
//@property (nonatomic, strong) CLLocation *currentCALocation;
//
//
//+ (instancetype)shared;
//
//+ (BOOL)locationServicesEnabled;
//- (void)checkLocationService;
//
/////获取定位信息
//- (void)startSerialLocation;
//
//
/////搜索地址（根据地址，获取坐标）,精确搜索
//- (void)searchAddress:(NSString *)address completeBlock:(SearchAddressSuccessBlock)completeBlock failureBlock:(SearchFailureBlock)failureBlock;
/////搜索坐标（根据坐标，获取地址）,精确搜索
//- (void)searchLocation:(CLLocationCoordinate2D)coordinate completeBlock:(SearchLocationSuccessBlock)completeBlock failureBlock:(SearchFailureBlock)failureBlock;
/////关键词搜索
//- (void)searchKeyword:(NSString *)keyword city:(NSString *)city completeBlock:(SearchKeywordSuccessBlock)completeBlock failureBlock:(SearchFailureBlock)failureBlock;
/////获取输入提示，如：输入“方恒”，提示“方恒国际中心A座”，“方恒购物中心”等
//- (void)searchInputTipsKeyword:(NSString *)keyword city:(NSString *)city completeBlock:(SearchInputTipsSuccessBlock)completeBlock failureBlock:(SearchFailureBlock)failureBlock;
//
/////获取地图中心点的坐标
//- (CLLocationCoordinate2D)getCenterCoordinateForMapview:(MAMapView *)mapView;
//
/////获取两个2D坐标间的直线距离
//- (double)getDistanceWithCoordinateOne:(CLLocationCoordinate2D)coordinateOne coordinateTwo:(CLLocationCoordinate2D)coordinateTwo;
/////获取输入坐标与当前定位位置的距离
//- (double)getDistanceBetweenCurrentLocationAndCoordinate:(CLLocationCoordinate2D)coordinate;
//@end

