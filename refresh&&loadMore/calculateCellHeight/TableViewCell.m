//
//  TableViewCell.m
//  calculateCellHeight
//
//  Created by Mia on 16/3/20.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *userContentString;
@property (weak, nonatomic) IBOutlet UIImageView *userContentImage;

@property (weak, nonatomic) IBOutlet UILabel *userName;

@end
@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setModel:(TableViewModel *)model
{
    //必须设置label的最大宽度，不然系统无法计算label的最大高度（方法2代码）
    CGFloat preferredWidth = [UIScreen mainScreen].bounds.size.width - 53;
    self.userName.preferredMaxLayoutWidth = preferredWidth;
    self.userContentString.preferredMaxLayoutWidth = preferredWidth;

    self.headImage.image = model.userHeadImage;
    self.userContentImage.image = model.userContentImage;
    self.userContentString.text = model.userContentString;
    self.userName.text = model.userName;
}


@end
