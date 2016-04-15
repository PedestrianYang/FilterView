//
//  YSWCategoryFilterView.h
//  FilterView
//
//  Created by ymq on 16/3/14.
//  Copyright © 2016年 ymq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    Default,
    Salecount_Up,
    Salecount_Down,
    Price_Up,
    Price_Down,
    Pubtime_Up,
    Pubtime_Down,
} BtnStyle;

typedef void(^BtnClick)(BtnStyle style);

@interface FilterView : UIView

@property (nonatomic, copy) BtnClick btnClick;

@end
