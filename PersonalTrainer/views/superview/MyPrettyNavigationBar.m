//
//  MyPrettyNavigationBar.m
//  15 Puzzle
//
//  Created by Nico Prananta on 5/3/12.
//  Copyright (c) 2012 Nico. All rights reserved.
//

#import "MyPrettyNavigationBar.h"
#import "PrettyDrawing.h"

@implementation MyPrettyNavigationBar

- (id)init{
    self = [super init];
    if (self) {
        self.topLineColor = [UIColor colorWithHex:0x0b47a1];
        self.gradientStartColor = [UIColor colorWithHex:0x0a3f8f];
        self.gradientEndColor = [UIColor colorWithHex:0x072f6b];    
        self.bottomLineColor = [UIColor colorWithHex:0x05204a];   
        self.tintColor = self.gradientEndColor;
        self.roundedCornerRadius = 8;
    }
    return self;
}

@end
