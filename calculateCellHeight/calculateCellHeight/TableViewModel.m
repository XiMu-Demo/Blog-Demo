//
//  TableViewModel.m
//  calculateCellHeight
//
//  Created by Mia on 16/3/20.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "TableViewModel.h"

@implementation TableViewModel

//方法3代码
- (CGFloat)cellHeight{
    // 文字的最大尺寸(设置内容label的最大size，这样才可以计算label的实际高度，需要设置最大宽度，但是最大高度不需要设置，只需要设置为最大浮点值即可)，53为内容label到cell左边的距离
    CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 53, MAXFLOAT);
  
    // 计算内容label的高度
    CGFloat textH = [self.userContentString boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height;
    
    /*
     昵称label和cell的顶部为0
     17为昵称label的高度
     8.5为昵称label和内容label的间距
     textH为内容label的高度
     304为内容image的高度
     */
    _cellHeight = 17 + 8.5 + 8 +textH + 304;
    
    return _cellHeight;
}
@end
