//
//  TableViewCell.h
//  calculateCellHeight
//
//  Created by Mia on 16/3/20.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewModel.h"

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic)TableViewModel *model;

@end
