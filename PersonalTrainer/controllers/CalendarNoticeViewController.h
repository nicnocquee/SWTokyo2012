//
//  ViewController.h
//  PersonalTrainer
//
//  Created by Nico Prananta on 5/12/12.
//  Copyright (c) 2012 FlutterScape. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalTrainerUIButton.h"
#import "JBKenBurnsView.h"

@interface CalendarNoticeViewController : UIViewController
@property (weak, nonatomic) IBOutlet KenBurnsView *kenBurnView;
@property (weak, nonatomic) IBOutlet UILabel *calendarText;
- (IBAction)calendarPressed:(id)sender;
@property (weak, nonatomic) IBOutlet PersonalTrainerUIButton *calendarButton;

@end
