//
//  Utilities.h
//  PersonalTrainer
//
//  Created by Nico Prananta on 5/12/12.
//  Copyright (c) 2012 FlutterScape. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utilities : NSObject

+ (NSString *)commentForBMI:(CGFloat)bmi;
+ (CGFloat)bmiForWeight:(int)weight height:(int)height;

@end
