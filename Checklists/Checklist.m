//
//  Checklist.m
//  Checklists
//
//  Created by Connor Montgomery on 5/17/12.
//  Copyright (c) 2012 Connor Montgomery. All rights reserved.
//

#import "Checklist.h"
#import "ChecklistItem.h"

@implementation Checklist

@synthesize name, items, iconName;

- (id) init {
    if ((self = [super init])) {
        self.items = [[NSMutableArray alloc] initWithCapacity:20];
        self.iconName = @"No Icon";
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super init])) {
        self.name = [aDecoder decodeObjectForKey:@"Name"];
        self.items = [aDecoder decodeObjectForKey:@"Items"];
        self.iconName = [aDecoder decodeObjectForKey:@"iconName"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"Name"];
    [aCoder encodeObject:self.items forKey:@"Items"];
    [aCoder encodeObject:self.iconName forKey:@"iconName"];
}

- (int)countUncheckedItems {
    int count = 0;
    for (ChecklistItem *item in self.items) {
        if (!item.checked) {
            count += 1;
        }
    }
    
    return count;
}


- (NSComparisonResult)compare:(Checklist *)otherChecklist {
    return [self.name localizedCaseInsensitiveCompare:otherChecklist.name];
}

@end
