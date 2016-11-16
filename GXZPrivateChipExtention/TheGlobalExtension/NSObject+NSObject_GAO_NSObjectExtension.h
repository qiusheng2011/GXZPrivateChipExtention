//
//  NSObject+NSObject_SWGLG_NSObjectExtension.h
//  四万公里
//
//  Created by gaoxuzhao on 15/7/24.
//  Copyright (c) 2015年 ZhongAngJuHua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (NSObject_GAO_NSObjectExtension)

@property (nonatomic,copy)NSString *classStr;
- (BOOL)getVariableWithClassvarName:(NSString *)name;
- (BOOL) getVariableWithClassvarNameandHasValue:(NSString *)name;
@end
