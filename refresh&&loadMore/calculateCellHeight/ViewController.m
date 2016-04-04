//
//  ViewController.m
//  calculateCellHeight
//
//  Created by Mia on 16/3/20.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "TableViewModel.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong ,nonatomic)NSMutableArray *modelArray;
@end

@implementation ViewController

static NSString *const CellId = @"cell";

- (void)viewDidLoad{
    [self.tableView registerNib:[UINib nibWithNibName:( NSStringFromClass([TableViewCell class])) bundle:nil] forCellReuseIdentifier:CellId];
    
    self.modelArray = [NSMutableArray array];
    for (int i =1 ; i<6; i++) {
        TableViewModel *model = [[TableViewModel alloc ]init];
        model.userHeadImage = [UIImage imageNamed:[NSString stringWithFormat:@"%zd",i]];
        model.userContentImage = [UIImage imageNamed:[NSString stringWithFormat:@"%zd",i]];
        model.userName = @"昵称";
        model.userContentString =  [self  getText:@"内容" withRepeat:i * 20 + 1];
        [self.modelArray addObject:model];
    }
    
    [self.tableView reloadData];
    
    /*iOS 8自动计算（方法一代码）
    self.tableView.estimatedRowHeight = 80.0f;
    self.tableView.rowHeight = UITableViewAutomaticDimension
     */
}

// 重复字符串N次
- (NSString *)getText:(NSString *)text withRepeat:(int)repeat {
    NSMutableString *String = [NSMutableString new];
    
    for (int i = 0; i < repeat; i++) {
        [String appendString:text];
    }
    
    return String;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;
}


- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    cell.model =  self.modelArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

/*方法2代码

    static TableViewCell *Cell;
    static dispatch_once_t onceToken;
    //必须使用
    dispatch_once(&onceToken, ^{
        Cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    });

   TableViewModel *model = self.modelArray[indexPath.row];
    Cell.model = model;
    // 根据当前数据，计算Cell的高度，注意+1是contentview和cell之间的分割线高度
    model.cellHeight = [Cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height +1.0f;
    
   return model.cellHeight;
 */
    
    //方法3代码
   TableViewModel *model =  self.modelArray[indexPath.row];
    return model.cellHeight;

}
//方法2代码
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 112.0f;
}

@end
