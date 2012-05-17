//
//  AddItemViewController.h
//  Checklists
//
//  Created by Connor Montgomery on 5/16/12.
//  Copyright (c) 2012 Connor Montgomery. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ItemDetailViewController;
@class ChecklistItem;

@protocol ItemDetailViewControllerDelegate <NSObject>

- (void)itemDetailViewControllerDidCancel:(ItemDetailViewController *)controller;
- (void)itemDetailViewController:(ItemDetailViewController *)controller didFinishAddingItem:(ChecklistItem *) item;
- (void)itemDetailViewController:(ItemDetailViewController *)controller didFinishEditingItem:(ChecklistItem *) item;


@end


@interface ItemDetailViewController : UITableViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
@property (strong, nonatomic) ChecklistItem *itemToEdit;
@property (weak  , nonatomic) id <ItemDetailViewControllerDelegate> delegate;

- (IBAction)cancel;
- (IBAction)done;

@end
