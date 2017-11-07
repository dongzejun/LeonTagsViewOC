//
//  LeonTagsView.m
//  LeonCommonFunctionsDemo
//
//  Created by Leon on 2016/12/1.
//  Copyright © 2016年 Leon. All rights reserved.
//

#import "LeonTagsView.h"

@interface LeonTagsView ()

// 记录frame
@property (nonatomic, assign) CGRect lastFrame;
// 标签总高度
@property (nonatomic, assign) NSInteger totalHieght;

@property (nonatomic, strong) NSMutableArray *allBtnTagsArray;
@property (nonatomic, strong) NSMutableArray *selectedTagTitlesArray;

@end

@implementation LeonTagsView
//if you use code for your page
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initViewAttributes];
        self.backgroundColor = KRANDOM_COLOR;
    }
    return self;
}
//if you use XIB for your page
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initViewAttributes];
        NSLog(@"x = %f, y = %f, width = %f, height = %f", self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
        self.backgroundColor = KRANDOM_COLOR;
    }
    return self;
}

- (void)initViewAttributes {
    self.isKeepRight = NO;
    
    self.allBtnTagsArray = [NSMutableArray arrayWithCapacity:1];
    self.selectedTagTitlesArray = [NSMutableArray arrayWithCapacity:1];
    
    self.btnTextFont = [UIFont systemFontOfSize:17];
    self.btnCornerRadiusValue = 5;
    
    self.btnHorizontalPadding = 10;
    self.btnVerticalPadding = 5;
    
    self.btnHorizontalMargin = 10;
    self.btnVerticalMargin = 10;
    
    self.btnLeftMargin = 10.0;
    self.btnRightMargin = 10.0;
    
    self.btnNormalTextColor = [UIColor grayColor];
    self.btnSelectedTextColor = [UIColor redColor];
    self.btnDefaultTextColor = [UIColor whiteColor];
    
    self.btnNormalBackgroundColor = [UIColor cyanColor];
    self.btnSelectedBackgroundColor = [UIColor grayColor];
    self.btnDefaultBackgroundColor = [UIColor blueColor];
    
    self.btnNormalBorderColor = [UIColor yellowColor];
    self.btnSelectedBorderColor = [UIColor redColor];
    self.btnDefaultBorderColor = [UIColor cyanColor];
    
    self.leonTagsViewStyle = LeonTagsViewStyle_NoSelection;
}

- (void)setTagsArray:(NSArray *)array {
    //防止cell重用
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIView *view = obj;
        [view removeFromSuperview];
    }];
    
    __weak typeof(self) weakSelf = self;
    [weakSelf.allBtnTagsArray removeAllObjects];
    weakSelf.totalHieght = 0.0;
    
    CGRect lastBtnRect = CGRectZero;
    if (self.isKeepRight) {
        lastBtnRect.origin.x = self.bounds.size.width - self.btnRightMargin;
    } else {
        lastBtnRect.origin.x = self.btnLeftMargin;
    }
    weakSelf.lastFrame = lastBtnRect;
    [array enumerateObjectsUsingBlock:^(NSString *titleString, NSUInteger idx, BOOL * _Nonnull stop) {
        [self setTagBtnWithTagTitle:titleString tagID:@"-1"];
    }];
    
    [self setSomeTagBtnsSelected:self.selectedTagTitlesArray];
    
}

- (void)setTagsArray:(NSArray *)array defaultSelectedTagsArray:(NSArray *)defaultSelectedTags {
    [self setTagsArray:array];
    [self setSomeTagBtnsSelected: defaultSelectedTags];
}

- (void)setTagsArray:(NSArray *)array selectedTagsArray:(NSArray *)selectedTagsArray defaultTagsArray:(NSArray *)defaultArray {
    if (array.count) {
        [self setTagsArray:array];
    }
    if (selectedTagsArray.count) {
        [self setSomeTagBtnsSelected: selectedTagsArray];
    }
    if (defaultArray.count) {
        [self setDefaultTagBtnsAttributes:defaultArray];
    }
}

- (void)setTagBtnWithTagTitle:(NSString *)tagTitle tagID:(NSString *)tagID {
    UIButton *tagBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tagBtn.frame = CGRectZero;
    tagBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [tagBtn setTitle:tagTitle forState:UIControlStateNormal];
    tagBtn.titleLabel.font = self.btnTextFont;
    tagBtn.layer.cornerRadius = self.btnCornerRadiusValue;
    tagBtn.layer.masksToBounds = YES;
    [tagBtn addTarget:self action:@selector(tagBtnClickedAction:) forControlEvents:UIControlEventTouchUpInside];
    
    NSDictionary *attribute = @{NSFontAttributeName: self.btnTextFont};
    CGSize tagTitleSize = [tagTitle sizeWithAttributes: attribute];
    tagTitleSize.width += self.btnHorizontalPadding * 2;
    tagTitleSize.height += self.btnVerticalPadding * 2;
    CGRect tagNewRect = CGRectZero;
    if (self.isKeepRight) {
        if (self.lastFrame.origin.x - tagTitleSize.width - self.btnHorizontalMargin - self.btnLeftMargin < 0) {
            tagNewRect.origin = CGPointMake(self.bounds.size.width - self.btnRightMargin - tagTitleSize.width, self.lastFrame.origin.y + tagTitleSize.height + self.btnVerticalMargin);
        } else {
            CGFloat magin = self.lastFrame.size.width > 0 ? self.btnHorizontalMargin : 0;
            tagNewRect.origin = CGPointMake(self.lastFrame.origin.x - tagTitleSize.width - magin, self.lastFrame.origin.y);
        }
    } else {
        if (self.lastFrame.origin.x + self.lastFrame.size.width + tagTitleSize.width + self.btnHorizontalMargin > self.bounds.size.width - self.btnRightMargin) {
            tagNewRect.origin = CGPointMake(self.btnLeftMargin, self.lastFrame.origin.y + tagTitleSize.height + self.btnVerticalMargin);
        } else {
            CGFloat magin = self.lastFrame.size.width > 0 ? self.btnHorizontalMargin : 0;
            tagNewRect.origin = CGPointMake(self.lastFrame.origin.x + self.lastFrame.size.width + magin, self.lastFrame.origin.y);
        }
    }
    
    tagNewRect.size = tagTitleSize;
    tagBtn.frame = tagNewRect;
    self.lastFrame = tagBtn.frame;
    
    self.totalHieght = self.lastFrame.origin.y + self.lastFrame.size.height;
    [self setHight:self andHight:self.totalHieght];
    [self setBtnNormalState:tagBtn];
    [self.allBtnTagsArray addObject:tagBtn];
    [self addSubview:tagBtn];
}

#pragma mark-改变控件高度
- (void)setHight:(UIView *)view andHight:(CGFloat)hight {
    CGRect tempFrame = view.frame;
    tempFrame.size.height = hight;
    view.frame = tempFrame;
}

#pragma mark - I need Method

- (void)setBtnSelectedState:(UIButton *)btn {
    btn.layer.borderColor = self.btnSelectedBorderColor.CGColor;
    btn.layer.borderWidth = 1;
    [btn  setTitleColor:self.btnSelectedTextColor forState:UIControlStateNormal];
    btn.backgroundColor = self.btnSelectedBackgroundColor;
    btn.selected = YES;
    btn.userInteractionEnabled = YES;
}

- (void)setBtnNormalState:(UIButton *)btn {
    btn.layer.borderColor = self.btnNormalBorderColor.CGColor;
    btn.layer.borderWidth = 1;
    [btn  setTitleColor:self.btnNormalTextColor forState:UIControlStateNormal];
    btn.backgroundColor = self.btnNormalBackgroundColor;
    btn.selected = NO;
    btn.userInteractionEnabled = YES;
}

- (void)setBtnDefaultState:(UIButton *)btn {
    btn.layer.borderColor = self.btnDefaultBorderColor.CGColor;
    btn.layer.borderWidth = 1;
    [btn  setTitleColor:self.btnDefaultTextColor forState:UIControlStateNormal];
    btn.backgroundColor = self.btnDefaultBackgroundColor;
    btn.selected = NO;
    btn.userInteractionEnabled = NO;
}

- (void)setSomeTagBtnsSelected:(NSArray *)tagTitles {
    if (self.selectedTagTitlesArray.count) {
        tagTitles = self.selectedTagTitlesArray;
    }
    [self.allBtnTagsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *tagBtn = obj;
        if ([tagTitles containsObject: tagBtn.titleLabel.text]) {
            [self setBtnSelectedState: tagBtn];
            if (!self.selectedTagTitlesArray.count) {
                [self.selectedTagTitlesArray addObject:tagBtn.titleLabel.text];
            }
        }
    }];
}

- (void)setDefaultTagBtnsAttributes:(NSArray *)defaultTagsArray {
    [self.allBtnTagsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *tagBtn = obj;
        if ([defaultTagsArray containsObject: tagBtn.titleLabel.text]) {
            [self setBtnDefaultState:tagBtn];
        }
    }];
}

- (void)tagBtnClickedAction:(UIButton *)btn {
    typeof(self) weak_self = self;
    if (_leonTagsViewStyle == LeonTagsViewStyle_NoSelection) {
        return;
    } else if (_leonTagsViewStyle == LeonTagsViewStyle_SingleSelection) {
        if ([self.selectedTagTitlesArray containsObject:btn.titleLabel.text]) {
            [self.selectedTagTitlesArray removeObject:btn.titleLabel.text];
            [self setBtnNormalState:btn];
        } else {
            [self.allBtnTagsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                UIButton *tagBtn = obj;
                if ([weak_self.selectedTagTitlesArray containsObject:tagBtn.titleLabel.text]) {
                    [weak_self setBtnNormalState:tagBtn];
                    [weak_self.selectedTagTitlesArray removeObject:tagBtn.titleLabel.text];
                }
            }];
            [self.selectedTagTitlesArray addObject:btn.titleLabel.text];
            [self setBtnSelectedState:btn];
        }
        if (_returnSelectedTagTitlesArrayBlock) {
            self.returnSelectedTagTitlesArrayBlock(weak_self.selectedTagTitlesArray);
        }
    } else if (_leonTagsViewStyle == LeonTagsViewStyle_MultiSelection) {
        if ([self.selectedTagTitlesArray containsObject:btn.titleLabel.text]) {
            [self.selectedTagTitlesArray removeObject:btn.titleLabel.text];
            [self setBtnNormalState:btn];
        } else {
            [self.selectedTagTitlesArray addObject:btn.titleLabel.text];
            [self setBtnSelectedState:btn];
        }
        if (_returnSelectedTagTitlesArrayBlock) {
            self.returnSelectedTagTitlesArrayBlock(weak_self.selectedTagTitlesArray);
        }
    } else {
        //不设置这个 ”leonTagsViewStyle” 这个属性的话，那么直接返回
        return;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
