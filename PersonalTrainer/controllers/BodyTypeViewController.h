//
//  BodyTypeViewController.h
//  PersonalTrainer
//
//  Created by Nico Prananta on 5/12/12.
//  Copyright (c) 2012 FlutterScape. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BodyTypeViewController : UIViewController <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSegmentedControl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *levelSegmentedControle;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
- (IBAction)genderChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *levelChanged;
@property (weak, nonatomic) IBOutlet UILabel *chooseBodyTypeText;

@end
