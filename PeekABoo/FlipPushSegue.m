//
//  FlipPushSegue.m
//  PeekABoo
//
//  Created by Charles Northup on 4/5/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import "FlipPushSegue.h"

@implementation FlipPushSegue
- (void)perform
{
    //[[[self sourceViewController] navigationController] pushViewController:[self   destinationViewController] animated:NO];
    UIViewController *src = (UIViewController *) self.sourceViewController;
//   UIViewController *dst = (UIViewController *) self.destinationViewController;
    
    [UIView beginAnimations:@"LeftFlip" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:src.view.superview cache:YES];
    [UIView commitAnimations];
    
}
@end
