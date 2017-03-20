//
//  ViewController.m
//  HKSizeToFit
//
//  Created by pyboy on 2017/3/19.
//  Copyright © 2017年 cn.lhangkai. All rights reserved.
//

#import "ViewController.h"
#import "MainTableViewCell.h"
#import "LabelViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray* datas;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 懒加载，获取数据
    [self lazyLoadData];
    // tableview 自适应大小
    [_tableView sizeToFit];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 懒加载，加载数据
- (void) lazyLoadData {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        // 获取单例
//        NSString* pListName = [[NSBundle mainBundle] pathForResource:@"Datas" ofType:@"plist"];
//        _datas = [NSArray arrayWithContentsOfFile:pListName];
//    });
    if (!_datas) {
        // 获取单例
        NSString* pListName = [[NSBundle mainBundle] pathForResource:@"Datas" ofType:@"plist"];
        _datas = [NSArray arrayWithContentsOfFile:pListName];
    }
//    [_tableView reloadData];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[LabelViewController class]]) {
        LabelViewController* controller = segue.destinationViewController;
        controller.content = @"习近平强调，中美关系对两国、对世界都很重要。\n双方要本着对历史、对子孙负责的精神把握好中美关系的发展方向。\n要加强战略互信，增进对彼此的认知。\n中美共同利益远大于分歧，合作是双方唯一正确选择。\n要从长远和战略角度看待中美关系，拓展合作领域，实现互利共赢。\n要加强地区热点问题上的沟通和协调。\n要尊重彼此核心利益和重大关切，维护中美关系大局稳定。\n要鼓励和扩大两国人民友好往来，不断夯实中美关系的社会基础。";
    }
}

-(IBAction)unwindSegue:(UIStoryboardSegue*)sender {
    NSLog(@"show: %@", sender);
}
- (IBAction)done:(UIStoryboardSegue *)segue {
    // Optional place to read data from closing controller
}
// tableview dataSource delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_datas count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MainTableViewCell" forIndexPath:indexPath];
    cell.text.text = [_datas objectAtIndex:indexPath.row];
    [cell.text sizeToFit];
    [cell sizeToFit];
    return cell;
}

// tableview delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"labelViewController" sender:nil];
}

@end
