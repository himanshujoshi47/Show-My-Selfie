//
//  LoginViewController.h
//  Show My Selfie
//
//  Created by Himanshu on 5/8/14.
//  Copyright (c) 2014 Himanshu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

#import "SelfieActivityController.h"


@interface LoginViewController : UIViewController <FBLoginViewDelegate, UIGestureRecognizerDelegate, UIViewControllerTransitioningDelegate>
{
    NSString *userName;
    NSUserDefaults *standardDefaults;
    UILabel *welcomeLabel;
}

@property (weak, nonatomic) IBOutlet UILabel *logoLabel;

@end
