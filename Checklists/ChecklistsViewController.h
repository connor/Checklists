//
//  ChecklistsViewController.h
//  Checklists
//
//  Created by Connor Montgomery on 5/16/12.
//  Copyright (c) 2012 Connor Montgomery. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"

@interface ChecklistsViewController : UITableViewController <ItemDetailViewControllerDelegate>

- (IBAction)addItem;

@end
