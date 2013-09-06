//
// Created by azu on 2013/09/06.
//


#import "ExampleScheduleDataSource.h"
#import "WeekDayUtil.h"


@implementation ExampleScheduleDataSource {

}
- (NSDate *)nextSunday {
    return [WeekDayUtil dateForNextWeekday:WeekDaySunday fromDate:[NSDate date]];
}

- (NSDate *)nextMonday {
    return [WeekDayUtil dateForNextWeekday:WeekDayMonday fromDate:[NSDate date]];
}
@end