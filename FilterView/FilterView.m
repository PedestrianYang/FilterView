//
//  YSWCategoryFilterView.m
//  FilterView
//
//  Created by ymq on 16/3/14.
//  Copyright © 2016年 ymq. All rights reserved.
//

#import "FilterView.h"

#define BTNTAG 999
#define TITLETAG 111
#define IMAGEUPTAG 222
#define IMAGEDownTAG 333

@interface FilterView()

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, assign) BtnStyle currentStyle;

@end

@implementation FilterView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.titleArray = @[@"综合排序",@"销量",@"价格",@"上架时间",@"出版时间"];
        self.currentStyle = Default;
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
    CGFloat btnW = [UIScreen mainScreen].bounds.size.width / self.titleArray.count;
    CGFloat btnH = 40.0;
    
    for (NSInteger i = 0; i < self.titleArray.count; i ++)
    {
        CGFloat btnX = i * btnW;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(btnX, 0, btnW, btnH);
        
        CGFloat labW = [self widthWithString:self.titleArray[i] Font:[UIFont systemFontOfSize:13.0] WithHeight:40];
        
        CGFloat offsetX = i == 0 ? 0.0 : 7.0;
        CGFloat labX = (btnW - labW - offsetX) / 2.0;
        UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(labX, 0, labW, 40)];
        titleLab.text = self.titleArray[i];
        titleLab.backgroundColor = [UIColor clearColor];
        titleLab.font = [UIFont systemFontOfSize:13.0];
        titleLab.textColor = [UIColor blackColor];
        titleLab.tag = TITLETAG;
        [btn addSubview:titleLab];
        if (i != 0)
        {
            UIImageView *imageViewUp = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleLab.frame) + 1, 25.0 / 2.0, 7, 7)];
            imageViewUp.image = [UIImage imageNamed:@"Category_up_gray"];
            imageViewUp.highlightedImage = [UIImage imageNamed:@"Category_up_red"];
            imageViewUp.tag = IMAGEUPTAG;
            imageViewUp.highlighted = NO;
            [btn addSubview:imageViewUp];
            
            UIImageView *imageViewDown = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewUp.frame.origin.x - 0.5, CGRectGetMaxY(imageViewUp.frame), 7, 7)];

            imageViewDown.image = [UIImage imageNamed:@"Category_up_gray"];
            imageViewDown.highlightedImage = [UIImage imageNamed:@"Category_up_red"];
            imageViewDown.tag = IMAGEDownTAG;
            imageViewDown.transform = CGAffineTransformMakeRotation(M_PI);
            imageViewDown.highlighted = NO;
            [btn addSubview:imageViewDown];
        }
        else if (i == 0)
        {
            titleLab.textColor = [UIColor redColor];
        }

        btn.tag = BTNTAG + i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
}

- (void)btnClick:(UIButton *)btn
{
    NSInteger tag = btn.tag - BTNTAG;
    if (tag == 0 && self.currentStyle == Default)
    {
        return;
    }
    UILabel *titleLab = [btn viewWithTag:TITLETAG];
    titleLab.textColor = [UIColor redColor];
    if (tag != 0)
    {
        UIImageView *up = [btn viewWithTag:IMAGEUPTAG];
        UIImageView *down = [btn viewWithTag:IMAGEDownTAG];
        down.highlighted = up.highlighted;
        up.highlighted = !up.highlighted;
        if (up.highlighted)
        {
            switch (tag)
            {
                case 1:
                {
                    self.currentStyle = Salecount_Up;
                }
                    break;
                case 2:
                {
                    self.currentStyle = Price_Up;
                }
                    break;
                case 3:
                {
                    self.currentStyle = Pubtime_Up;
                }
                    break;
                    
                default:
                    break;
            }
            
        }
        else if(down.highlighted)
        {
            switch (tag)
            {
                case 1:
                {
                    self.currentStyle = Salecount_Down;
                }
                    break;
                case 2:
                {
                    self.currentStyle = Price_Down;
                }
                    break;
                case 3:
                {
                    self.currentStyle = Pubtime_Down;
                }
                    break;
                    
                default:
                    break;
            }
        }
    }
    else
    {
        self.currentStyle = Default;
    }
    [self resetBtnStype:btn.tag];
    if (self.btnClick)
    {
        self.btnClick(self.currentStyle);
    }
}

- (void)resetBtnStype:(NSInteger)currenTag
{
    
    for (NSInteger i = 0; i < self.titleArray.count; i ++)
    {
        UIButton *btn = [self viewWithTag:i + BTNTAG];
        if (btn.tag != currenTag)
        {
            UILabel *labe = [btn viewWithTag:TITLETAG];
            UIImageView *up = [btn viewWithTag:IMAGEUPTAG];
            UIImageView *down = [btn viewWithTag:IMAGEDownTAG];
            labe.textColor = [UIColor blackColor];
            up.highlighted = NO;
            down.highlighted = NO;
        }
    }
}

- (CGFloat)widthWithString:(NSString *)str Font:(UIFont *)font WithHeight:(CGFloat)height
{
    
    CGRect rect = [str boundingRectWithSize:CGSizeMake(MAXFLOAT, height)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:font}
                                     context:nil];
    CGFloat width = rect.size.width;
    return width;
}

@end
