//
//  UIViewController+GXZPCEGXZ.h
//  avarsha
//
//  Created by gxz on 16/4/9.
//  Copyright © 2016年 avarsha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (GXZPCEGXZ)

+(instancetype)ShareSngileInterface;

-(void)NavigationBACK;
-(UIColor*)preferredNavColor;

-(void)resginNetWorkReachableNotification;

-(void)acceptNetWorkReachableNoti:(NSNotification*)noti;
-(void)resginLoginSuccessNotification;
-(void)acceptNetWorkLogSuccess:(NSNotification*)noti;

-(void)resginLikeProductsSuccessNotification;
-(void)acceptNetWorkLikeProductsSuccess:(NSNotification*)noti;


-(void)acceptNetWorkLike_Single_ProductsSuccess:(NSNotification*)noti;



-(void)resginFollowCollectionSuccessNotification;
-(void)acceptNetWorkFollowCollectionSuccess:(NSNotification*)noti;


-(void)NavigationBACK;

@end
