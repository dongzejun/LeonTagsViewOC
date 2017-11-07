//
//  ViewController.m
//  LeonTagsViewOC
//
//  Created by 李东泽 on 2017/11/7.
//  Copyright © 2017年 李东泽. All rights reserved.
//

#import "ViewController.h"
#import "LeonTestLeonTagsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LeonTestLeonTagsViewController *testLeonTagsViewVC = [[LeonTestLeonTagsViewController alloc] init];
    [self.navigationController pushViewController:testLeonTagsViewVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
