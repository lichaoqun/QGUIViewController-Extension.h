//
//  ViewController.m
//  testMyLib
//
//  Created by 李超群 on 2018/5/14.
//  Copyright © 2018年 李超群. All rights reserved.
//

#import "ViewController.h"
#import "Test1ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController pushViewController:[[Test1ViewController alloc]init] animated:YES];
}
-(void)dealloc{
    NSLog(@"dealloc");
}


@end
