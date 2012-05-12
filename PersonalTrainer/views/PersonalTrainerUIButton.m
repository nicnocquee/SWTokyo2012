//
//  PersonalTrainerUIButton.m
//  PersonalTrainer
//
//  Created by Nico Prananta on 5/12/12.
//  Copyright (c) 2012 FlutterScape. All rights reserved.
//

#import "PersonalTrainerUIButton.h"

@implementation PersonalTrainerUIButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Shadow Declarations
    CGColorRef shadow = [UIColor lightGrayColor].CGColor;
    CGSize shadowOffset = CGSizeMake(0, 2);
    CGFloat shadowBlurRadius = 1;
    
    
    //// Rounded Rectangle Drawing
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(rect.origin.x+3, rect.origin.y+3, rect.size.width - 6, rect.size.height - 6) cornerRadius: 4];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow);
    [[UIColor personalTrainerColor] setFill];
    [roundedRectanglePath fill];
    CGContextRestoreGState(context);
}


@end
