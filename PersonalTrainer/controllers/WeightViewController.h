//
//  WeightViewController.h
//  PersonalTrainer
//
//  Created by Nico Prananta on 5/12/12.
//  Copyright (c) 2012 FlutterScape. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeightViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@end
