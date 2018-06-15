//
//  ViewController.m
//  XBAppTools
//
//  Created by xxb on 2018/5/22.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import "ViewController.h"
#import "XBJumpSettingTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [[XBJumpSettingTool shared] jumpToSettingWithType:XBJumpSettingType_WIFI errorBlock:^{
//        NSLog(@"无法打开wifi设置");
//    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
