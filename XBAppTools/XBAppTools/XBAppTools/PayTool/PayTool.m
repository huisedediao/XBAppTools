////
////  PayTool.m
////  AnXin
////
////  Created by 谢贤彬 on 2018/2/26.
////  Copyright © 2018年 xxb. All rights reserved.
////
//
//#import "PayTool.h"
//
//@implementation PayTool
//
//+ (instancetype)shared
//{
//    return [self new];
//}
//+ (instancetype)allocWithZone:(struct _NSZone *)zone
//{
//    static id tool = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        tool = [super allocWithZone:zone];
//    });
//    return tool;
//}
//- (instancetype)init
//{
//    if (self = [super init])
//    {
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//
//        });
//    }
//    return self;
//}
//
//
//#define weChatPay_openID        @"openID"
//#define weChatPay_partnerId     @"partnerId"
//#define weChatPay_prepayId      @"prepayId"
//#define weChatPay_package       @"package"
//#define weChatPay_nonceStr      @"nonceStr"
//#define weChatPay_timeStamp     @"timeStamp"
//#define weChatPay_sign          @"sign"
//
//
//#pragma mark - 微信支付
///*
// 在PayVC中通过接口获取支付信息                                       
// 然后调起微信客户端：(这里的数据wechatPayDic一定是server经过二次签名的)
// */
//- (void)weiXinPayWithDic:(NSDictionary *)wechatPayDic
//{
//    PayReq *req = [[PayReq alloc] init];
//    req.openID = [wechatPayDic objectForKey:@"appid"];
//    req.partnerId = wechatPayDic[@"partnerid"];
//    req.prepayId = [wechatPayDic objectForKey:@"prepayid"];
//    req.package = [wechatPayDic objectForKey:@"package_rname"];
//    req.nonceStr = [wechatPayDic objectForKey:@"noncestr"];
//    NSString *time = [wechatPayDic objectForKey:@"timestamp"];
//    req.timeStamp = [[time substringToIndex:10] intValue];
//    req.sign = [wechatPayDic objectForKey:@"sign"];
//    NSLog(@"调用微信支付");
//    [WXApi sendReq:req];
//}
//
//
//// 微信支付返回结果回调
//- (void)onResp:(BaseResp *)resp
//{
//    if ([resp isKindOfClass:[PayResp class]])
//    {
//        PayResp *response = (PayResp *)resp;
//        [self managerDidRecvPaymentResponse:response];
//    }
//}
//- (void)managerDidRecvPaymentResponse:(PayResp *)response
//{
//    switch (response.errCode)
//    {
//        case WXSuccess:
//        {
//            ///向服务器确认支付结果
//            [[NSNotificationCenter defaultCenter] postNotificationName:XBNotice_weChatPayResult object:@(WeChatPayResult_success)];
//        }
//            break;
//
//        case WXErrCodeUserCancel:
//        {
//            //展示提示 "中途取消"
//            [[NSNotificationCenter defaultCenter] postNotificationName:XBNotice_weChatPayResult object:@(WeChatPayResult_cancel)];
//        }
//            break;
//
//        default:
//        {
//            //展示提示 "支付失败"
//            [[NSNotificationCenter defaultCenter] postNotificationName:XBNotice_weChatPayResult object:@(WeChatPayResult_failure)];
//        }
//            break;
//    }
//}
//
///*
// 处理回调结果
// _delegate_WXApiPay 代理中处理结果
// 
// 可能遇见的问题：
// 1.系统版本大于等于iOS9的，调起微信客户端之后，可以直接点击状态栏左侧按钮返回，这时是不走回调方法的。
// 这样在支付成功之后，不走回调方法，就无法知道支付状态，当前页面无法给出提示。
// 解决方案是，在AppDelegate.m的applicationWillEnterForeground方法中，调用查询支付结果接口然后刷新当然页面。需要设置bool变量作为标志，否则每次应用进入前台都去查询，就不符合业务要求了。
// 2. 进入微信支付页面之后，不做操作，切换到自己应用中，退出当前支付页面，然后再进入微信客户端点击支付或者取消，此时自己的应用会崩溃闪退
// 原因是退出页面后页面已经出栈被销毁，但wx回调时还是去调用其中的代理方法，就会出现野指针。
// 解决方法是，在页面的viewWillDisappear方法中加入[PaymentManager sharedManager].delegate = nil;。
// 
// */
//
//
//#pragma mark - 阿里支付
/////阿里支付，orderString为服务器签名后的订单字符串
//- (void)alipayWithOrderString:(NSString *)orderString
//{
//    NSString *appScheme = @"alipayAxycIos";
//    // NOTE: 调用支付结果开始支付
//    [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
//
//        ///这个回调不知道为啥不跑，在APPdelegate的回调中，用下面这个方法处理 - (void)handleAlipayResult:(NSDictionary *)result
//        AliPayResult result = [resultDic[@"resultStatus"] integerValue];
//        [[NSNotificationCenter defaultCenter] postNotificationName:XBNotice_aliPayResult object:@(result)];
//        NSLog(@"reslut = %@",resultDic);
//    }];
//}
/////处理阿里支付的结果
//- (void)handleAlipayResult:(NSDictionary *)resultDic
//{
//    AliPayResult result = [resultDic[@"resultStatus"] integerValue];
//    [[NSNotificationCenter defaultCenter] postNotificationName:XBNotice_aliPayResult object:@(result)];
//}
//
//@end

