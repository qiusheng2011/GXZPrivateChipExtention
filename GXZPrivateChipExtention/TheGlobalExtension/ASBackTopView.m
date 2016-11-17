//
//  GXZPCEBackTopView.m
//  avarsha
//
//  Created by gxz on 16/5/17.
//  Copyright © 2016年 avarsha. All rights reserved.
//

#import "ASBackTopView.h"
#import <Masonry/Masonry.h>

@implementation GXZPCEBackTopView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//
//}

-(instancetype)init
{
    if(self=[super init])
    {
        
        [self _configView];
        
        
    }
    
    return self;
    
    
}


-(void)_configView
{
    [self setClipsToBounds:YES];
    UIImageView*_imageView=[[UIImageView alloc] init];
    [_imageView setImage:[UIImage imageNamed:@"backtotop_button_asv_1_1"]];
    _imageView.tag=101;
    [_imageView setContentMode:UIViewContentModeCenter];
    [_imageView setBackgroundColor:GXZPCEUISColorS(255.0, 0.8)];
    [self addSubview:_imageView];
   
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self).multipliedBy(0.8);
        make.center.equalTo(self);
    }];
    
    UITapGestureRecognizer *tapges=[[UITapGestureRecognizer alloc] init];
    
    [self addGestureRecognizer:tapges];
    self.tapges=tapges;
    
    //
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.layer.masksToBounds=YES;

    self.layer.shadowColor=GXZPCEUISColorS(0,0.5).CGColor;
    self.layer.shadowOffset=CGSizeMake(0,0);
    self.layer.shadowOpacity=0.4;
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.layer.cornerRadius=self.frame.size.height/2.0;
   // self.layer.shadowRadius=self.frame.size.height/2.0;
    UIImageView*imageView=[self viewWithTag:101];
    imageView.layer.cornerRadius=imageView.frame.size.height/2.0;
    
}


-(void)setIsHiden:(BOOL)isHiden
{
    
    _isHiden=isHiden;
    [self setHidden:isHiden];
    
}
@end
