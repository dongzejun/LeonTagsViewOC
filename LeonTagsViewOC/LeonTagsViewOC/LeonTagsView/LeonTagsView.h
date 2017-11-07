//
//  LeonTagsView.h
//  LeonCommonFunctionsDemo
//
//  Created by Leon on 2016/12/1.
//  Copyright © 2016年 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    LeonTagsViewStyle_MultiSelection,       //可以多选状态
    LeonTagsViewStyle_SingleSelection,      //只能单选状态
    LeonTagsViewStyle_NoSelection,          //不能点击状态
    LeonTagsViewStyle_DefaultSelection      //默认不能点击状态
} LeonTagsViewStyle;

typedef void(^ReturnSelectedTagTitlesArrayBlock)(NSMutableArray *selectedArray);

@interface LeonTagsView : UIView

- (void)setTagsArray:(NSArray *)array;
- (void)setTagsArray:(NSArray *)array selectedTagsArray:(NSArray *)selectedTagsArray defaultTagsArray:(NSArray *)defaultArray;

//btn上文字字体
@property (nonatomic, strong) UIFont *btnTextFont;
//单个btn的圆角值
@property (nonatomic, assign) CGFloat btnCornerRadiusValue;

@property (nonatomic, assign) BOOL isKeepRight;               //是否靠右显示,默认靠左显示

@property (nonatomic, assign) CGFloat btnHorizontalPadding;   //单个btn 文字左右两边距离btn左右边界的值
@property (nonatomic, assign) CGFloat btnVerticalPadding;     //单个btn 文字上下两边距离btn上下边界的值

@property (nonatomic, assign) CGFloat btnHorizontalMargin;    //btn之间的距离 (左右)
@property (nonatomic, assign) CGFloat btnVerticalMargin;      //btn之间的距离 (上下)

@property (nonatomic, assign) CGFloat btnLeftMargin;          //一行中，第一个tag距离左边边界的距离
@property (nonatomic, assign) CGFloat btnRightMargin;         //一行中，最后一个tag距离右边边界的最小距离

//设置单个btn上字体的颜色
@property (nonatomic, strong) UIColor *btnNormalTextColor;              //正常btn状态
@property (nonatomic, strong) UIColor *btnSelectedTextColor;            //选中btn状态
@property (nonatomic, strong) UIColor *btnDefaultTextColor;             //默认btn状态

//btn的背景颜色
@property (nonatomic, strong) UIColor *btnNormalBackgroundColor;        //正常btn状态
@property (nonatomic, strong) UIColor *btnSelectedBackgroundColor;      //选中btn状态
@property (nonatomic, strong) UIColor *btnDefaultBackgroundColor;       //默认btn状态

//btn的边界颜色
@property (nonatomic, strong) UIColor *btnNormalBorderColor;            //正常btn状态
@property (nonatomic, strong) UIColor *btnSelectedBorderColor;          //选中btn状态
@property (nonatomic, strong) UIColor *btnDefaultBorderColor;           //默认btn状态

//设置 “多选” “单选” “不能点击” 状态
@property (nonatomic, assign) LeonTagsViewStyle leonTagsViewStyle;

//如果可以点击，回掉数组
@property (nonatomic, copy) ReturnSelectedTagTitlesArrayBlock returnSelectedTagTitlesArrayBlock;

@end
