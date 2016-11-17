//
//  MBProgressHUD+GXZEXtention.h
//  AVarSha
//
//  Created by MD_GAO on 11/19/15.
//  Copyright © 2015 MD_GAO. All rights reserved.
//

//#import <MBProgressHUD/MBProgressHUD.h>

@class MBProgressHUD
@interface MBProgressHUD (GXZEXtention)



+(void)showTextToast:(NSString*)text toView:(UIView*)view withTimeInternal:(CGFloat)internalT ;
+(void)showTextToast:(NSString*)text toView:(UIView*)view withTimeInternal:(CGFloat)internalT completionBlock:(void (^)())completion;
@end
