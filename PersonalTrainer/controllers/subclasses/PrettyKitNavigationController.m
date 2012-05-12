//
//  PrettyKitNavigationController.m
//  15 Puzzle
//
//  Created by Nico Prananta on 5/3/12.
//  Copyright (c) 2012 Nico. All rights reserved.
//

#import "PrettyKitNavigationController.h"
#import "PrettyKit.h"
#import "MyPrettyNavigationBar.h"

@implementation PrettyKitNavigationController

- (id)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        MyPrettyNavigationBar *pretty = [[MyPrettyNavigationBar alloc] init];
        [self setValue:pretty forKeyPath:@"navigationBar"];
    }
    return self;
}

@end
