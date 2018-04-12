//
//  EZHeartHeatView.h
//  EZKit
//
//  Created by macbook pro on 2018/4/12.
//  Copyright © 2018年 sheep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZHeartHeatView : UIView

///心形颜色 默认红色
@property(nonatomic,strong)UIColor *fillColor;
///边界颜色 默认黄色
@property(nonatomic,strong)UIColor *lineColor;
///动画时间间隔 默认 0.5
@property(nonatomic,assign)CGFloat duration;
///动画重复次数 默认 max
@property(nonatomic,assign)CGFloat repeatCount;
///图形放大倍数 默认 1.1
@property(nonatomic,assign)CGFloat scale;

+(instancetype)heartView:(CGRect)frame;

@end
