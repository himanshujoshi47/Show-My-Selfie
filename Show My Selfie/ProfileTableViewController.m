//
//  ProfileTableViewController.m
//  Show My Selfie
//
//  Created by Himanshu on 5/22/14.
//  Copyright (c) 2014 Himanshu. All rights reserved.
//

#import "ProfileTableViewController.h"

@interface ProfileTableViewController ()

@end

@implementation ProfileTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView setContentInset:UIEdgeInsetsMake(20.0f, 0, 0, 0)];
    [self .tableView setBackgroundColor:[UIColor colorWithRed:0/255.0 green:128.0/255.0 blue:255.0/255.0 alpha:1.0]];
    
    NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    
    sectionTitleArray = @[username, @"Settings"];
    profileElementsArray = @[@"Best Selfie", @"My Selfies"];
    settingsArray = @[@"Privacy", @"Log Out"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [sectionTitleArray count];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 40)];
    [headerView setBackgroundColor:[UIColor colorWithRed:0.0/255.0 green:102.0/255.0 blue:204.0/255.0 alpha:1.0]];
    
    
    UILabel *sectionLabel=[[UILabel alloc]initWithFrame:CGRectMake(15, 0, tableView.bounds.size.width, 30)];
    sectionLabel.backgroundColor=[UIColor clearColor];
    sectionLabel.textColor = [UIColor whiteColor];
    sectionLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    sectionLabel.text = [sectionTitleArray objectAtIndex:section];
    [sectionLabel sizeToFit];
    
    [headerView addSubview:sectionLabel];
    
    
    return headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberOfRows;
    switch (section) {
        case 0:
            numberOfRows = [profileElementsArray count];
            break;
            
        case 1:
            numberOfRows = [settingsArray count];
            break;
            
        default:
            numberOfRows = 0;
            break;
    }
    return numberOfRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.backgroundColor = [UIColor colorWithRed:0/255.0 green:128.0/255.0 blue:255.0/255.0 alpha:1.0];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont fontWithName:@"Museo" size:20.0f];
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [profileElementsArray objectAtIndex:indexPath.row];
            break;
            
        case 1:
            cell.textLabel.text = [settingsArray objectAtIndex:indexPath.row];
            break;
            
        default:
            break;
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
