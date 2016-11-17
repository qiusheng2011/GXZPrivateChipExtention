//
//  UIScollView+GXZPCEScrollViewEX.h
//  avarsha
//
//  Created by gxz on 16/5/17.
//  Copyright © 2016年 avarsha. All rights reserved.
//

#import "ASBackTopView.h"
@interface UIScrollView (GXZPCEScrollViewEX)

@property (nonatomic,weak) GXZPCEBackTopView* backTopView;
@property (nonatomic,assign)BOOL backTopViewHiden;
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView Bottom:(CGFloat)height;

- (void)scrollViewDidScroll:(UIScrollView *)scrollView Bottom:(CGFloat)height indexViewInteger:(NSInteger)index;

-(void)scrollToTopVisable;
@end
