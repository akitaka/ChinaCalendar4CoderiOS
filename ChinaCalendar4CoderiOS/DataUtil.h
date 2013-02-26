//
//  DataUtil.h
//  ChinaCalendar4CoderiOS
//
//  Created by Tom HU on 2013/02/21.
//  Copyright (c) 2013年 Tom HU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataUtil : NSObject{
    NSMutableArray *addGoods;
    NSMutableArray *addBads;
}

@property(nonatomic,retain)NSMutableArray *addGoods;
@property(nonatomic,retain)NSMutableArray *addBads;

+ (NSString *)today;
+ (NSDictionary *)getData;
+ (NSInteger)iday;
+ (NSInteger)random:(int)dayseed index:(int)indexseed;
+ (id)pickTodaysLuck;
+ (NSArray *)pickSpecials;
+ (NSArray *)pickRandomActivity:(NSInteger)size;
+ (id)pickRandom:(NSArray *)array size:(NSInteger)size;

- (void)addToGood:(NSString *)event;
- (void)addToBad:(NSString *)event;

+ (NSString *)parse:(NSString *)event;

+ (NSString *)directions;
+ (NSString *)drinkValue;
+ (NSString *)goddesValue;
@end
