//
//  SelfieActivityController.m
//  Show My Selfie
//
//  Created by Himanshu on 5/21/14.
//  Copyright (c) 2014 Himanshu. All rights reserved.
//

#import "SelfieActivityController.h"

@interface SelfieActivityController ()

@end

@implementation SelfieActivityController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    profileButtonTapped = 0;
}

-(void)viewDidAppear:(BOOL)animated {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    profileTableViewController = (ProfileTableViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ProfileTableViewControllerID"];
    [self addChildViewController:profileTableViewController];
    [profileTableViewController.view setFrame:self.view.frame];
    [self.view addSubview:profileTableViewController.view];
    [profileTableViewController didMoveToParentViewController:self];
    
    
    selfieContentViewNavigationController = (UINavigationController *)[storyboard instantiateViewControllerWithIdentifier:@"SelfieContentViewControllerNavigationID"];
    [self addChildViewController:selfieContentViewNavigationController];
    selfieContentViewController = (SelfieContentViewController*)selfieContentViewNavigationController.topViewController;
    [selfieContentViewController setDelegate:self];
    [self.view addSubview:selfieContentViewNavigationController.view];
    [selfieContentViewNavigationController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getLeftView {
    
    if (profileButtonTapped) {
        
        [UIView animateWithDuration:0.2f delay:0.0f options:UIViewAnimationOptionCurveEaseIn animations:^{
            [selfieContentViewNavigationController.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        } completion:^(BOOL finished) {
            profileButtonTapped = 0;
        }];
        
    }
    else {
        [UIView animateWithDuration:0.2f delay:0.0f options:UIViewAnimationOptionCurveEaseIn animations:^{
            [selfieContentViewNavigationController.view setFrame:CGRectMake(0.8 * self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
        } completion:^(BOOL finished) {
            profileButtonTapped = 1;
        }];
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
