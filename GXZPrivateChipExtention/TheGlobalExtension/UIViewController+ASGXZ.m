//
//  UIViewController+ASGXZ.m
//  avarsha
//
//  Created by gxz on 16/4/9.
//  Copyright © 2016年 avarsha. All rights reserved.
//

#import "UIViewController+ASGXZ.h"

@implementation UIViewController (ASGXZ)



+(instancetype)ShareSngileInterface
{
    
    
        id selfobject;
        selfobject=[[[self class] alloc] init];
        if([selfobject isKindOfClass:[UIViewController class]])
        {
            [selfobject setHidesBottomBarWhenPushed:YES];
        }
        
   
    
    
    
    return selfobject;
    
}

//-(UIColor*)preferredNavColor
//{
//    return [UIColor whiteColor];
//}

-(void)resginNetWorkReachableNotification
{
    if([self respondsToSelector:@selector(acceptNetWorkReachableNoti:)])
    {
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptNetWorkReachableNoti:) name:kRealReachabilityChangedNotification object:nil];
    }
}


-(void)resginLoginSuccessNotification
{
//    if([self respondsToSelector:@selector(acceptNetWorkLogSuccess:)])
//    {
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptNetWorkLogSuccess:) name:ASNOTIFICATION_LoginSuccess object:nil];
//    }
}

-(void)resginLikeProductsSuccessNotification
{
    if([self respondsToSelector:@selector(acceptNetWorkLikeProductsSuccess:)])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptNetWorkLikeProductsSuccess:) name:AS_NOTIFICATION_FirstLIKEPRODUCT object:nil];
    }
    if([self respondsToSelector:@selector(acceptNetWorkLike_Single_ProductsSuccess:)])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptNetWorkLike_Single_ProductsSuccess:) name:AS_NOTIFICATION_LIKEPRODUCT object:nil];
    }
    
}

-(void)resginFollowCollectionSuccessNotification
{
    
    if([self respondsToSelector:@selector(acceptNetWorkFollowCollectionSuccess:)])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptNetWorkFollowCollectionSuccess:) name:AS_NOTIFICATION_FOLLOW_COLLECTION object:nil];
    }
    
    
}

@end
