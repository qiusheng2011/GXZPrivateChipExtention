//
//  GXZPCEEmptyVIew.m
//  avarsha
//
//  Created by gxz on 16/4/28.
//  Copyright © 2016年 avarsha. All rights reserved.
//

#import "GXZPCEmptyVIew.h"

@implementation GXZPCEEmptyVIew


-(void)awakeFromNib
{
    [super awakeFromNib];
    
    [self.retrybutton.layer setCornerRadius:4.0];
    self.retrybutton.layer.borderWidth=1.0;
    [self.retrybutton.layer setMasksToBounds:YES];
   // [self.retrybutton setTintColor:GXZPCE_APP_MainColor];
   // [self.retrybutton.layer setBorderColor:GXZPCE_APP_MainColor.CGColor];
   //[self.TitleLabel setText:@"Hmm..you'are not connected to the internet\n\nPlease try again"];
    NSMutableParagraphStyle *paragraphstyle=[[NSMutableParagraphStyle alloc] init];
    [paragraphstyle setLineSpacing:5.0];
    
    NSAttributedString *titleAttString=[[NSAttributedString alloc] initWithString:@"Hmm..you'are not connected to the internet\nPlease try again" attributes:@{NSParagraphStyleAttributeName:paragraphstyle,NSFontAttributeName:[UIFont systemFontOfSize:15.0],NSForegroundColorAttributeName:GXZPCEUISColorS(130,1.0)}];
    [self.TitleLabel setAttributedText:titleAttString];
    [self.TitleLabel setNumberOfLines:0];
    [self.TitleLabel setTextAlignment:NSTextAlignmentCenter];
    
    
}

@end
