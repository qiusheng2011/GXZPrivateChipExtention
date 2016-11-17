//
//  NSString+extention.m
//  avarsha
//
//  Created by gxz on 16/4/18.
//  Copyright © 2016年 avarsha. All rights reserved.
//

#import "NSString+extention.h"

@implementation NSString (extention)


//返回字符串所占用的尺寸.
-(CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}



-(CGSize)sizeWithAttriDIC:(NSDictionary *)dic maxSize:(CGSize)maxSize
{
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
}
@end
