//
//  ViewController.m
//  PersonalTrainer
//
//  Created by Nico Prananta on 5/12/12.
//  Copyright (c) 2012 FlutterScape. All rights reserved.
//

#import "CalendarNoticeViewController.h"
#import "BodyTypeViewController.h"
#import "UILabel+Utilities.h"

@interface CalendarNoticeViewController ()

@end

@implementation CalendarNoticeViewController
@synthesize calendarButton;
@synthesize kenBurnView;
@synthesize calendarText;

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self.view setSmoothBackground];
    self.title = NSLocalizedString(@"Personal Trainer", nil);
    
    self.calendarText.text = NSLocalizedString(@"We need to use your calendar so we can recommend the best workout plan for you", nil);
    [self.calendarText setHomeTitle];
    [self.calendarButton setBackgroundColor:[UIColor clearColor]];
    
    [self.kenBurnView animateWithImages:[NSArray arrayWithObjects:[UIImage imageNamed:@"boy-lean-body2.jpg"],
                               [UIImage imageNamed:@"boy-muscular-body.jpg"],
                               [UIImage imageNamed:@"girl-lean-body2.jpg"],
                               [UIImage imageNamed:@"girl-lean-body.jpg"],nil] transitionDuration:5.0 loop:YES isLandscape:YES];
}

- (void)viewDidUnload
{
    [self setCalendarText:nil];
    [self setCalendarButton:nil];
    [self setKenBurnView:nil];
    [self setKenBurnView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)calendarPressed:(id)sender {
    BodyTypeViewController *body = [[BodyTypeViewController alloc] init];
    [self.navigationController pushViewController:body animated:YES];
}
@end
