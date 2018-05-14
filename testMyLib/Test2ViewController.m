//
//  Test2ViewController.m
//  testMyLib
//
//  Created by 李超群 on 2018/5/14.
//Copyright © 2018年 李超群. All rights reserved.
//

#pragma mark ************************************<#这个类的作用#>************************************

#import "Test2ViewController.h"
#import "Test3ViewController.h"
#import "UIViewController+Extension.h"

@interface Test2ViewController ()

#pragma mark - 私有属性

@end

@implementation Test2ViewController

#pragma mark - 初始化方法
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /** 设置数据 */
    [self setupData];
    
    /** 设置 UI */
    [self setupUI];
    
    /** 设置位置 */
    [self setupFrame];
}

#pragma mark - 设置初始化数据
/** 设置数据 */
-(void)setupData{
    
    self.view.backgroundColor = [UIColor greenColor];
    self.enableHiddenNavBar = YES;
}

/** 设置 UI */
-(void)setupUI{
    
}

/** 设置位置 */
-(void)setupFrame{
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController pushViewController:[[Test3ViewController alloc]init] animated:YES];
}
#pragma mark - 内部调用的其他的方法

#pragma mark - 懒加载

#pragma mark - 重写的方法

#pragma mark - 事件监听

#pragma mark - 代理方法
-(void)dealloc{
    NSLog(@"dealloc");
}

@end
