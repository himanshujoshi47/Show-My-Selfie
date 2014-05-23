//
//  SelfieContentViewController.m
//  Show My Selfie
//
//  Created by Himanshu on 5/22/14.
//  Copyright (c) 2014 Himanshu. All rights reserved.
//

#import "SelfieContentViewController.h"

@interface SelfieContentViewController ()

@end

@implementation SelfieContentViewController

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
    
    //NAVIGATION BAR LEFT BUTTON TO SHOW PROFILE
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"LeftBarButton-Blue.png"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"LeftBarButton-White.png"] forState:UIControlStateHighlighted];
    leftButton.frame = CGRectMake(0, 0, 30, 30);
    [leftButton addTarget:self action:@selector(showProfile) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    [self.navigationItem setLeftBarButtonItem:leftBarButton];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showProfile {
    NSLog(@"Showing Profile");
    [self.delegate getLeftView];    
    
}

- (IBAction)openCamera:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.allowsEditing = YES;
        
        [self presentViewController:imagePicker animated:YES completion:NULL];
        
    }
    
    else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Camera Unavailable"
                                                       message:@"Unable to find a camera on your device."
                                                      delegate:nil
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil, nil];
        [alert show];
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
