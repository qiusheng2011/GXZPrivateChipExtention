//
//  UIImage+fixOrientation.h
//  四万公里
//
//  Created by gaoxuzhao on 15/8/26.
//  Copyright (c) 2015年 ZhongAngJuHua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (fixOrientation)
-(UIImage *)fixOrientation;
- (UIImage*)gaussBlur:(CGFloat)blurLevel andImage:(UIImage*)originImage;
-(UIImage*)imageByScalingToSize:(CGSize)targetSize;

// 模糊处理

-(UIImage*)coreBlurImageWithBlurNumber:(CGFloat)blur;
@end
