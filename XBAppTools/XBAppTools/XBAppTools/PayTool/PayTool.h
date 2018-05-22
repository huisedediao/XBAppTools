////
////  PayTool.h
////  AnXin
////
////  Created by 谢贤彬 on 2018/2/26.
////  Copyright © 2018年 xxb. All rights reserved.
////
//
//#import <Foundation/Foundation.h>
//#import <WXApi.h>
//#import <AlipaySDK/AlipaySDK.h>
//
//typedef enum : NSUInteger {
//    WeChatPayResult_success = 1,    //成功
//    WeChatPayResult_cancel,         //中途取消
//    WeChatPayResult_failure         //失败
//} WeChatPayResult;
//
//typedef enum : NSUInteger {
//    AliPayResult_success = 9000,    //成功
//    AliPayResult_processing = 8000, //正在处理中
//    AliPayResult_failure = 4000,    //订单支付失败
//    AliPayResult_cancel = 6001,     //用户中途取消
//    AliPayResult_netError = 6002    //网络连接出错
//} AliPayResult;
//
//@interface PayTool : NSObject <WXApiDelegate>
//
//+ (instancetype)shared;
//
///*
// 在PayVC中通过接口获取支付信息
// 然后调起微信客户端：(这里的数据wechatPayDic一定是server经过二次签名的)
// */
//- (void)weiXinPayWithDic:(NSDictionary *)wechatPayDic;
//
/////阿里支付，orderString为服务器签名后的订单字符串
//- (void)alipayWithOrderString:(NSString *)orderString;
/////处理阿里支付的结果
//- (void)handleAlipayResult:(NSDictionary *)resultDic;
//
//@end

