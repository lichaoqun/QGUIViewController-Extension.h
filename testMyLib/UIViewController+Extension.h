//
//  UIViewController+Extension.h
//  testMyLib
//
//  Created by 李超群 on 2018/5/14.
//  Copyright © 2018年 李超群. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extension)

/** 是否隐藏导航栏 */
@property (nonatomic, assign) BOOL enableHiddenNavBar;

/** 是否使用浅色的状态栏 */
@property (nonatomic, assign) BOOL enableLightContentStyle;

/** 存储当前导航栏的隐藏状态,并设置导航栏的新的隐藏状态 */
-(void)navigationBarToHidden:(BOOL)hidden;

/** 恢复上次存储的导航栏的隐藏状态 */
-(void)recoverOriginalNavigationBarHiddenStatus;

/** 存储当前状态栏的风格,并设置状态栏的新的风格 */
-(void)statusBarStyleToStyle:(UIStatusBarStyle)statusBarStyle;

/** 恢复上次存储的状态栏的风格 */
-(void)recoverOriginalStatusBarStyle;

@end
