//
//  LoginViewController.m
//  PersonalTrainer
//
//  Created by Nico Prananta on 5/13/12.
//  Copyright (c) 2012 FlutterScape. All rights reserved.
//

#import "LoginViewController.h"
#import "DayViewController.h"
#import "SCFacebook.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)fetchUser {
    [SCFacebook getUserFQL:nil callBack:^(BOOL success, id result){
        if (success) {
            NSLog(@"User %@", result);
        }
    }];
}

- (IBAction)loginWithFacebookTapped:(id)sender {
    [SCFacebook loginCallBack:^(BOOL success, id result){
        if (success) {
            NSLog(@"Result: %@", result);
            [self performSelector:@selector(fetchUser) withObject:nil afterDelay:0.2];
            DayViewController *schedule = [[DayViewController alloc] init];
            [self.navigationController pushViewController:schedule animated:YES];
        }
    }];
}
@end
