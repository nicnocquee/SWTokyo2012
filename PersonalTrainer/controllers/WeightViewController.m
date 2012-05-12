//
//  WeightViewController.m
//  PersonalTrainer
//
//  Created by Nico Prananta on 5/12/12.
//  Copyright (c) 2012 FlutterScape. All rights reserved.
//

#import "WeightViewController.h"
#import "Utilities.h"
#import "DayViewController.h"

@interface WeightViewController ()

@end

@implementation WeightViewController
@synthesize commentLabel;
@synthesize picker;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Height and Weight", nil);
    [self.picker setShowsSelectionIndicator:YES];
    int initialWeight = 65;
    int initialHeight = 165;
    [self.picker selectRow:initialHeight-120 inComponent:0 animated:NO];
    [self.picker selectRow:initialWeight-20 inComponent:1 animated:NO];
    
    [self.commentLabel setText:[Utilities commentForBMI:[Utilities bmiForWeight:initialWeight height:initialHeight]]];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Done", nil) style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonPressed:)];
    [self.navigationItem setRightBarButtonItem:buttonItem];
}

- (void)viewDidUnload
{
    [self setCommentLabel:nil];
    [self setPicker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UIPicker

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    switch (component) {
        case 0:{
            return (300-120);
            break;
        } case 1:{
            return 400-20;
        }
        default:
            break;
    }
    return 0;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    switch (component) {
        case 0:{
            return [NSString stringWithFormat:@"%d cm", 120+row];
            break;
        } case 1:{
            return [NSString stringWithFormat:@"%d kg", 20+row];
            break;
        }    
        default:
            break;
    }
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    int height = [self.picker selectedRowInComponent:0]+120;
    int weight = [self.picker selectedRowInComponent:1]+20;
    [self.commentLabel setText:[Utilities commentForBMI:[Utilities bmiForWeight:weight height:height]]];
}

- (void)doneButtonPressed:(id)sender {
    DayViewController *day = [[DayViewController alloc] init];
    [day setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentModalViewController:day animated:YES];
}

@end
