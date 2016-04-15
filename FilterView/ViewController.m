//
//  ViewController.m
//  FilterView
//
//  Created by ymq on 16/3/14.
//  Copyright © 2016年 ymq. All rights reserved.
//

#import "ViewController.h"
#import "FilterView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    FilterView *view = [[FilterView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40)];
    view.btnClick = ^(BtnStyle style)
    {
        NSLog(@"%@",@(style));
        switch (style)
        {
            case Default:
            {
                
            }
                break;
                
            default:
                break;
        }
    };
    
    [self.view addSubview:view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
