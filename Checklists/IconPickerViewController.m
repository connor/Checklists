//
//  IconPickerViewController.m
//  Checklists
//
//  Created by Connor Montgomery on 5/18/12.
//  Copyright (c) 2012 Connor Montgomery. All rights reserved.
//

#import "IconPickerViewController.h"

@implementation IconPickerViewController {
    NSArray *icons;
}

@synthesize delegate;

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

    icons = [NSArray arrayWithObjects:
             @"No Icon",
             @"Appointments",
             @"Birthdays",
             @"Chores",
             @"Drinks",
             @"Folder",
             @"Groceries",
             @"Inbox",
             @"Photos",
             @"Trips",
             nil];

}

- (void)viewDidUnload
{
    [super viewDidUnload];

    icons = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [icons count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IconCell"];
    
    NSString *icon = [icons objectAtIndex:indexPath.row];
    cell.textLabel.text = icon;
    cell.imageView.image = [UIImage imageNamed:icon];

    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *iconName = [icons objectAtIndex:indexPath.row];
    [self.delegate iconPicker:self didPickIcon:iconName];
    
}

@end
