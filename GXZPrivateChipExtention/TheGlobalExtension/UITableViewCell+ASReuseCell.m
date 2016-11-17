//
//  UITableViewCell+GXZPCEReuseCell.m
//  avarsha
//
//  Created by gxz on 16/4/6.
//  Copyright © 2016年 avarsha. All rights reserved.
//

#import "UITableViewCell+ASReuseCell.h"

@implementation UITableViewCell (GXZPCEReuseCell)





+(UITableViewCell*)addClassCellToTableView:(UITableView*)tableView
{
    
    NSString * cellIdentifier=[NSString stringWithFormat:@"%@_CELLIDENTIFIER",NSStringFromClass([self class])];
    static NSString *cellIdentifier_tmp;
    cellIdentifier_tmp=[[NSString alloc] initWithString:cellIdentifier];
    
    
    
    
    UITableViewCell*cell= [tableView dequeueReusableCellWithIdentifier:cellIdentifier_tmp];
    if(!cell)
    {
    
        [tableView registerClass:[self class] forCellReuseIdentifier:cellIdentifier_tmp];
        
        cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier_tmp];
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;

    
}
+(UITableViewCell*)addCellToTableView:(UITableView*)tableView
{
    
     NSString * cellIdentifier=[NSString stringWithFormat:@"%@_CELLIDENTIFIER",NSStringFromClass([self class])];
    static NSString *cellIdentifier_tmp;
    cellIdentifier_tmp=[[NSString alloc] initWithString:cellIdentifier];
    
    
    
    
    UITableViewCell*cell= [tableView dequeueReusableCellWithIdentifier:cellIdentifier_tmp];
    if(!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellIdentifier_tmp];
        
        cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier_tmp];
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
    
    
    
    
    
}

+(UITableViewCell*)addCellToTableView:(UITableView*)tableView withidentifier:(NSString*)identifier
{
   
    static NSString *cellIdentifier_tmp;
    cellIdentifier_tmp=[[NSString alloc] initWithString:identifier];
    
    
    
    
    UITableViewCell*cell= [tableView dequeueReusableCellWithIdentifier:cellIdentifier_tmp];
    if(!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellIdentifier_tmp];
        
        cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier_tmp];
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

    


@end
