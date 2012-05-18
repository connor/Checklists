//
//  DataModel.h
//  Checklists
//
//  Created by Connor Montgomery on 5/17/12.
//  Copyright (c) 2012 Connor Montgomery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (nonatomic, strong) NSMutableArray *lists;

- (void)saveChecklists;
- (int)indexOfSelectedChecklist;
- (void)setIndexOfSelectedChecklist:(int)index;
- (void)sortChecklists;

@end
