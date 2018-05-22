////
////  UMTool.m
////  AnXin
////
////  Created by xxb on 2018/4/21.
////  Copyright © 2018年 xxb. All rights reserved.
////
//
//#import "UMTool.h"
//#import <WXApi.h>
//
//#define UMSocialManagerInstance [UMSocialManager defaultManager]
//
//@implementation UMTool
///**
// *  平台是否安装
// *
// *  @param platformType 平台类型 @see UMSocialPlatformType
// *
// *  @return YES 代表安装，NO 代表未安装
// *  @note 在判断QQ空间的App的时候，QQApi判断会出问题
// */
//+ (BOOL) isInstall:(UMSocialPlatformType)platformType
//{
//    return [UMSocialManagerInstance isInstall:platformType];
//}
//
/////分享消息
//+ (void)shareText:(NSString *)text toPlatformType:(UMSocialPlatformType)platformType resultBlock:(void(^)(id data,NSError *error))resultBlock currentViewController:(UIViewController *)currentViewController
//{
//    //创建分享消息对象
//    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
//    //设置文本
//    messageObject.text = text;
//    
//    //调用分享接口
//    [UMSocialManagerInstance shareToPlatform:platformType messageObject:messageObject currentViewController:currentViewController completion:^(id data, NSError *error) {
//        if (error) {
//            NSLog(@"************Share fail with error %@*********",error);
//        }else{
//            NSLog(@"response data is %@",data);
//        }
//        
//        if (resultBlock)
//        {
//            resultBlock(data,error);
//        }
//    }];
//}
//
/////分享aa订单到小程序
//+ (void)shareToWXMiniProgramWithOrderIds:(NSString *)orderIds image:(UIImage *)image resultBlock:(void(^)(id data,NSError *error))resultBlock currentViewController:(UIViewController *)currentViewController
//{
//    //创建分享消息对象
//    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
//    
//    UMShareMiniProgramObject *shareObject = [UMShareMiniProgramObject shareObjectWithTitle:[NSString stringWithFormat:XBText_你的好友某某创建了AA支付就餐订单,[LoginTool shared].loginModel.user.trueName] descr:nil thumImage:image];
//    shareObject.webpageUrl = @"兼容微信低版本网页地址";
//    shareObject.userName = @"gh_9396f872dca5";
//    shareObject.path = [NSString stringWithFormat:XBText_path_shareAAOrder,orderIds];
//    messageObject.shareObject = shareObject;
//    shareObject.hdImageData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"logo" ofType:@"png"]];
//    shareObject.miniProgramType = UShareWXMiniProgramTypeRelease; // 可选体验版和开发板
//    
//    //调用分享接口
//    [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_WechatSession messageObject:messageObject currentViewController:currentViewController completion:^(id data, NSError *error) {
//        if (error) {
//            UMSocialLogInfo(@"************Share fail with error %@*********",error);
//        }else{
//            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
//                UMSocialShareResponse *resp = data;
//                //分享结果消息
//                UMSocialLogInfo(@"response message is %@",resp.message);
//                //第三方原始返回的数据
//                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
//                
//            }else{
//                UMSocialLogInfo(@"response data is %@",data);
//            }
//        }
//        if (resultBlock)
//        {
//            resultBlock(data,error);
//        }
//    }];
//}
//
//@end

