//
//  SelfieContentViewController.h
//  Show My Selfie
//
//  Created by Himanshu on 5/22/14.
//  Copyright (c) 2014 Himanshu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelfieContentViewControllerDelegate <NSObject>

-(void)getLeftView;

@end



@interface SelfieContentViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property(weak, nonatomic) id<SelfieContentViewControllerDelegate> delegate;

- (IBAction)openCamera:(id)sender;


@end
