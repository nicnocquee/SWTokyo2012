//
//  NSDate+Utilities.m
//  PersonalTrainer
//
//  Created by Nico Prananta on 5/13/12.
//  Copyright (c) 2012 FlutterScape. All rights reserved.
//

#import "NSDate+Utilities.h"

@implementation NSDate (Utilities)

+ (NSDate *)startOfToday {
    NSDate *today = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components =
    [gregorian components:(NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit) fromDate:today];
    
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];
    
    return [gregorian dateFromComponents:components];
}

+ (NSDate *)endOfToday {
    NSDate *today = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components =
    [gregorian components:(NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit) fromDate:today];
    
    [components setHour:23];
    [components setMinute:59];
    [components setSecond:59];
    
    return [gregorian dateFromComponents:components];
}

+ (NSDate *)startOfDate:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components =
    [gregorian components:(NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit) fromDate:date];
    
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];
    
    return [gregorian dateFromComponents:components];
}
+ (NSDate *)endOfDate:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components =
    [gregorian components:(NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit) fromDate:date];
    
    [components setHour:23];
    [components setMinute:59];
    [components setSecond:59];
    
    return [gregorian dateFromComponents:components];
}
+ (NSDate *)dateWithDay:(int)day month:(int)month year:(int)year hour:(int)hour minute:(int)minute second:(int)second {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    [components setDay:day];
    [components setMonth:month];
    [components setYear:year];
    [components setHour:hour];
    [components setMinute:minute];
    [components setSecond:second];
    
    return [gregorian dateFromComponents:components];
}

@end
