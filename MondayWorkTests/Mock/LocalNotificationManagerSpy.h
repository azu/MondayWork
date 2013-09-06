//
// Created by azu on 2013/09/06.
//


#import <Foundation/Foundation.h>
#import "LocalNotificationManager.h"


@interface LocalNotificationManagerSpy : LocalNotificationManager
@property(nonatomic) NSMutableArray *schedules;

// helper
- (UILocalNotification *)notificationAtIndex:(NSUInteger) index;

// overwrite
- (void)schedule:(NSDate *) fireDate alertBody:(NSString *) alertBody userInfo:(NSDictionary *) userInfo;
@end