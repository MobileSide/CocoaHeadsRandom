//
//  ViewController.h
//  CocoaHeadsRandom
//
//  Created by Daniel Batiston on 12/09/15.
//  Copyright (c) 2015 HiCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDFlipNumberView.h"
#import "DRBCocoaHeadsLib.h"

@interface ViewController : UIViewController <JDFlipNumberViewDelegate>

@property (nonatomic, strong) NSMutableArray *arrayToRandom;
@property (nonatomic, strong) NSMutableArray *arrayWinner;

@property (strong, nonatomic) IBOutlet JDFlipNumberView *flipView;
@property (strong, nonatomic) IBOutlet UIButton *buttonPlay;
@property (strong, nonatomic) IBOutlet UIView *viewWinner;
@property (strong, nonatomic) IBOutlet UILabel *labelWinnerList;
@property (strong, nonatomic) IBOutlet UITextField *textFieldMaxValue;

- (IBAction)actionButtonPlay:(id)sender;
- (IBAction)actionEndEdit:(id)sender;
- (IBAction)actionButtonRestart:(id)sender;

@end
