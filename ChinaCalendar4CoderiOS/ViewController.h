//
//  ViewController.h
//  ChinaCalendar4CoderiOS
//
//  Created by Tom HU on 2013/02/21.
//  Copyright (c) 2013年 Tom HU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (nonatomic, retain)IBOutlet UILabel *goodLabel;
@property (nonatomic, retain)IBOutlet UITableView *addGoodEventTabel;
@property (nonatomic, retain)IBOutlet UILabel *badLabel;
@property (nonatomic, retain)IBOutlet UITableView *addBadEventTabel;

@property (nonatomic)IBOutlet UILabel *directionLabel;
@property (nonatomic)IBOutlet UILabel *drinkLabel;
@property (nonatomic)IBOutlet UILabel *goddesLabel;
@end
