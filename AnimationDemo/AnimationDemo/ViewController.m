//
//  ViewController.m
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/3.
//

#import "ViewController.h"
#import "YZListRowNode.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

/// tableView
@property (nonatomic, strong) UITableView *tableView;
/// 数据
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubviews];
    [self setupData];
}

- (void)setupSubviews {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)setupData {
    // 背景图类似星空的动效
    YZListRowNode *starNode = [YZListRowNode listRowNode:@"背景图类似星空的动效" jumpClassName:@"YZStarSimilarController"]
    ;
    [self.dataArray addObject:starNode];
    
    // 跑马灯用CADisPlayLink实现
    YZListRowNode *paoMaDengNode = [YZListRowNode listRowNode:@"跑马灯用CADisPlayLink实现" jumpClassName:@"YZLabelScrollViewOneController"];
    [self.dataArray addObject:paoMaDengNode];
    
    // 跑马灯用Animation实现
    YZListRowNode *paoMadeng2Node = [YZListRowNode listRowNode:@"跑马灯用Animation实现" jumpClassName:@"YZLabelAnimationController"];
    [self.dataArray addObject:paoMadeng2Node];
    
    // 收藏动效
    YZListRowNode *collectNode = [YZListRowNode listRowNode:@"收藏动效" jumpClassName:@"YZCollectAnimationViewController"];
    [self.dataArray addObject:collectNode];
    
    // 小狐狸的动画
    YZListRowNode *smallFoxNode = [YZListRowNode listRowNode:@"小狐狸的动画" jumpClassName:@"YZSmallFoxAnimationViewController"];
    [self.dataArray addObject:smallFoxNode];
    
    // 数字滚动的效果
    YZListRowNode *numberScrollNode = [YZListRowNode listRowNode:@"数字滚动的效果" jumpClassName:@"YZNumberScrollAnimationController"];
    [self.dataArray addObject:numberScrollNode];
    
    [self.tableView reloadData];
}

#pragma mark - tableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"UITableViewCell"];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
    }
    
    YZListRowNode *starNode = [self.dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = starNode.title;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    YZListRowNode *starNode = [self.dataArray objectAtIndex:indexPath.row];
    NSString *className = starNode.jumpClassName;
    if (className) {
        Class class = NSClassFromString(className);
        UIViewController *vc = [[class alloc] init];
        vc.title = starNode.title;
        [self.navigationController pushViewController:vc animated:YES];
    }
}


#pragma mark - 懒加载
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
