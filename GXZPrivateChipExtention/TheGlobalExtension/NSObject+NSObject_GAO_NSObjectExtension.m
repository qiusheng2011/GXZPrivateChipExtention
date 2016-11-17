//
//  NSObject+NSObject_SWGLG_NSObjectExtension.m
//  四万公里
//
//  Created by gaoxuzhao on 15/7/24.
//  Copyright (c) 2015年 ZhongAngJuHua. All rights reserved.
//

#import "NSObject+NSObject_GAO_NSObjectExtension.h"
#import  <objc/runtime.h>
@implementation NSObject (NSObject_GAO_NSObjectExtension)
@dynamic classStr

-(NSString*)classStr
{
    return NSStringFromClass([self class]);
    
    
}



- (BOOL) getVariableWithClassvarName:(NSString *)name{
    unsigned int outCount=0, i=0;
    Ivar *ivars = class_copyIvarList([self class], &outCount);
    for (i = 0; i < outCount; i++) {
        Ivar property = ivars[i];
        NSString *keyName = [NSString stringWithCString:ivar_getName(property) encoding:NSUTF8StringEncoding];
               keyName = [keyName   stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:@""];
        if ([keyName isEqualToString:name]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL) getVariableWithClassvarNameandHasValue:(NSString *)name{
    unsigned int outCount=0, i=0;
    Ivar *ivars = class_copyIvarList([self class], &outCount);
    for (i = 0; i < outCount; i++) {
        Ivar property = ivars[i];
        NSString *keyName = [NSString stringWithCString:ivar_getName(property) encoding:NSUTF8StringEncoding];
        keyName = [keyName   stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:@""];
        if ([keyName isEqualToString:name]) {
            if(([[self  valueForKey:keyName] isEqualToString:@""])&&([self  valueForKey:keyName]==nil))
            {
                free(ivars);
                return NO;
            }
            else
            {
                free(ivars);
                return YES;
            }
        }
    }
    return NO;
}
@end
