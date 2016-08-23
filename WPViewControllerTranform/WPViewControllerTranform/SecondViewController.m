//
//  SecondViewController.m
//  WPViewControllerTranform
//
//  Created by 吴鹏 on 16/8/22.
//  Copyright © 2016年 wupeng. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"社会我k哥人狠话不多";
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    
    
    [super viewWillAppear:animated];
}


@end
