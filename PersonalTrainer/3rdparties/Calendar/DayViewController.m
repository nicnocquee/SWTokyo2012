/*
 * Copyright (c) 2010-2012 Matias Muhonen <mmu@iki.fi>
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "DayViewController.h"
#import "MAEvent.h"
#import <EventKit/EventKit.h>

#import "NSDate+Utilities.h"
#import "UIAlertView+MKBlockAdditions.h"


#define DATE_COMPONENTS (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit)
#define CURRENT_CALENDAR [NSCalendar currentCalendar]

@interface DayViewController(PrivateMethods)
@property (readonly) MAEvent *event;
@end

@implementation DayViewController

- (void)loadView {
    self.view = [[MADayView alloc] init];
    MADayView *dayView = (MADayView *) self.view;
    [dayView setDelegate:self];
    [dayView setDataSource:self];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (void)viewDidLoad {
	MADayView *dayView = (MADayView *) self.view;
	/* The default is not to autoscroll, so let's override the default here */
	dayView.autoScrollToFirstEvent = YES;
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self performSelector:@selector(addDummyWorkoutEvent) withObject:nil afterDelay:1.0];
}

- (void)showCalendarErrorAlert {
    [UIAlertView alertViewWithTitle:@"We have problem, Houston!" message:@"There is disturbance in the force that preventing this app from accessing your calendar"];
}

- (void)addDummyWorkoutEvent {
    EKEventStore *store = [[EKEventStore alloc] init];
    EKCalendar *calendar = [EKCalendar calendarWithEventStore:store];
    [calendar setTitle:@"Personal Trainer"];
    [calendar setCGColor:[[UIColor yellowColor] CGColor]];    
    [calendar setSource:[[store sources] objectAtIndex:0]];
    EKEvent *dummyEvent = [EKEvent eventWithEventStore:store];
    [dummyEvent setTitle:@"All nighter working on Personal Trainer for SWTokyo 2012!"];
    
    NSDate *startDate = [NSDate dateWithDay:13 month:5 year:2012 hour:14 minute:0 second:0];
    [dummyEvent setStartDate:startDate];
    NSDate *endDate = [NSDate dateWithDay:13 month:5 year:2012 hour:15 minute:0 second:0];
    [dummyEvent setEndDate:endDate];
    [dummyEvent setCalendar:calendar];
    
    NSError *error = nil;
    [store saveCalendar:calendar commit:YES error:&error];
    if (!error) {
        [store saveEvent:dummyEvent span:EKSpanThisEvent commit:YES error:&error];
        if (error) {
            NSLog(@"Error 1: %@", error);
            [self showCalendarErrorAlert];
        } else {
            MADayView *dayView = (MADayView *) self.view;
            [dayView reloadData];
        }
    } else {
        NSLog(@"Error 2: %@", error);
        [self showCalendarErrorAlert];
    }
}

/* Implementation for the MADayViewDataSource protocol */

static NSDate *date = nil;

- (NSArray *)fakeEvents {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
	
	[dict setObject:@"Meeting with Lee" forKey:@"title"];
    MAEvent *event = [[MAEvent alloc] init];
	event.backgroundColor = [UIColor greenColor];
	event.textColor = [UIColor whiteColor];
	event.allDay = NO;
	event.userInfo = dict;
    event.title = @"Meeting with Lee";
    
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:date];
	[components setHour:9];
	[components setMinute:0];
	
	event.start = [CURRENT_CALENDAR dateFromComponents:components];
	
	[components setHour:10];
	[components setMinute:0];
	
	event.end = [CURRENT_CALENDAR dateFromComponents:components];
    [array addObject:event];
    
    // second event
    dict = [[NSMutableDictionary alloc] init];
	
	[dict setObject:@"Meeting with Francisco" forKey:@"title"];
    
    event = [[MAEvent alloc] init];
	event.backgroundColor = [UIColor greenColor];
	event.textColor = [UIColor whiteColor];
	event.allDay = NO;
	event.userInfo = dict;
    event.title = @"Meeting with Francisco";
    
    components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:date];
	[components setHour:11];
	[components setMinute:0];
	
	event.start = [CURRENT_CALENDAR dateFromComponents:components];
	
	[components setHour:12];
	[components setMinute:0];
	
	event.end = [CURRENT_CALENDAR dateFromComponents:components];
    [array addObject:event];
    
    // third event
    dict = [[NSMutableDictionary alloc] init];
	
	[dict setObject:@"Meeting with Zaki" forKey:@"title"];
    
    event = [[MAEvent alloc] init];
	event.backgroundColor = [UIColor yellowColor];
	event.textColor = [UIColor whiteColor];
	event.allDay = NO;
	event.userInfo = dict;
    event.title = @"Meeting with Zaki";
    
    components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:date];
	[components setHour:13];
	[components setMinute:0];
	
	event.start = [CURRENT_CALENDAR dateFromComponents:components];
	
	[components setHour:13];
	[components setMinute:30];
	
	event.end = [CURRENT_CALENDAR dateFromComponents:components];
    [array addObject:event];
    
    // fourth event
    dict = [[NSMutableDictionary alloc] init];
	
	[dict setObject:@"Go shopping with my girlfriend" forKey:@"title"];
    
    event = [[MAEvent alloc] init];
	event.backgroundColor = [UIColor redColor];
	event.textColor = [UIColor whiteColor];
	event.allDay = NO;
	event.userInfo = dict;
    event.title = @"Go shopping with my girlfriend";
    
    components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:date];
	[components setHour:14];
	[components setMinute:0];
	
	event.start = [CURRENT_CALENDAR dateFromComponents:components];
	
	[components setHour:18];
	[components setMinute:0];
	
	event.end = [CURRENT_CALENDAR dateFromComponents:components];
    [array addObject:event];
    
    // fifth event
    dict = [[NSMutableDictionary alloc] init];
	
	[dict setObject:@"Dinner with CEO of a very famous company!" forKey:@"title"];
    
    event = [[MAEvent alloc] init];
	event.backgroundColor = [UIColor blueColor];
	event.textColor = [UIColor whiteColor];
	event.allDay = NO;
	event.userInfo = dict;
    event.title = @"Dinner with CEO of a very famous company!";
    
    components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:date];
	[components setHour:19];
	[components setMinute:0];
	
	event.start = [CURRENT_CALENDAR dateFromComponents:components];
	
	[components setHour:21];
	[components setMinute:0];
	
	event.end = [CURRENT_CALENDAR dateFromComponents:components];
    [array addObject:event];
    
    return array;
}

- (NSArray *)dayView:(MADayView *)dayView eventsForDate:(NSDate *)startDate {
    NSLog(@"are we here?");
	date = startDate;

	//NSArray *arr = [self fakeEvents];
    
    EKEventStore *store = [[EKEventStore alloc] init];
    NSDate *endDate = [NSDate endOfDate:startDate];
    startDate = [NSDate startOfDate:startDate];
    NSPredicate *predicate = [store predicateForEventsWithStartDate:startDate endDate:endDate calendars:nil];
    
    NSArray *events = [store eventsMatchingPredicate:predicate];
    NSLog(@"Events: %@", events);
    NSMutableArray *arr = nil;
    if (events && events.count > 0) {
        arr = [NSMutableArray arrayWithCapacity:events.count];
        for (EKEvent *eve in events) {
            MAEvent *maEvent = [MAEvent maEventFromEKEvent:eve];
            maEvent.backgroundColor = [UIColor colorWithCGColor:eve.calendar.CGColor];
            maEvent.textColor = [UIColor whiteColor];
            [arr addObject:maEvent];
        }
    }
    
    return arr;
    /*
	static size_t generateAllDayEvents;
	
	generateAllDayEvents++;
	
	if (generateAllDayEvents % 4 == 0) {
		((MAEvent *) [arr objectAtIndex:0]).title = @"All-day events test";
		((MAEvent *) [arr objectAtIndex:0]).allDay = YES;
		
		((MAEvent *) [arr objectAtIndex:1]).title = @"All-day events test";
		((MAEvent *) [arr objectAtIndex:1]).allDay = YES;
	}
     */
	return arr;
}
/*
- (MAEvent *)event {
	static int counter;
	static BOOL flag;
	
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
	
	[dict setObject:[NSString stringWithFormat:@"number %i", counter++] forKey:@"test"];
	
	unsigned int r = arc4random() % 24;
	int rr = arc4random() % 3;
	
	MAEvent *event = [[MAEvent alloc] init];
	event.backgroundColor = ((flag = !flag) ? [UIColor purpleColor] : [UIColor brownColor]);
	event.textColor = [UIColor whiteColor];
	event.allDay = NO;
	event.userInfo = dict;
	
	if (rr == 0) {
		event.title = @"Event lorem ipsum es dolor test. This a long text, which should clip the event view bounds.";
	} else if (rr == 1) {
		event.title = @"Foobar.";
	} else {
		event.title = @"Dolor test.";
	}
	
	NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:date];
	[components setHour:r];
	[components setMinute:0];
	[components setSecond:0];
	
	event.start = [CURRENT_CALENDAR dateFromComponents:components];
	
	[components setHour:r+rr];
	[components setMinute:0];
	
	event.end = [CURRENT_CALENDAR dateFromComponents:components];
	
	return event;
}
*/
/* Implementation for the MADayViewDelegate protocol */

- (void)dayView:(MADayView *)dayView eventTapped:(MAEvent *)event {
	/*NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:event.start];
	NSString *eventInfo = [NSString stringWithFormat:@"Hour %i. Userinfo: %@", [components hour], [event.userInfo objectForKey:@"test"]];
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:event.title
													 message:eventInfo delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];*/
    EKEventEditViewController* controller = [[EKEventEditViewController alloc] init];
    controller.event = event.ekEvent;
    controller.editViewDelegate = self;
    [self presentModalViewController: controller animated:YES];
}

- (void)eventEditViewController:(EKEventEditViewController *)controller didCompleteWithAction:(EKEventEditViewAction)action {
    [self dismissModalViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}




@end
