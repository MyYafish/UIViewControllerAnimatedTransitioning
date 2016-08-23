//
//  ViewController.m
//  WPViewControllerTranform
//
//  Created by 吴鹏 on 16/8/22.
//  Copyright © 2016年 wupeng. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"k哥强无敌";
    UIImageView * imageview = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    imageview.image = [UIImage imageNamed:@"yingmo"];
    [self.view addSubview:imageview];
    
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame) - 100)/2, 100, 100, 70)];
    [button setTitle:@"push" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blackColor];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    [super viewWillAppear:animated];
}

- (void)buttonClick
{
    SecondViewController * sc = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:sc animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}



@end
