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
    
    self.tableView.estimatedRowHeight = 80.0f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
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


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    
//}
@end
