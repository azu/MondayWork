//
// Created by azu on 2013/09/06.
//


#import "WeekDayUtil.h"


@implementation WeekDayUtil {

}

+ (NSDate *)dateForNextWeekday:(NSInteger) weekday fromDate:(NSDate *) fromDate {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *weekdayComponents = [gregorian components:NSWeekdayCalendarUnit
                                                     fromDate:fromDate];
    NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
    NSInteger diff = weekday - weekdayComponents.weekday;
    if (diff <= 0) diff += 7;
    [componentsToSubtract setDay:diff];
    NSDate *beginningOfWeek = [gregorian dateByAddingComponents:componentsToSubtract
                                         toDate:fromDate options:0];
    return beginningOfWeek;
}
@end