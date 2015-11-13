//
//  ViewController.m
//  TableViewCell自适应大小
//
//  Created by 艾葭 on 15/11/11.
//  Copyright © 2015年 艾葭. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate   = self;
    
//    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    [self.view addSubview:self.tableView];
    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    self.tableView.tableHeaderView = header;
    UIView *footer = [[UIView alloc]init];
    self.tableView.tableFooterView = footer;
    
    self.data = @[@"bldhgflsadgf;sdakgfulidfgs;dgfyefglsafguyasftowuafuasyfskfchsfcksdafdufksdkhctrdsyuvcshgctyafvdskhfrtfuwekfdskuyftekwfkshyfkwvckuystdkuwafdisyafdkhdsysjvchjsagfdsavkdghsf",@"cbsavfhgsadhsvchgcvmscvdschgsfkhsvchsdagf",@"jhgdsfkytfbcjkdhftsabcsdtfsbcdfcsfskahgcasuytrflwdbvsajfhgsauykflsjcvksvcgldjsa;hsadfhsd;kfjhdfiauwefhsakjfhdlkjfgdksbckdjlsagfakjdsfgldshjgfdkjslfgdlsjkgfldskjgflksdjgaflsgdfldsgflsdgflsdgcksbdkfjgjlsdcbm,snbcjdkhfglsadjglsdgfldsgflsdafgsdlfgsljfglsdhajfglsadjgflasdgfldsacjdshfdjkfvkusydfdsvjfgdvgdjkfuykfvdskjacglsadfgudgfjdskvgckdsgfjhksadfgksdfgkjsa",@"shjfksjfgks",@"hjkgskdjfgsljFKSHFKSGFSHGFDSKFGKDSBKJSDGldslDSGlgdlsagLgldgLgdlaGLDGSljcgljdsgCkusdjvhgsdkfgvgldagvldagvldagl"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.textLabel.numberOfLines = 100;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.text = self.data[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString* text = self.data[indexPath.row];
    
    CGSize constraint = CGSizeMake(375-40, 100);
    
    
    NSAttributedString* attributedText = [[NSAttributedString alloc]initWithString:text attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    
    //根据label内容大小自适应，计算本文尺寸
    CGRect rect = [attributedText boundingRectWithSize:constraint options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    //NSStringDrawingUsesLineFragmentOrigin:整个文本将以每行组成的矩形为单位计算整个文本的尺寸
    CGSize size = rect.size;
    
    CGFloat height = MAX(size.height, 20);
    NSLog(@"%f",height);
    return height+10;
    
    
}
@end
