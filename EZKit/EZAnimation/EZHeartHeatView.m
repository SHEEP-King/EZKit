//
//  EZHeartHeatView.m
//  EZKit
//
//  Created by macbook pro on 2018/4/12.
//  Copyright © 2018年 sheep. All rights reserved.
//

#import "EZHeartHeatView.h"

#define kHeartPadding 4.0

@interface EZHeartHeatView()

@end

@implementation EZHeartHeatView

+(instancetype)heartView:(CGRect)frame{
    
    EZHeartHeatView *hearView = [[EZHeartHeatView alloc] initWithFrame:frame];
    
    
    [hearView.layer addAnimation:[hearView animationScale] forKey:@"transform.scale"];
    
    return hearView;
}


/** keyPath
    @"transform.scale"  比例转换
    @"transform.scale.x"  宽的比例转换
    @"transform.scale.y"  高的比例转换
    @"transform.rotation.z"  平面圆的旋转
    @"opacity"  透明度
    @"backgroundColor"  背景颜色
    @“cornerRadius” 圆角
    @“bounds” cgrect
    @“borderWidth”
    @“contents”
    @“contentsRect”
    @“frame”
    @“hidden”
    @“mask”
    @“maskToBounds”
    @“position”
    @“shadowColor”
    @“shadowOffset“
    @“shadowOpacity”
    @“shadowRadius”
 */
-(CABasicAnimation *)animationScale{
    float bigSize = 1.1;
    CABasicAnimation *pulseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulseAnimation.duration = 0.5;
    //from (默认原来状态)- to 。。。
    pulseAnimation.toValue = [NSNumber numberWithFloat:bigSize];
    //可选动画效果
    pulseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    //自动反转
    pulseAnimation.autoreverses = YES;
    //重复次数
    pulseAnimation.repeatCount = FLT_MAX;
    return pulseAnimation;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    /**心形画法分析
     心形分为四个部分，上面两个二分之一的半径为r的小圆型。
     下面两个曲线，以(toPoint.x,toPoint.y+r) 为控制点。
     r = w - 2*padding / 4.0
     起点可以选在最低点
     */
    //半径
    CGFloat r = (rect.size.width - 2 * kHeartPadding) / 4.0;
    CGPoint toLeftPoint = CGPointMake(kHeartPadding, r + kHeartPadding);
    CGPoint toLeftPointControl = CGPointMake(kHeartPadding, 2 * r + kHeartPadding);
    //CGPoint toRightPoint = CGPointMake(rect.size.width - kHeartPadding, r + kHeartPadding);
    CGPoint toRightPointControl = CGPointMake(rect.size.width - kHeartPadding, 2 * r + kHeartPadding);
    
    CGPoint leftCenter = CGPointMake(kHeartPadding + r, r + kHeartPadding);
    CGPoint rightCenter = CGPointMake(rect.size.width - kHeartPadding - r, r + kHeartPadding);
    
    UIBezierPath *heartPath = [UIBezierPath bezierPath];
    
    //最低点
    CGPoint start = CGPointMake(rect.size.width / 2.0  , rect.size.height - kHeartPadding );
    
    [heartPath moveToPoint:start];
    //左下弧线
    [heartPath addQuadCurveToPoint:toLeftPoint controlPoint:toLeftPointControl];
    //左上半圆
    [heartPath addArcWithCenter:leftCenter radius:r startAngle:M_PI endAngle:0 clockwise:YES];
    //右上半圆
    [heartPath addArcWithCenter:rightCenter radius:r startAngle:M_PI endAngle:0 clockwise:YES];
    //右下曲线
    [heartPath addQuadCurveToPoint:start controlPoint:toRightPointControl];
    
    [[UIColor redColor] setFill];
    
    [heartPath fill];
    
    heartPath.lineWidth = 2;
    heartPath.lineCapStyle = kCGLineCapRound;
    heartPath.lineJoinStyle = kCGLineJoinRound;
    
    [[UIColor yellowColor] setStroke];
    [heartPath stroke];
    
}


@end
