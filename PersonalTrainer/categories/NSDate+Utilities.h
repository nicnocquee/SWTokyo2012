//
//  NSDate+Utilities.h
//  PersonalTrainer
//
//  Created by Nico Prananta on 5/13/12.
//  Copyright (c) 2012 FlutterScape. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Utilities)

+ (NSDate *)startOfToday;
+ (NSDate *)endOfToday;
+ (NSDate *)startOfDate:(NSDate *)date;
+ (NSDate *)endOfDate:(NSDate *)date;
+ (NSDate *)dateWithDay:(int)day month:(int)month year:(int)year hour:(int)hour minute:(int)minute second:(int)second;


@end
