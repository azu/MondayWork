//
// Created by azu on 2013/09/06.
//


#import <SenTestingKit/SenTestingKit.h>
#import <NSDate-Escort/NSDate+Escort.h>
#import "LocalNotificationManagerSpy.h"
#import "WeekDayUtil.h"
#import "OCMockObject.h"
#import "ExampleScheduleDataSource.h"
#import "OCMockRecorder.h"

// Private methodをテスト時はPublicにさせる
@interface LocalNotificationManager (Public)
- (void)scheduleTomorrowIsMonday;

- (void)scheduleTodayIsMonday;
@end


@interface LocalNotificationManagerTest : SenTestCase
@end

@implementation LocalNotificationManagerTest {
    LocalNotificationManagerSpy *managerSpy;
}

- (void)setUp {
    [super setUp];
    managerSpy = [[LocalNotificationManagerSpy alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testScheduleTomorrowIsMonday {
    NSDate *nextSunday = [WeekDayUtil dateForNextWeekday:WeekDaySunday fromDate:[NSDate date]];
    [self whenSunDayIs:^{
        return nextSunday;
    } should:^{
        STAssertTrue([managerSpy.schedules count] == 1, @"通知が一つ登録されている");
        UILocalNotification *localNotification = [managerSpy notificationAtIndex:0];
        STAssertEquals(localNotification.fireDate, nextSunday, @"nextSunday == 発火時間");
    }];
}

- (void)whenSunDayIs:(NSDate * (^)()) dateFn should:(void (^)()) should {
    // データソースをモックに差し替える
    id dataSourceMock = [OCMockObject mockForClass:[ExampleScheduleDataSource class]];
    [[[dataSourceMock stub] andReturn:dateFn()] nextSunday];
    managerSpy.scheduleDataSource = dataSourceMock;
    // 通知登録を呼ぶ
    [managerSpy scheduleTomorrowIsMonday];
    // 検証する
    should();
}


- (void)testScheduleTodayIsMonday {
    NSDate *nextMonday = [WeekDayUtil dateForNextWeekday:WeekDayMonday fromDate:[NSDate date]];
    [self whenMonDayIs:^{
        return nextMonday;
    } should:^{
        STAssertTrue([managerSpy.schedules count] == 1, @"通知が一つ登録されている");
        UILocalNotification *localNotification = [managerSpy notificationAtIndex:0];
        // fireDate == 00:00:00
        BOOL expectYES = [localNotification.fireDate isEqualToDate:[nextMonday dateAtStartOfDay]];
        STAssertTrue(expectYES, @"次の月曜日の00:00:00に発火する");
    }];
}

- (void)whenMonDayIs:(NSDate * (^)()) dateFn should:(void (^)()) should {
    // データソースをモックに差し替える
    id dataSourceMock = [OCMockObject mockForClass:[ExampleScheduleDataSource class]];
    [[[dataSourceMock stub] andReturn:dateFn()] nextMonday];
    managerSpy.scheduleDataSource = dataSourceMock;
    // 通知登録を呼ぶ
    [managerSpy scheduleTodayIsMonday];
    // 検証する
    should();
}
@end
