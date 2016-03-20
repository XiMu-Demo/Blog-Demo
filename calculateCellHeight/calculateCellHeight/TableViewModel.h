//
//  TableViewModel.h
//  calculateCellHeight
//
//  Created by Mia on 16/3/20.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TableViewModel : NSObject
@property (strong ,nonatomic) UIImage *userHeadImage;
@property (copy ,nonatomic) NSString *userName;
@property (copy,nonatomic) NSString *userContentString;
@property (strong ,nonatomic) UIImage *userContentImage;

@property (assign, nonatomic)CGFloat cellHeight;

@end
