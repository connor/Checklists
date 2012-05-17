//
//  ChecklistItem.h
//  Checklists
//
//  Created by Connor Montgomery on 5/16/12.
//  Copyright (c) 2012 Connor Montgomery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChecklistItem : NSObject <NSCoding>

@property (nonatomic, copy)     NSString *text;
@property (nonatomic, assign)   BOOL checked;

- (void)toggleChecked;

@end
