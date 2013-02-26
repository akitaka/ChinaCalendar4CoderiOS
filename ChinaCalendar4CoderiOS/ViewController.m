//
//  ViewController.m
//  ChinaCalendar4CoderiOS
//
//  Created by Tom HU on 2013/02/21.
//  Copyright (c) 2013年 Tom HU. All rights reserved.
//

#import "ViewController.h"
#import "DataUtil.h"
#import "eventCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [self showDate];
    [self add2GoodLabel];
    [self add2BadLabel];
    [self addFootLabel];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setDateLabel:nil];
    [super viewDidUnload];
}

- (void)showDate
{
    NSString *show = [@"今天是: " stringByAppendingString:[DataUtil today]];
    self.dateLabel.text = show;
}

- (void)add2GoodLabel
{
    _addGoodEventTabel = [[UITableView alloc]initWithFrame:CGRectMake(100, 45, 320, 70)];
    _addGoodEventTabel.backgroundColor = [UIColor colorWithRed:255.0/255.0f green:255.0/255.0f blue:170.0/255.0f alpha:1.0f];
    _addGoodEventTabel.scrollEnabled = NO;
    
    _goodLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _addGoodEventTabel.frame.origin.y, 100, _addGoodEventTabel.frame.size.height)];
    _goodLabel.backgroundColor = [UIColor colorWithRed:255.0/255.0f green:238.0/255.0f blue:68.0/255.0f alpha:1.0f];
    _goodLabel.text = @"宜";
    _goodLabel.font = [UIFont fontWithName:@"Heiti SC" size:30.0f];
    _goodLabel.textAlignment = UITextAlignmentCenter;
    
    [self.view addSubview:_goodLabel];
    [self.view addSubview:_addGoodEventTabel];
}

- (void)add2BadLabel
{
    _addBadEventTabel = [[UITableView alloc]initWithFrame:CGRectMake(100, _addGoodEventTabel.frame.origin.y + _addGoodEventTabel.frame.size.height + 10, 320, 140)];
    _addBadEventTabel.backgroundColor = [UIColor colorWithRed:255.0/255.0f green:211.0/255.0f blue:211.0/255.0f alpha:1.0f];
    _addBadEventTabel.scrollEnabled = NO;
    
    _badLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _addGoodEventTabel.frame.origin.y + _addGoodEventTabel.frame.size.height + 10, 100, _addBadEventTabel.frame.size.height)];
    _badLabel.backgroundColor = [UIColor colorWithRed:255.0/255.0f green:68.0/255.0f blue:68.0/255.0f alpha:1.0f];
    _badLabel.text = @"不宜";
    _badLabel.font = [UIFont fontWithName:@"Heiti SC" size:30.0f];
    _badLabel.textAlignment = UITextAlignmentCenter;
    
    [self.view addSubview:_badLabel];
    [self.view addSubview:_addBadEventTabel];
}

- (void)addFootLabel
{
    _directionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _badLabel.frame.origin.y + _badLabel.frame.size.height + 5, 320, 44)];
    _directionLabel.text = [NSString stringWithFormat:@"座位朝向：面向 %@ 写程序，BUG 最少。",[DataUtil directions]];
    _directionLabel.font = [UIFont fontWithName:@"Heiti SC" size:16.0f];
    _directionLabel.numberOfLines = 2;
    [self.view addSubview:_directionLabel];
    
    _drinkLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _directionLabel.frame.origin.y + _directionLabel.frame.size.height, 320, 44)];
    _drinkLabel.text = [NSString stringWithFormat:@"今日宜饮：%@",[DataUtil drinkValue]];
    _drinkLabel.font = [UIFont fontWithName:@"Heiti SC" size:16.0f];
    [self.view addSubview:_drinkLabel];
    
    _goddesLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _drinkLabel.frame.origin.y + _drinkLabel.frame.size.height, 320, 44)];
    _goddesLabel.text = [NSString stringWithFormat:@"女神亲近指数：%@",[DataUtil goddesValue]];
    _goddesLabel.font = [UIFont fontWithName:@"Heiti SC" size:16.0f];
    [self.view addSubview:_goddesLabel];
}

#pragma tableview

@end
