//
//  LoginViewController.m
//  Show My Selfie
//
//  Created by Himanshu on 5/8/14.
//  Copyright (c) 2014 Himanshu. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
}


-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:0.5f delay:1.0f options:UIViewAnimationOptionCurveLinear animations:^{
        [self.logoLabel setCenter:CGPointMake(CGRectGetMidX(self.view.frame), 0.10 * self.view.frame.size.height)];
    } completion:^(BOOL finished) {
        [self showLoginView];
    }];
}

-(void)showLoginView
{
    FBLoginView *loginView = [[FBLoginView alloc] initWithReadPermissions:@[@"public_profile", @"email", @"user_friends"]];
    [loginView setDelegate:self];
    [loginView setCenter:CGPointMake(CGRectGetMidX(self.view.frame), 0.8 * self.view.frame.size.height)];
    [self.view addSubview:loginView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error
{
    NSString *alertMessage, *alertTitle;
    
    if ([FBErrorUtility shouldNotifyUserForError:error]) {
        alertTitle = @"Facebook error";
        alertMessage = [FBErrorUtility userMessageForError:error];
    
    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession) {
        alertTitle = @"Session Error";
        alertMessage = @"Your current session is no longer valid. Please log in again.";
        
        
    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
        NSLog(@"user cancelled login");
        
    } else {
        alertTitle  = @"Something went wrong";
        alertMessage = @"Please try again later.";
        NSLog(@"Unexpected error:%@", error);
    }
    
    if (alertMessage) {
        [[[UIAlertView alloc] initWithTitle:alertTitle
                                    message:alertMessage
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    
    userName = user.name;
    
    [[NSUserDefaults standardUserDefaults] setObject:userName forKey:@"username"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self showWelcomeLabel];
    
}

-(void)showWelcomeLabel {
    
    NSArray *userNameArray = [userName componentsSeparatedByString:@" "];
    NSString *welcomeText = [NSString stringWithFormat:@"Welcome %@", userNameArray[0]];
    
    welcomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0.9 * self.view.frame.size.width, 30)];
    [welcomeLabel setCenter:CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame))];
    [welcomeLabel setTextAlignment:NSTextAlignmentCenter];
    [welcomeLabel setFont:[UIFont fontWithName:@"Museo" size:20.0f]];
    [welcomeLabel setText:welcomeText];
    [welcomeLabel setBackgroundColor:[UIColor clearColor]];
    [welcomeLabel setTextColor:[UIColor blueColor]];
    [self.view addSubview:welcomeLabel];
    
    
    UISwipeGestureRecognizer *swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(startActivityForSelfie)];
    [swipeGestureRecognizer setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeGestureRecognizer setDelegate:self];
    [self.view addGestureRecognizer:swipeGestureRecognizer];
    
}

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
     NSLog(@"You're logged in");
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    NSLog(@"You're not logged in!");
    
    [welcomeLabel removeFromSuperview];
    welcomeLabel = nil;
    
}

-(void)startActivityForSelfie
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SelfieActivityController *selfieActivityController = (SelfieActivityController *)[storyboard instantiateViewControllerWithIdentifier:@"SelfieActivityControllerID"];
    selfieActivityController.transitioningDelegate = self;
    [selfieActivityController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    
    [self presentViewController:selfieActivityController animated:YES completion:NULL];
}


@end
