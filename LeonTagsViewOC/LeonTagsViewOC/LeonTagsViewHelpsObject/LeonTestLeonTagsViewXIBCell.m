//
//  LeonTestLeonTagsViewXIBCell.m
//  LeonCommonFunctionsDemo
//
//  Created by Leon on 2016/12/2.
//  Copyright © 2016年 Leon. All rights reserved.
//

#import "LeonTestLeonTagsViewXIBCell.h"
#import "LeonTagsView.h"

static CGFloat leonTagsViewHeight = 0.0;

@implementation LeonTestLeonTagsViewXIBCell

- (void)setTagsArray:(NSArray *)tagsArray {
    [self.leonTagsView setTagsArray:tagsArray];
    leonTagsViewHeight = _leonTagsView.frame.size.height;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    CGRect newFrame = self.leonTagsView.frame;
    newFrame.size.width = KSCREEN_WIDTH - 200;
    self.leonTagsView.frame = newFrame;
}
+ (CGFloat)getLeonTestLeonTagsViewXIBCellHeight {
    return leonTagsViewHeight;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
