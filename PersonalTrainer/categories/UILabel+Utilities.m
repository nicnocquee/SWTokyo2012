//
//  UILabel+Utilities.m
//  PersonalTrainer
//
//  Created by Nico Prananta on 5/12/12.
//  Copyright (c) 2012 FlutterScape. All rights reserved.
//

#import "UILabel+Utilities.h"
#import <QuartzCore/QuartzCore.h>

@implementation UILabel (Utilities)

- (void)setHomeTitle {
    [self setTextAlignment:UITextAlignmentCenter];
    [self setTextColor:[UIColor whiteColor]];
    [self.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.layer setShadowOffset:CGSizeMake(0, 1)];
    [self.layer setShadowOpacity:1.0];
    [self.layer setShadowRadius:1.0];
    [self setClipsToBounds:YES];
}

@end
