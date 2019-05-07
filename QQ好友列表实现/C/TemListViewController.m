//
//  TemListViewController.m
//  QQ好友列表实现
//
//  Created by 曹记 on 2019/5/7.
//  Copyright © 2019 曹记. All rights reserved.
//

#import "TemListViewController.h"
#import "QQFriendCell.h"

#define Cell_QQFriend   @"Cell_QQFriend_ID"

@interface TemListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView* tableView;
//总数据
@property (nonatomic,strong) NSMutableArray* dataArray;
//每个分组的标题
@property (nonatomic,strong) NSMutableArray* sectionArray;
//每个分组是否展开的BOOL值
@property (nonatomic,strong) NSMutableArray* boolArray;
@end

@implementation TemListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title =@"联系人";
   //[self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadData ];
    [self addSubviews];
    [self makeConstraintsForUI];
}

/**
 *没有网络数据构造数据
 */
-(void)loadData{
    NSArray* sectionArray = @[@"你认识我时┅┇", @"┇┅我不认识你", @"你喜欢我时┅┇", @"┇┅我才认识你", @"你爱上我时┅┇",@"┇┅我才喜欢你",@"你离开我时┅┇",@"┇┅我才爱上你"];
    NSArray* rowArray = @[@(4), @(3), @(5), @(6), @(8),@(2),@(7),@(10)];
    for (int i = 0; i < sectionArray.count; i++) {
        NSMutableArray* friendArray = [NSMutableArray array];
        for (int j = 0; j <[rowArray[i] intValue]; j++) {
            [friendArray addObject:@(j)];
        }
        [self.dataArray addObject:friendArray];
        [self.boolArray addObject:@NO];
        [self.sectionArray addObject:sectionArray[i]];
    }
    
}
#pragma mark - add subviews
-(void)addSubviews{
    [self .view addSubview:self.tableView ];
}
#pragma mark - make constraints
-(void)makeConstraintsForUI{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT));
        make.left.mas_equalTo(@0);
        make.top.mas_equalTo(@0);
    }];
}
#pragma mark - tableView delegate and dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([self.boolArray[section] boolValue] == NO) {
        return 0;
    }else{
        return [self.dataArray[section] count];
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QQFriendCell * cell = [tableView dequeueReusableCellWithIdentifier:Cell_QQFriend forIndexPath:indexPath];
    
    if (indexPath.row < [self.dataArray[indexPath.section] count]) {
        //这里可以传入请求的数据，此方法可以根据自己的需求做更改
        [cell configCellWithData:nil row:indexPath.row];
    }
    return cell;
    
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView* headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    headerView.tag = 2019 + section;
    headerView.backgroundColor = [UIColor colorWithRed:247/255.0 green:249/255.0 blue:251/255.0 alpha:1];
    //添加imageview
    UIImageView * iv = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 20, 20)];
    //三目运算选择展开或者闭合时候的图标
    iv.image = [self.boolArray[section] boolValue] ? [UIImage imageNamed:@"Expand"] : [UIImage imageNamed:@"zhankai-2"];
    [headerView addSubview:iv];
    
    //添加标题label
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(35, 0, SCREEN_WIDTH - 100, 50)];
    label.text = self.sectionArray[section];
    [headerView addSubview:label];
    
    //添加分组人数和在线人数显示的label
    UILabel * labelR = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 60, 0, 60, 50)];
    labelR.textAlignment = NSTextAlignmentCenter;
    //这里小编把在线人数全部设置成了0，可以根据需求更改
    labelR.text = [NSString stringWithFormat:@"%lu/%lu", [self.dataArray[section] count]-1, [self.dataArray[section] count]];
    [headerView addSubview:labelR];
    
    //添加轻扣手势
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGR:)];
    [headerView addGestureRecognizer:tap];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70;
}

#pragma mark - action
- (void)tapGR:(UITapGestureRecognizer *)tapGR {
    
    //获取section
    NSInteger section = tapGR.view.tag - 2019;
    //判断改变bool值
    if ([self.boolArray[section] boolValue] == YES) {
        [self.boolArray replaceObjectAtIndex:section withObject:@NO];
    }else {
        [self.boolArray replaceObjectAtIndex:section withObject:@YES];
    }
    //刷新某个section
    [_tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - setter and getter

- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[QQFriendCell class] forCellReuseIdentifier:Cell_QQFriend];
        //下面这行代码可以避免分组都没展开时，空白处出现的横线
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}

- (NSMutableArray *)dataArray {
    
    if (!_dataArray) {
        
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

- (NSMutableArray *)sectionArray {
    
    if (!_sectionArray) {
        
        _sectionArray = [[NSMutableArray alloc] init];
    }
    return _sectionArray;
}

- (NSMutableArray *)boolArray {
    
    if (!_boolArray) {
        
        _boolArray = [[NSMutableArray alloc] init];
    }
    return _boolArray;
}

@end
