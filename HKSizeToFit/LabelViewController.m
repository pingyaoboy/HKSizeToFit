//
//  LabelViewController.m
//  HKSizeToFit
//
//  Created by pyboy on 2017/3/19.
//  Copyright © 2017年 cn.lhangkai. All rights reserved.
//

#import "LabelViewController.h"

@interface LabelViewController ()

@end

@implementation LabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_label setText:_content];
    [_label setBackgroundColor:[UIColor redColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    [self labelFrameReset];
}

// label 文字
- (void) labelFrameReset {
    NSLog(@"修改前:%@", NSStringFromCGRect(_label.frame));
    _label.text = _content;
    // 计算高度
    CGRect labelSize = [_content boundingRectWithSize:CGSizeMake(self.view.frame.size.width, LONG_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: _label.font} context:nil];
    // 调整位置
    CGFloat x = (self.view.frame.size.width - labelSize.size.width) / 2;
    CGFloat y = _label.frame.origin.y;
    CGFloat with = labelSize.size.width;
    CGFloat height = labelSize.size.height;
    
    _label.frame = CGRectMake(x, y, with, height);
    NSLog(@"修改后:%@", NSStringFromCGRect(_label.frame));
    
}

//-(void) back {
//    [self ]
//}

@end
