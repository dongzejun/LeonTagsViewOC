//
//  LeonTestLeonTagsViewXIBCell.h
//  LeonCommonFunctionsDemo
//
//  Created by Leon on 2016/12/2.
//  Copyright © 2016年 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LeonTagsView;
@interface LeonTestLeonTagsViewXIBCell : UITableViewCell

@property (strong, nonatomic) IBOutlet LeonTagsView *leonTagsView;
@property (nonatomic, copy) NSArray *tagsArray;

+ (CGFloat)getLeonTestLeonTagsViewXIBCellHeight;

@end
