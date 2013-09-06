//
// Created by azu on 2013/09/06.
//


#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, WeekdayType) {
    WeekDayUNKnown = 0,
    WeekDayMonday,
    WeekDayTuesday,
    WeekDayWednesday,
    WeekDayThursday,
    WeekDayFriday,
    WeekDaySaturday,
    WeekDaySunday
};

@interface WeekDayUtil : NSObject
+ (NSDate *)dateForNextWeekday:(NSInteger) weekday fromDate:(NSDate *) fromDate;
@end