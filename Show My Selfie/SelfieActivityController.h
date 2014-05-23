//
//  SelfieActivityController.h
//  Show My Selfie
//
//  Created by Himanshu on 5/21/14.
//  Copyright (c) 2014 Himanshu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ProfileTableViewController.h"
#import "SelfieContentViewController.h"

@interface SelfieActivityController : UIViewController <SelfieContentViewControllerDelegate>
{
    int profileButtonTapped;
    ProfileTableViewController *profileTableViewController;
    SelfieContentViewController *selfieContentViewController;
    UINavigationController *selfieContentViewNavigationController;
}

@end
