//
//  UIView+LoadDefineNib.m
//  要成长
//
//  Created by root on 15-5-5.
//  Copyright (c) 2015年 YCZ. All rights reserved.
//

#import "UIView+LoadDefineNib.h"

@implementation UIView (LoadDefineNib)



+(instancetype)loadDefineNIB
{
    
    
    NSString * className=NSStringFromClass(self);
    if([className containsString:@"."])
    {
        className=[className componentsSeparatedByString:@"."][1];
        
    }
    
    return [[[NSBundle mainBundle] loadNibNamed:className owner:nil options:nil] lastObject];
    
}

@end
