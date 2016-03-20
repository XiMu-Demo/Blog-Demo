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
    self.headImage.image = model.userHeadImage;
    self.userContentImage.image = model.userContentImage;
    self.userContentString.text = model.userContentString;
    self.userName.text = model.userName;
}


@end
