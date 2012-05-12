//
//  Utilities.m
//  PersonalTrainer
//
//  Created by Nico Prananta on 5/12/12.
//  Copyright (c) 2012 FlutterScape. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities

+ (NSString *)commentForBMI:(CGFloat)bmi {
    if (bmi < 15) {
        return NSLocalizedString(@"What are you, a paper??", nil);
    } else if (bmi >= 15 && bmi < 16) {
        return NSLocalizedString(@"You need this app!", nil);
    } else if (bmi >= 16 && bmi < 18.5) {
        return NSLocalizedString(@"Underweight!", nil);
    } else if (bmi >= 18.5 && bmi < 25) {
        return NSLocalizedString(@"You're so normal!", nil);
    } else if (bmi >= 25 && bmi < 30) {
        return NSLocalizedString(@"Overweight!", nil);
    } else if (bmi >= 30 && bmi < 35) {
        return NSLocalizedString(@"I don't think I can carry you!", nil);
    } else if (bmi >= 35 && bmi < 40) {
        return NSLocalizedString(@"Too heavy!", nil);
    } else if (bmi > 40) {
        return NSLocalizedString(@"You really need this app!", nil);
    }
    return nil;
}
+ (CGFloat)bmiForWeight:(int)weight height:(int)height {
    return (float)weight/(float)pow(((float)height/100.f), 2);
}

@end
