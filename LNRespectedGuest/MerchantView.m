//
//  MerchantView.m
//  LNRespectedGuest
//
//  Created by Barry on 15/11/27.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "MerchantView.h"
#import "MerchantCell.h"

@interface MerchantView ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataArray;

@end

@implementation MerchantView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    self.tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MerchantCell" bundle:nil] forCellReuseIdentifier:@"guiren"];
}


#pragma mark - tableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MerchantCell *cell = [tableView dequeueReusableCellWithIdentifier:@"guiren" forIndexPath:indexPath];
    if (!cell) {
        cell = [[MerchantCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"guiren"];
    }
    cell.contentImage.image = [UIImage imageNamed:@"scrollView0.jpg"];
    [cell.iconBtn setBackgroundImage:[UIImage imageNamed:@"123.jpg"] forState:UIControlStateNormal];
    
    return cell;
}
//返回行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300.0;
}
//设置行的反选
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
