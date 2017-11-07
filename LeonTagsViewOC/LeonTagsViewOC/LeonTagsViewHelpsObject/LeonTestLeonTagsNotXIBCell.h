//
//  LeonTestLeonTagsNotXIBCell.h
//  LeonCommonFunctionsDemo
//
//  Created by Leon on 2016/12/2.
//  Copyright © 2016年 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LeonTagsView;
@interface LeonTestLeonTagsNotXIBCell : UITableViewCell

- (void)setTagsArray:(NSArray *)tagsArray selectedTagsArray:(NSArray *)selectedTagsArray defaultSelectedTagsArray:(NSArray *)defaultSelectedTagsArray;
- (void)setTagsArray:(NSArray *)tagsArray;

@property (nonatomic, strong) LeonTagsView *leonTagsView;

+ (CGFloat)getLeonTestLeonTagsNotXIBCellHeight;

@end
