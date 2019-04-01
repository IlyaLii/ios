#import "DoomsdayMachine.h"
@interface DoomsdayMachine () <AssimilationInfo>
@end
@implementation DoomsdayMachine

- (NSString *)doomsdayString{
    return @"Sunday, August 14, 2208";
}
@synthesize years;
@synthesize months;
@synthesize weeks;
@synthesize days;
@synthesize hours;
@synthesize minutes;
@synthesize seconds;

- (id<AssimilationInfo>)assimilationInfoForCurrentDateString:(NSString *)dateString{
    int str_years = [[dateString substringWithRange:NSMakeRange(0, 4)] intValue];
    int str_mon = [[dateString substringWithRange:NSMakeRange(5, 2)] intValue];
    int str_days = [[dateString substringWithRange:NSMakeRange(8, 2)] intValue];
    int str_seconds = [[dateString substringWithRange:NSMakeRange(11, 2)] intValue];
    int str_min = [[dateString substringWithRange:NSMakeRange(15, 2)] intValue];
    int str_hours = [[dateString substringWithRange:NSMakeRange(17, 2)] intValue];
    years=2208-str_years;
    months=8-str_mon;
    if (years<0 && months>0) {
        months-=12;
        years++;
    }
    days=14-str_days;
    if (days<0 && months>0) {
        months--;
        days+=31;
    }
    else if (months<0 && days>0) {
        days-=31;
        months++;
    }
    
    hours=3-str_hours;
    if (hours<0 && days>0) {
        days--;
        hours+=24;
    }
    else if (days<0 && hours>0) {
        hours-=24;
        days++;
    }
    minutes=13-str_min;
    if (minutes<0 && hours>0) {
        hours--;
        minutes+=60;
    }
    else if (hours<0 && minutes>0) {
        minutes-=60;
        hours++;
    }
    seconds=37-str_seconds;
    if (minutes<0 && seconds>0) {
        seconds-=60;
        minutes++;
    }
    
    return self;
}


@end
