//
//  AnimationController.m
//  EZKit
//
//  Created by macbook pro on 2018/4/12.
//  Copyright © 2018年 sheep. All rights reserved.
//

#import "AnimationController.h"
#import "EZHeartHeatView.h"


@interface AnimationController ()

@end

@implementation AnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    EZHeartHeatView *heart = [EZHeartHeatView heartView:CGRectMake(10, 220, 100, 100)];
    [self.view addSubview:heart];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    EZHeartHeatView *hearView = [EZHeartHeatView new];
    hearView.backgroundColor = [UIColor whiteColor];
    hearView.frame = CGRectMake(10, 100, 100, 100);
    [self.view addSubview:hearView];
    
    float bigSize = 1.1;
    CABasicAnimation *pulseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulseAnimation.duration = 0.5;
    pulseAnimation.toValue = [NSNumber numberWithFloat:bigSize];
    pulseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    pulseAnimation.autoreverses = YES;
    pulseAnimation.repeatCount = FLT_MAX;

    [hearView.layer addAnimation:pulseAnimation forKey:@"transform.scale"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
