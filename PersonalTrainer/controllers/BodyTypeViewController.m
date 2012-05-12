//
//  BodyTypeViewController.m
//  PersonalTrainer
//
//  Created by Nico Prananta on 5/12/12.
//  Copyright (c) 2012 FlutterScape. All rights reserved.
//

#import "BodyTypeViewController.h"
#import "WeightViewController.h"

@interface BodyTypeViewController () {
    UIImageView *imageView1;
    UIImageView *imageView2;
    UIImageView *imageView3;
}


@end

@implementation BodyTypeViewController
@synthesize levelChanged;
@synthesize chooseBodyTypeText;
@synthesize genderSegmentedControl;
@synthesize scrollView;
@synthesize levelSegmentedControle;
@synthesize pageControl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)setBodyTypeImages {
    switch (self.genderSegmentedControl.selectedSegmentIndex) {
        case 0:{
            UIImage *image = [UIImage imageNamed:@"gie1.jpg"];
            [imageView1 setImage:image];
            image = [UIImage imageNamed:@"gie2.jpg"];
            [imageView2 setImage:image];
            image = [UIImage imageNamed:@"gie3.jpg"];
            [imageView3 setImage:image];
            
            break;
        } case 1:{
            UIImage *image = [UIImage imageNamed:@"dog1.jpg"];
            [imageView1 setImage:image];
            image = [UIImage imageNamed:@"dog2.jpg"];
            [imageView2 setImage:image];
            image = [UIImage imageNamed:@"dog3.jpg"];
            [imageView3 setImage:image];
            
            break;
        }
        default:
            break;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.chooseBodyTypeText setText:NSLocalizedString(@"Choose the body you want to have", nil)];
    
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width*3, self.scrollView.frame.size.height)];
    imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    [imageView1 setContentMode:UIViewContentModeScaleAspectFit];
    [self.scrollView addSubview:imageView1];
    imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    [self.scrollView addSubview:imageView2];
    [imageView2 setContentMode:UIViewContentModeScaleAspectFit];
    imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(self.scrollView.frame.size.width*2, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    [imageView3 setContentMode:UIViewContentModeScaleAspectFit];
    [self.scrollView addSubview:imageView3];
    
    //[self.view setSmoothBackground];
    [self setBodyTypeImages];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Next", nil
                                                                                           ) style:UIBarButtonItemStyleDone target:self action:@selector(nextButtonPressed:)];
    [self.navigationItem setRightBarButtonItem:buttonItem];
}

- (void)viewDidUnload
{
    [self setGenderSegmentedControl:nil];
    [self setScrollView:nil];
    [self setLevelSegmentedControle:nil];
    [self setPageControl:nil];
    [self setLevelChanged:nil];
    [self setChooseBodyTypeText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)genderChanged:(id)sender {
    [self setBodyTypeImages];
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height) animated:YES];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.scrollView.contentOffset.x == 0) {
        [self.pageControl setCurrentPage:0];
    } else if (self.scrollView.contentOffset.x == self.scrollView.frame.size.width) {
        [self.pageControl setCurrentPage:1];
    } else if (self.scrollView.contentOffset.x == 2*self.scrollView.frame.size.width) {
        [self.pageControl setCurrentPage:2];
    }
}

- (void)nextButtonPressed:(id)sender {
    WeightViewController *weight = [[WeightViewController alloc] init];
    [self.navigationController pushViewController:weight animated:YES];
}

@end
