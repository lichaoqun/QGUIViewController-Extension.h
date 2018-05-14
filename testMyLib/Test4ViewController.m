//
//  Test4ViewController.m
//  testMyLib
//
//  Created by 李超群 on 2018/5/14.
//Copyright © 2018年 李超群. All rights reserved.
//

#pragma mark ************************************<#这个类的作用#>************************************

#import "Test4ViewController.h"
#import "Test5ViewController.h"
#import "UIViewController+Extension.h"

@interface Test4ViewController ()

#pragma mark - 私有属性

@end

@implementation Test4ViewController
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint pt = [touch locationInView:self.view];
    if (pt.y < 200) {
        
        [self navigationBarToHidden:NO];
        [self statusBarStyleToStyle:UIStatusBarStyleDefault];
    }else{
        [self recoverOriginalNavigationBarHiddenStatus];
        [self recoverOriginalStatusBarStyle];
    }
}

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
    
    self.view.backgroundColor = [UIColor orangeColor];
    self.enableHiddenNavBar = NO;
    self.enableLightContentStyle = YES;
}

/** 设置 UI */
-(void)setupUI{
    
}

/** 设置位置 */
-(void)setupFrame{
    
}
-(void)dealloc{
    NSLog(@"dealloc");
}

#pragma mark - 内部调用的其他的方法

#pragma mark - 懒加载

#pragma mark - 重写的方法

#pragma mark - 事件监听

#pragma mark - 代理方法

@end
