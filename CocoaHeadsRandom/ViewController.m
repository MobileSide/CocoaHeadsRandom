//
//  ViewController.m
//  CocoaHeadsRandom
//
//  Created by Daniel Batiston on 12/09/15.
//  Copyright (c) 2015 HiCode. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.flipView.delegate = self;
    self.flipView.reverseFlippingDisabled = YES;

    [self restart];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)randomNumber {
    NSUInteger randomIndex = arc4random_uniform(self.arrayToRandom.count);

    NSInteger randomValue = [self.arrayToRandom[randomIndex] intValue];
    [self.arrayToRandom removeObjectAtIndex:randomIndex];

    return randomValue;
}

- (void)playNext {

    if (self.arrayToRandom.count == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Todos os números já foram sorteados!\n\nVocê deseja reiniciar o sorteio?" delegate:self cancelButtonTitle:@"Não" otherButtonTitles:@"Sim", nil];
        [alert show];

        return;
    }

    self.flipView.value = 3947;

    NSInteger winner = [self randomNumber];

    [self animateToTargetValue:winner];

    [self.arrayWinner addObject:[NSString stringWithFormat:@"%i", winner]];

    self.buttonPlay.enabled = NO;
}

- (void)updateWinnerList {
    self.viewWinner.hidden = NO;

    self.labelWinnerList.text = [self.arrayWinner componentsJoinedByString:@","];
}

- (void)animateToTargetValue:(NSInteger)targetValue;
{
    NSDate *startDate = [NSDate date];
    [self.flipView animateToValue:targetValue
                         duration:2.00
                       completion:^(BOOL finished) {
                           if (finished) {
                               self.buttonPlay.enabled = YES;
                               [self updateWinnerList];
                               [DRBCocoaHeadsLib animateCoinInView:self.view];

                           } else {
                               NSLog(@"Animation canceled after: %.2f seconds", [[NSDate date] timeIntervalSinceDate:startDate]);
                           }
                       }];
}

- (void)restart {

    self.viewWinner.hidden = YES;

    self.arrayWinner = [[NSMutableArray alloc] init];
    self.arrayToRandom = [[NSMutableArray alloc] init];

    [self.flipView animateToValue:0 duration:0.3];

    int maxValue = [self.textFieldMaxValue.text intValue];

    if (maxValue == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Digite o número de participantes para começar o sorteio!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        self.textFieldMaxValue.text = @"5";
        
        [alert show];
    }

    for (int i = 1; i <= maxValue; i++) {
        [self.arrayToRandom addObject:[NSNumber numberWithInt:i]];
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        NSLog(@"No Tapped.");
    } else if (buttonIndex == 1) {
        NSLog(@"Yes Tapped.");
        [self restart];
        [self playNext];
    }
}

#pragma mark - Actions

- (IBAction)actionButtonPlay:(id)sender {
    [self playNext];
}

- (IBAction)actionEndEdit:(id)sender {
    [self restart];
}

- (IBAction)actionButtonRestart:(id)sender {
    [self restart];
}

#pragma mark - Others

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.textFieldMaxValue resignFirstResponder];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
