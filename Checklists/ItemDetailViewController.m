//
//  AddItemViewController.m
//  Checklists
//
//  Created by Connor Montgomery on 5/16/12.
//  Copyright (c) 2012 Connor Montgomery. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "ChecklistItem.h"

@interface ItemDetailViewController ()

@end

@implementation ItemDetailViewController
@synthesize textField, doneBarButton, delegate, itemToEdit;

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
    
    if (self.itemToEdit != nil) {
        self.title = @"Edit Item";
        self.textField.text = self.itemToEdit.text;
    }

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.textField becomeFirstResponder];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    if (self.itemToEdit != nil) {
        self.title = @"Edit Item";
        self.textField.text = self.itemToEdit.text;
        self.doneBarButton.enabled = YES;
    }
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)cancel {
    [self.delegate itemDetailViewControllerDidCancel:self];
}

- (IBAction)done {
    if (self.itemToEdit == nil) {

        ChecklistItem *item = [[ChecklistItem alloc] init];
        item.text = self.textField.text;
        item.checked = NO;

        [self.delegate itemDetailViewController:self didFinishAddingItem:item];

    } else  {
        self.itemToEdit.text = self.textField.text;
        [self.delegate itemDetailViewController:self didFinishEditingItem:self.itemToEdit];
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (BOOL)textField:(UITextField *)theTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *newText = [theTextField.text stringByReplacingCharactersInRange:range withString:string];
    self.doneBarButton.enabled = (newText.length > 0);
    return YES;
}


@end
