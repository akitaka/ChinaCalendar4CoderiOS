//
//  DataUtil.m
//  ChinaCalendar4CoderiOS
//
//  Created by Tom HU on 2013/02/21.
//  Copyright (c) 2013年 Tom HU. All rights reserved.
//

#import "DataUtil.h"

@implementation DataUtil
@synthesize addGoods = _addGoods, addBads = _addBads;

- (id)init
{
    if ((self = [super init])) {
        self.addGoods = [[NSMutableArray alloc]init];
        self.addBads = [[NSMutableArray alloc]init];
    }
    return self;
}

+ (NSString *)today
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    now = [NSDate date];
    comps = [calendar components:unitFlags fromDate:now];
    NSInteger week = [comps weekday] - 1;
    NSInteger year = [comps year];
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    
    NSString *sWeek = [[[self getData]objectForKey:@"weeks"]objectAtIndex:week];
    
    NSString *myDate = [NSString stringWithFormat:@"%d年%d月%d日 星期%@",year,month,day,sWeek];
    return myDate;
}

+ (NSDictionary *)getData
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"json"];
    NSString *myJSONString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    
    NSError *error;
    NSDictionary *myJSON = [NSJSONSerialization JSONObjectWithData:[myJSONString dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    
    return myJSON;
}

//var iday = today.getFullYear() * 10000 + (today.getMonth() + 1) * 100 + today.getDate();
+ (NSInteger)iday
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    now = [NSDate date];
    comps = [calendar components:unitFlags fromDate:now];
    NSInteger year = [comps year];
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    return year * 10000 + month * 100 + day;
}

//伪随机，以当天为种子
+ (NSInteger)random:(int)dayseed index:(int)indexseed
{
    int n = dayseed % 11117;
	for (int i = 0; i < 100 + indexseed; i++) {
		n = n * n;
		n = n % 11117;   // 11117 是个质数
	}
    return n;
}

//生成今日运势
//var numGood = random(iday, 98) % 3 + 2;
//var numBad = random(iday, 87) % 3 + 2;
//var eventArr = pickRandomActivity(numGood + numBad);
//
//var specialSize = pickSpecials();
//
+ (id)pickTodaysLuck
{
    int numGood = [self random:[self iday] index:98] % 3 + 2;
    int numBad = [self random:[self iday] index:87] % 3 + 2;
    
//for (var i = 0; i < numGood; i++) {
//    addToGood(eventArr[i]);
//}
//
//for (var i = 0; i < numBad; i++) {
//    addToBad(eventArr[numGood + i]);
//}
    for (int i = 0; i < numGood; i++) {
        
    }
    
    for (int x = 0; x < numBad; x++) {
        
    }
    return 0;
}

//添加预定义事件
+ (NSArray *)pickSpecials
{
    NSArray *specialSize = [[NSArray alloc]initWithObjects:0 ,0 , nil];
    return specialSize;
}

//从 activities 中随机挑选 size 个
+ (NSArray *)pickRandomActivity:(NSInteger)size
{
    NSMutableArray *picked_events = [[NSMutableArray alloc]initWithArray:[self pickRandom:[[self getData]objectForKey:@"activities"] size:size]];
    for (int i = 0; i < [picked_events count]; i++) {
        [picked_events replaceObjectAtIndex:i withObject:[self parse:[picked_events objectAtIndex:i]]];
    }
    return picked_events;
}

//从数组中随机挑选 size 个
+ (id)pickRandom:(NSArray *)array size:(NSInteger)size
{
    NSMutableArray *result = [[NSMutableArray alloc]initWithArray:array];
    
    for (int j = 0; j < [array count] - size; j++) {
        [result removeObjectAtIndex:[self random:[self iday] index:j] % [result count]];
    }
    return result;
}

//解析占位符并替换成随机内容
+ (NSString *)parse:(NSString *)event
{
#pragma TODO:
    return event;
}

//添加到“宜”
- (void)addToGood:(NSString *)event
{
    NSError *error;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:[event dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    NSString *name = [result objectForKey:@"name"];
    NSString *goodEvent = [result objectForKey:@"good"];
    
    NSString *addEvent = [NSString stringWithFormat:@"{name:%@,event:%@}",name,goodEvent];
    [addGoods addObject:addEvent];
}

//添加到“不宜”
- (void)addToBad:(NSString *)event
{
    NSError *error;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:[event dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    NSString *name = [result objectForKey:@"name"];
    NSString *badEvent = [result objectForKey:@"bad"];
    
    NSString *addEvent = [NSString stringWithFormat:@"{name:%@,event:%@}",name,badEvent];
    [addBads addObject:addEvent];
}

+ (NSString *)directions
{
    NSArray *dArray = [[self getData]objectForKey:@"directions"];
    NSString *direction = [dArray objectAtIndex:[self random:[self iday] index:2] % [dArray count]];
    return direction;
}

+ (NSString *)drinkValue
{
    NSArray *dValue = [[self getData] objectForKey:@"drinks"];
    NSArray *dv = [NSArray arrayWithArray:[self pickRandom:dValue size:2]];
    NSString *dvr;
    for (int i = 0; i < [dv count]; i++) {
        if (!dvr) {
            dvr = [NSString stringWithString:[dv objectAtIndex:0]];
        }else{
            dvr = [[dvr stringByAppendingString:@", "] stringByAppendingString:[dv objectAtIndex:i]];
        }
    }
    return dvr;
}

+ (NSString *)goddesValue
{
    float gv = [self random:[self iday] index:6] % 50 / 10.0;
    NSString *goddesValueString = [NSString stringWithFormat:@"%.1f",gv];
    return goddesValueString;
}
@end
