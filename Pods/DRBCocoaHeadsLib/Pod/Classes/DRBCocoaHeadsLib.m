//
//  DRBCocoaHeadsLib.m
//
//
//  Created by Daniel Batiston on 13/09/15.
//
//

#import "DRBCocoaHeadsLib.h"

@implementation DRBCocoaHeadsLib

+ (void)animateCoinInView:(UIView *)pView {
    NSLog(@"Coin! Coin! Coin! Coin!");

    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    UIImage *im = [UIImage imageNamed:@"DRBCocoaHeadsLib.bundle/imCoin.png" inBundle:bundle compatibleWithTraitCollection:nil];

    UIImageView *imView = [[UIImageView alloc] initWithImage:im];

    imView.frame = CGRectMake(0, 0, 30, 30);
    imView.center = pView.center;
    imView.alpha = 1;
    [pView addSubview:imView];

    CGRect frame = CGRectMake(0, 0, 200, 200);

    [UIView animateWithDuration:1.5
        animations:^{
            imView.frame = frame;
            imView.alpha = 0;
            imView.center = pView.center;
        }
        completion:^(BOOL finished) {
            [imView removeFromSuperview];
        }];

    imView = nil;
}

@end
