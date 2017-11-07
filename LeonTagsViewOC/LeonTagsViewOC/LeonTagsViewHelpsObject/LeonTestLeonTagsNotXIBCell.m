//
//  LeonTestLeonTagsNotXIBCell.m
//  LeonCommonFunctionsDemo
//
//  Created by Leon on 2016/12/2.
//  Copyright © 2016年 Leon. All rights reserved.
//

#import "LeonTestLeonTagsNotXIBCell.h"
#import "LeonTagsView.h"

static CGFloat leonTagsViewHeight = 0.0;

@interface LeonTestLeonTagsNotXIBCell ()


@end

@implementation LeonTestLeonTagsNotXIBCell

+ (CGFloat)getLeonTestLeonTagsNotXIBCellHeight {
    return leonTagsViewHeight;
}

- (LeonTagsView *)leonTagsView {
    if (!_leonTagsView) {
        self.leonTagsView = [[LeonTagsView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, 0.0)];
        [self addSubview:_leonTagsView];
    }
    return _leonTagsView;
}

- (void)setTagsArray:(NSArray *)tagsArray selectedTagsArray:(NSArray *)selectedTagsArray defaultSelectedTagsArray:(NSArray *)defaultSelectedTagsArray {
    [self.leonTagsView setTagsArray:tagsArray selectedTagsArray:selectedTagsArray defaultTagsArray:defaultSelectedTagsArray];
    
    leonTagsViewHeight = _leonTagsView.frame.size.height;
}

- (void)setTagsArray:(NSArray *)tagsArray {
    [self.leonTagsView setTagsArray:tagsArray];
    leonTagsViewHeight = _leonTagsView.frame.size.height;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
