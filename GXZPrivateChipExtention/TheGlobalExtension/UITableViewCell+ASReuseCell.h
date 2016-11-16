//
//  UITableViewCell+ASReuseCell.h
//  avarsha
//
//  Created by gxz on 16/4/6.
//  Copyright © 2016年 avarsha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (ASReuseCell)
+(UITableViewCell*)addCellToTableView:(UITableView*)tableView;
+(UITableViewCell*)addClassCellToTableView:(UITableView*)tableView;
+(UITableViewCell*)addCellToTableView:(UITableView*)tableView withidentifier:(NSString*)identifier;
@end
