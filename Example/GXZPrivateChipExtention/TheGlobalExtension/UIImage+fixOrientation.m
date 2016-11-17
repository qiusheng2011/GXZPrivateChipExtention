//
//  UIImage+fixOrientation.m
//  四万公里
//
//  Created by gaoxuzhao on 15/8/26.
//  Copyright (c) 2015年 ZhongAngJuHua. All rights reserved.
//

#import "UIImage+fixOrientation.h"
#import  <CoreImage/CoreImage.h>
#import <Accelerate/Accelerate.h>
#import <CoreImage/CoreImage.h>

@implementation UIImage (fixOrientation)

-(UIImage *)fixOrientation {
    
    
    
         // No-op if the orientation is already correct
         if (self.imageOrientation == UIImageOrientationUp) return self;
      
         // We need to calculate the proper transformation to make the image upright.
         // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
         CGAffineTransform transform = CGAffineTransformIdentity;
      
         switch (self.imageOrientation) {
                     case UIImageOrientationDown:
                     case UIImageOrientationDownMirrored:
                         transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
                         transform = CGAffineTransformRotate(transform, M_PI);
                         break;
              
                     case UIImageOrientationLeft:
                     case UIImageOrientationLeftMirrored:
                         transform = CGAffineTransformTranslate(transform, self.size.width, 0);
                         transform = CGAffineTransformRotate(transform, M_PI_2);
                         break;
              
                     case UIImageOrientationRight:
                     case UIImageOrientationRightMirrored:
                         transform = CGAffineTransformTranslate(transform, 0, self.size.height);
                         transform = CGAffineTransformRotate(transform, -M_PI_2);
                         break;
                     case UIImageOrientationUp:
                     case UIImageOrientationUpMirrored:
                         break;
             }
      
         switch (self.imageOrientation) {
                     case UIImageOrientationUpMirrored:
                     case UIImageOrientationDownMirrored:
                         transform = CGAffineTransformTranslate(transform, self.size.width, 0);
                         transform = CGAffineTransformScale(transform, -1, 1);
                         break;
              
                     case UIImageOrientationLeftMirrored:
                     case UIImageOrientationRightMirrored:
                         transform = CGAffineTransformTranslate(transform, self.size.height, 0);
                         transform = CGAffineTransformScale(transform, -1, 1);
                         break;
                     case UIImageOrientationUp:
                     case UIImageOrientationDown:
                     case UIImageOrientationLeft:
                     case UIImageOrientationRight:
                         break;
             }
      
         // Now we draw the underlying CGImage into a new context, applying the transform
         // calculated above.
         CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                                                                                CGImageGetBitsPerComponent(self.CGImage), 0,
                                                                                                CGImageGetColorSpace(self.CGImage),
                                                                                                CGImageGetBitmapInfo(self.CGImage));
         CGContextConcatCTM(ctx, transform);
         switch (self.imageOrientation) {
                     case UIImageOrientationLeft:
                     case UIImageOrientationLeftMirrored:
                     case UIImageOrientationRight:
                     case UIImageOrientationRightMirrored:
                         // Grr...
                         CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
                         break;
              
                     default:
                         CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
                         break;
             }
      
         // And now we just create a new UIImage from the drawing context
         CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
         UIImage *img = [UIImage imageWithCGImage:cgimg];
         CGContextRelease(ctx);
         CGImageRelease(cgimg);
         return img;
     }



- (UIImage*)gaussBlur:(CGFloat)blurLevel andImage:(UIImage*)originImage
{
   // blurLevel = MIN(1.0,MAX(0.0, blurLevel));
    
    //int boxSize = (int)(blurLevel * 0.1 * MIN(self.size.width, self.size.height));
    int boxSize = 50;//模糊度。
    boxSize = boxSize - (boxSize % 2) + 1;
    
    NSData *imageData = UIImageJPEGRepresentation(originImage, 1);
    UIImage *tmpImage = [UIImage imageWithData:imageData];
    
    CGImageRef img = tmpImage.CGImage;
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    
    //create vImage_Buffer with data from CGImageRef
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    //create vImage_Buffer for output
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) *CGImageGetHeight(img));
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    NSInteger windowR = boxSize/2;
    CGFloat sig2 = windowR / 3.0;
    if(windowR>0){ sig2 = -1/(2*sig2*sig2); }
    
    int16_t *kernel = (int16_t*)malloc(boxSize*sizeof(int16_t));
    int32_t sum = 0;
    for ( NSInteger i= 0 ; i<boxSize; ++i){
        
        kernel[i] = 255 * exp (sig2*(i-windowR)*(i-windowR));
        
        sum += kernel[i];
        
    }
        free(kernel);
        // convolution
//        error = vImageConvolve_ARGB8888(&inBuffer, &outBuffer,NULL, 0, 0, kernel, boxSize, 1, sum, NULL, kvImageEdgeExtend);
//        error = vImageConvolve_ARGB8888(&outBuffer, &inBuffer,NULL, 0, 0, kernel, 1, boxSize, sum, NULL, kvImageEdgeExtend);
//        outBuffer = inBuffer;
//        
//        if (error) {
//            ////NSLog(@"error from convolution %ld", error);
//        }
    
        CGColorSpaceRef colorSpace =CGColorSpaceCreateDeviceRGB();
        CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                                 outBuffer.width,
                                                 outBuffer.height,
                                                 8,
                                                 outBuffer.rowBytes,
                                                 colorSpace,
                                                 kCGBitmapAlphaInfoMask &kCGImageAlphaNoneSkipLast);
        CGImageRef imageRef =CGBitmapContextCreateImage(ctx);
        UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
        
        //clean up
        CGContextRelease(ctx);
        CGColorSpaceRelease(colorSpace);
        free(pixelBuffer);
        CFRelease(inBitmapData);
        CGImageRelease(imageRef);
        
        return returnImage;
 }

-(UIImage*)imageByScalingToSize:(CGSize)targetSize
{
    UIImage *sourceImage =self;
    UIImage*newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height= imageSize.height;
    CGFloat targetWidth= targetSize.width;
    CGFloat targetHeight=targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaleWidth =targetWidth;
    CGFloat scaleHeight = targetHeight;
    
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO) {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if (widthFactor < heightFactor)
            scaleFactor = widthFactor;
        else
            scaleFactor = heightFactor;
        scaleWidth  = width * scaleFactor;
        scaleHeight = height * scaleFactor;
        // center the image
        if (widthFactor < heightFactor) {
            
            thumbnailPoint.y = (targetHeight - scaleHeight) * 0.5;
        } else if (widthFactor > heightFactor) {
            thumbnailPoint.x = (targetWidth - scaleWidth) * 0.5;
        }
    }
    UIGraphicsBeginImageContext(targetSize);
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaleWidth;
    thumbnailRect.size.height = scaleHeight;
    [sourceImage drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    if(newImage == nil)
        NSLog(@"could not scale image");
    return newImage ;
    
}




-(UIImage*)coreBlurImageWithBlurNumber:(CGFloat)blur
{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage  *inputImage=[CIImage imageWithCGImage:self.CGImage];
    //设置filter
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:@(blur) forKey: @"inputRadius"];
    //模糊图片
    CIImage *result=[filter valueForKey:kCIOutputImageKey];
    CGImageRef outImage=[context createCGImage:result fromRect:[result extent]];
    UIImage *blurImage=[UIImage imageWithCGImage:outImage];
    CGImageRelease(outImage);
    return blurImage;
    
    
}
  
 @end
