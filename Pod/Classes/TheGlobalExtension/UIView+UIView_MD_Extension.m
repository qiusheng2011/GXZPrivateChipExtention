//
//  UIView+UIView_MD_Extension.m
//  四万公里
//
//  Created by gaoxuzhao on 15/4/3.
//  Copyright (c) 2015年 ZhongAngJuHua. All rights reserved.
//

#import "UIView+UIView_MD_Extension.h"

@implementation UIView (UIView_MD_Extension)


+(id)loaddefinemyselfViewWithXib
{
    
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    
}



-(NSMutableArray*)getSubviews:(UIView*)subView SubViewType:(Class)class{
    static NSMutableArray * tempArray;
    
    if(subView.subviews.count>0)
    {
        for (UIView *subViewTemp in subView.subviews)
        {
             if([subViewTemp isKindOfClass:class])
             {
                 if(!tempArray)
                 {
                     tempArray=[[NSMutableArray alloc] init];
                 }
                 [tempArray addObject:subViewTemp];
                 
             }
            
            [self getSubviews:subViewTemp SubViewType:class];
        }
    }
    else
    {  //  //NSLog(@"%i",subView.subviews.count);
        return tempArray;
    }
    
    return tempArray;
}

- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}



@end
