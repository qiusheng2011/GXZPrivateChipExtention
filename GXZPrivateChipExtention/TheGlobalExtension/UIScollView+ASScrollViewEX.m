//
//  UIScollView+GXZPCEScrollViewEX.m
//  avarsha
//
//  Created by gxz on 16/5/17.
//  Copyright © 2016年 avarsha. All rights reserved.
//

#import "UIScollView+ASScrollViewEX.h"
#import <objc/runtime.h>


@implementation UIScrollView (GXZPCEScrollViewEX)
@dynamic   backTopView,backTopViewHiden;


static   GXZPCEBackTopView * btview=nil;
static   bool   ishiden=YES;
-(void)setBackTopView:(GXZPCEBackTopView *)backTopView
{
    
    objc_setAssociatedObject(self, &btview, backTopView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(GXZPCEBackTopView*)backTopView
{
    
    return  objc_getAssociatedObject(self, &btview);
}


-(void)setBackTopViewHiden:(BOOL)backTopViewHiden
{
    ishiden=backTopViewHiden;
}

-(BOOL)backTopViewHiden
{
    return  ishiden;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView Bottom:(CGFloat)height
{
    
    [self scrollViewDidScroll:scrollView Bottom:height indexViewInteger:0];
    
}

-(void)scrollToTopVisable
{
    [self scrollRectToVisible:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height) animated:YES];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView Bottom:(CGFloat)height indexViewInteger:(NSInteger)index
{
    
    
    if(self.backTopViewHiden||(!scrollView))
    {
        return;
    }
    
    //    if(!self.backTopView)
    //    {
    //        GXZPCEBackTopView *backtopView=[[GXZPCEBackTopView alloc] init];
    //        [self  insertSubview:backtopView atIndex:0];
    //         self.backTopView=backtopView;
    //         [backtopView mas_makeConstraints:^(MGXZPCEConstraintMaker *make) {
    //             make.size.equalTo(scrollView).multipliedBy(0.1);
    //             make.bottom.equalTo(scrollView).offset(-20.0);
    //             make.trailing.equalTo(scrollView).offset(-20.0);
    //         }];
    //        [backtopView.tapges addTarget:self action:@selector(scrollsToTop)];
    //        [self updateConstraints];
    //    }
    if(scrollView.contentOffset.y>(scrollView.frame.size.height*2))
    {
        if(!self.backTopView)
        {
            GXZPCEBackTopView *backtopView=[[GXZPCEBackTopView alloc] init];
            // [scrollView insertSubview:backtopView atIndex:0];
            [backtopView setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-80,scrollView.frame.size.height-height, 60, 60)];
            [scrollView.superview  insertSubview:backtopView atIndex:index];
            self.backTopView=backtopView;
            [scrollView setScrollsToTop:YES];
            
            [backtopView.tapges addTarget:scrollView action:@selector(scrollToTopVisable)];
            // [scrollView updateConstraints];
        }
        else
        {
            [self.backTopView setHidden:NO];
        }
        
    }
    else
    {
        if(self.backTopView)
        {
            [self.backTopView setHidden:YES];
        }
    }
    
    if(self.backTopView )
    {
        
        //        [self.backTopView mas_updateConstraints:^(MGXZPCEConstraintMaker *make) {
        //            make.bottom.equalTo(self).offset(20.0+scrollView.contentOffset.y);
        //        }];
    }

    
}





@end
