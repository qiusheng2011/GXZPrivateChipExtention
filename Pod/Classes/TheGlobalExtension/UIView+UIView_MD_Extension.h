//
//  UIView+UIView_MD_Extension.h
//  四万公里
//
//  Created by gaoxuzhao on 15/4/3.
//  Copyright (c) 2015年 ZhongAngJuHua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIView_MD_Extension)

// 生成自定义的带xib 的View
+(id)loaddefinemyselfViewWithXib;


-(NSMutableArray*)getSubviews:(UIView*)subView SubViewType:(Class)class;

- (UIViewController *)viewController;
@end
