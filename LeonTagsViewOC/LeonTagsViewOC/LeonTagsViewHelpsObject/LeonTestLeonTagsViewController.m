//
//  LeonTestLeonTagsViewController.m
//  LeonCommonFunctionsDemo
//
//  Created by Leon on 2016/12/1.
//  Copyright © 2016年 Leon. All rights reserved.
//

#import "LeonTestLeonTagsViewController.h"
#import "LeonTagsView.h"
#import "LeonTestLeonTagsNotXIBCell.h"
#import "LeonTestLeonTagsViewXIBCell.h"
#import "LeonTagsView.h"
@interface LeonTestLeonTagsViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LeonTestLeonTagsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"LeonTagsView";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LeonTestLeonTagsViewXIBCell" bundle:nil] forCellReuseIdentifier:@"LeonTestLeonTagsViewXIBCell"];
    [self.tableView registerClass:[LeonTestLeonTagsNotXIBCell class] forCellReuseIdentifier:@"LeonTestLeonTagsNotXIBCell"];
}

#pragma mark - UITableViewDataSource Method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        static NSString *cellIdentifier = @"LeonTestLeonTagsViewXIBCell";
        LeonTestLeonTagsViewXIBCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        cell.leonTagsView.leonTagsViewStyle = LeonTagsViewStyle_MultiSelection;
        cell.leonTagsView.isKeepRight = YES;
        cell.tagsArray = @[@"这是", @"用", @"XIB", @"拖", @"上", @"去", @"的,", @"把xib上View", @"的class", @"换", @"成", @"LeonTagsView"];
        cell.leonTagsView.returnSelectedTagTitlesArrayBlock = ^(NSMutableArray *selectedArray) {
            [selectedArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSLog(@"%@", obj);
            }];
        };
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.row == 1) {
        static NSString *cellIdentifier = @"LeonTestLeonTagsNotXIBCell";
        LeonTestLeonTagsNotXIBCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        cell.leonTagsView.btnLeftMargin = 50.0;//开始时，标签距离左边的间距
        cell.leonTagsView.leonTagsViewStyle = LeonTagsViewStyle_NoSelection;
        
        NSArray *tagsArray = @[@"这是", @"不让", @"点击的", @"一种", @"情况", @"默认展示", @"选项", @"是“不让", @"1", @"23", @"456", @"78910", @"11121314", @"1516171819"];
        NSArray *defaultSelectedTagsArray = @[@"不让"];
        [cell setTagsArray:tagsArray selectedTagsArray:defaultSelectedTagsArray defaultSelectedTagsArray:nil];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.row == 2) {
        static NSString *cellIdentifier = @"LeonTestLeonTagsNotXIBCell";
        LeonTestLeonTagsNotXIBCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        cell.leonTagsView.btnHorizontalMargin = 20.0;//标签之间左右间距
        cell.leonTagsView.btnVerticalMargin = 30.0; //标签之间上下间距
        
        NSArray *tagsArray = @[@"这是", @"不让", @"点击的", @"一种", @"情况", @"没有默认展示"];
        [cell setTagsArray:tagsArray];
        //不让点击
        cell.leonTagsView.leonTagsViewStyle = LeonTagsViewStyle_NoSelection;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.row == 3) {
        static NSString *cellIdentifier = @"LeonTestLeonTagsNotXIBCell";
        LeonTestLeonTagsNotXIBCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        //单选
        cell.leonTagsView.leonTagsViewStyle = LeonTagsViewStyle_SingleSelection;
        cell.leonTagsView.btnVerticalPadding = 10.0;//标签内，文字距离左右两边的距离
        cell.leonTagsView.btnHorizontalPadding = 20.0;//标签内，文字距离上下两边的距离
        NSArray *tagsArray = @[@"这是", @"让点击", @"的", @"一种", @"情况", @"有默认展示", @"单选", @"不可以多选"];
        NSArray *defaultSelectedTagsArray = @[@"单选"];
        [cell setTagsArray:tagsArray selectedTagsArray:defaultSelectedTagsArray defaultSelectedTagsArray:nil];
        
        cell.leonTagsView.returnSelectedTagTitlesArrayBlock = ^(NSMutableArray *selectedArray) {
            [selectedArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSLog(@"%@", obj);
            }];
        };
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.row == 4) {
        static NSString *cellIdentifier = @"LeonTestLeonTagsNotXIBCell";
        LeonTestLeonTagsNotXIBCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        NSArray *tagsArray = @[@"这是", @"让点击", @"的", @"一种", @"情况", @"有默认展示", @"多选", @"可以多选"];
        NSArray *defaultSelectedTagsArray = @[@"多选", @"可以多选"];
        [cell setTagsArray:tagsArray selectedTagsArray:defaultSelectedTagsArray defaultSelectedTagsArray:nil];
        //多选
        cell.leonTagsView.leonTagsViewStyle = LeonTagsViewStyle_MultiSelection;
        cell.leonTagsView.returnSelectedTagTitlesArrayBlock = ^(NSMutableArray *selectedArray) {
            [selectedArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSLog(@"%@", obj);
            }];
        };
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.row == 5) {
        static NSString *cellIdentifier = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.textLabel.text = @"标签的功能说明: \n1.可以设置距离左边的距离 \n2.可以设置标签与标签之间的上下左右距离 \n3.可以设置标签内部文字距上下左右的距离 \n4.可以设置单选、多选、不选和默认选择哪几项 \n5.设置选中状态和普通状态的文字颜色、字体大小、边框颜色、圆角大小";
        cell.textLabel.numberOfLines = 0;
        return cell;
    } else if (indexPath.row == 6) {
        static NSString *cellIdentifier = @"LeonTestLeonTagsNotXIBCell";
        LeonTestLeonTagsNotXIBCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        NSArray *tagsArray = @[@"默认展示", @"不能点击", @"默认选中", @"可以多选", @"的", @"一种", @"情况", @"有默认展示", @"多选"];
        NSArray *selectedTagsArray = @[@"默认选中", @"可以多选"];
        NSArray *defaultSelectedTagsArray = @[@"默认展示", @"不能点击"];
        [cell setTagsArray:tagsArray selectedTagsArray:selectedTagsArray defaultSelectedTagsArray:defaultSelectedTagsArray];
        //多选
        cell.leonTagsView.leonTagsViewStyle = LeonTagsViewStyle_MultiSelection;
        cell.leonTagsView.returnSelectedTagTitlesArrayBlock = ^(NSMutableArray *selectedArray) {
            [selectedArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSLog(@"%@", obj);
            }];
        };
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = @"";
    return cell;
}

#pragma mark - UITableViewDelegate Method
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return [LeonTestLeonTagsViewXIBCell getLeonTestLeonTagsViewXIBCellHeight];
    } else if (indexPath.row >= 1 && indexPath.row <= 4) {
        return [LeonTestLeonTagsNotXIBCell getLeonTestLeonTagsNotXIBCellHeight];
    } else if (indexPath.row == 5) {
        return 200;
    } else if (indexPath.row == 6) {
        return [LeonTestLeonTagsNotXIBCell getLeonTestLeonTagsNotXIBCellHeight];
    }
    return 50;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
