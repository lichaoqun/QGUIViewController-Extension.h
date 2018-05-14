//
//  UIViewController+Extension.m
//  testMyLib
//
//  Created by 李超群 on 2018/5/14.
//  Copyright © 2018年 李超群. All rights reserved.
//

#import "UIViewController+Extension.h"
#import <objc/message.h>

@implementation UIViewController (Extension)
@dynamic enableHiddenNavBar;
@dynamic enableLightContentStyle;

/** 需要隐藏导航栏的视图控制器数组 */
static NSMutableArray *hiddenNavBarControllersArr_;

/** 需要使用浅色状态栏的视图控制器数组 */
static NSMutableArray *lightContentStatusBarControllersArr_;

/** 单次执行 */
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod = class_getInstanceMethod(self, @selector(viewWillAppear:));
         Method newMethod = class_getInstanceMethod(self, @selector(dy_viewWillAppear:));
        method_exchangeImplementations(originalMethod, newMethod);
        hiddenNavBarControllersArr_ = [NSMutableArray array];
        lightContentStatusBarControllersArr_ = [NSMutableArray array];
        
    });
}

/** 调换系统的方法 */
-(void)dy_viewWillAppear:(BOOL)animated{

    /** 导航栏的显示和隐藏 */
    if ([hiddenNavBarControllersArr_ containsObject:NSStringFromClass([self class])]) {
        [self.navigationController setNavigationBarHidden:YES animated:NO];
    }else{
        [self.navigationController setNavigationBarHidden:NO animated:NO];
    }
    
    /** 状态栏的显示和隐藏 */
    if ([lightContentStatusBarControllersArr_ containsObject:NSStringFromClass([self class])]) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }else{
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    }
    
    /** 重新调用系统的方法 */
    [self dy_viewWillAppear:animated];
}

/** 是否隐藏导航栏 */
- (void)setEnableHiddenNavBar:(BOOL)enableHiddenNavBar{
    if (enableHiddenNavBar) {
        if (![hiddenNavBarControllersArr_ containsObject:NSStringFromClass([self class])]) {
            [hiddenNavBarControllersArr_ addObject:NSStringFromClass([self class])];
        }
    }
};

/** 是否使用浅色的状态栏 */
- (void)setEnableLightContentStyle:(BOOL)enableLightContentStyle{
    if (enableLightContentStyle) {
        if (![lightContentStatusBarControllersArr_ containsObject:NSStringFromClass([self class])]) {
            [lightContentStatusBarControllersArr_ addObject:NSStringFromClass([self class])];
        }
    }
};

 /** 导航栏和状态栏的存储的 key */
static const NSString * lastNavigationBarHiddenStatusKey= @"lastStatusBarStyleKey";
static const NSString * lastStatusBarStyleKey= @"lastStatusBarStyleKey";

/** 存储当前导航栏的隐藏状态,并设置导航栏的新的隐藏状态 */
-(void)navigationBarToHidden:(BOOL)hidden{
    NSNumber *lastNavigationBarHiddenStatus = [NSNumber numberWithBool:self.navigationController.navigationBarHidden];
    objc_setAssociatedObject(self, [lastNavigationBarHiddenStatusKey UTF8String], lastNavigationBarHiddenStatus, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self.navigationController setNavigationBarHidden:hidden animated:NO];
}

/** 恢复上次存储的导航栏的隐藏状态 */
-(void)recoverOriginalNavigationBarHiddenStatus{
    NSNumber *lastNavigationBarHiddenStatus = objc_getAssociatedObject(self, [lastNavigationBarHiddenStatusKey UTF8String]);
    if (lastNavigationBarHiddenStatus == nil) {
        lastNavigationBarHiddenStatus = [NSNumber numberWithBool:self.navigationController.navigationBarHidden];
    }
    [self.navigationController setNavigationBarHidden:[lastNavigationBarHiddenStatus boolValue] animated:NO];
    
}

/** 存储当前状态栏的风格,并设置状态栏的新的风格 */
-(void)statusBarStyleToStyle:(UIStatusBarStyle)statusBarStyle{
    NSNumber *lastStatusBarStyle = [NSNumber numberWithInteger:[UIApplication sharedApplication].statusBarStyle];
    objc_setAssociatedObject(self, [lastStatusBarStyleKey UTF8String], lastStatusBarStyle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [UIApplication sharedApplication].statusBarStyle = statusBarStyle;
}

/** 恢复上次存储的状态栏的风格 */
-(void)recoverOriginalStatusBarStyle{
    NSNumber *lastStatusBarStyle = objc_getAssociatedObject(self, [lastStatusBarStyleKey UTF8String]);
    if (lastStatusBarStyle  == nil) {
        lastStatusBarStyle = [NSNumber numberWithInteger:[UIApplication sharedApplication].statusBarStyle];
    }
    [UIApplication sharedApplication].statusBarStyle = [lastStatusBarStyle integerValue];
}

@end
