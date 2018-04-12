//
//  EZDateFormater.m
//  EZKit
//
//  Created by macbook pro on 2018/3/22.
//  Copyright © 2018年 sheep. All rights reserved.
//

#import "EZDateFormater.h"
#import <UIKit/UIKit.h>

#ifdef DEBUG
#define EZLog(...) NSLog(__VA_ARGS__)
#else
#define EZLog(...)
#endif

@interface EZDateFormater()

@property(nonatomic,strong)NSCache *dateFormaters;

@end

@implementation EZDateFormater

-(instancetype)init{
    if (self = [super init]) {
        _dateFormaters = [[NSCache alloc] init];
        _dateFormaters.delegate = self;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeAllObjects) name:NSCurrentLocaleDidChangeNotification  object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeAllObjects) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    }
    return self;
}

+(instancetype)shareInstance{
    static EZDateFormater *dateformater = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateformater = [[EZDateFormater alloc] init];
    });
    return dateformater;
}






- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - notification
-(void)removeAllObjects{
    
}

#pragma mark - NSCacheDelegate
-(void)cache:(NSCache *)cache willEvictObject:(id)obj{
    EZLog(@"cache removed : %@",obj);
}
@end
