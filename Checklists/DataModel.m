//
//  DataModel.m
//  Checklists
//
//  Created by Connor Montgomery on 5/17/12.
//  Copyright (c) 2012 Connor Montgomery. All rights reserved.
//

#import "DataModel.h"
#import "Checklist.h"

@implementation DataModel

@synthesize lists;


- (NSString *)documentsDictionary {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

- (NSString *)dataFilePath {
    return [[self documentsDictionary] stringByAppendingPathComponent:@"Checklists.plist"];
}

- (void)saveChecklists {
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:lists forKey:@"Checklists"];
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];
}

- (void)loadChecklists {
    NSString *path = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        lists = [unarchiver decodeObjectForKey:@"Checklists"];
        [unarchiver finishDecoding];
    } else {
        lists = [[NSMutableArray alloc] initWithCapacity:20];
    }
}

- (void)registerDefaults {
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                [NSNumber numberWithInt:-1], @"ChecklistIndex",
                                [NSNumber numberWithBool:YES], @"FirstTime",
                                nil];
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
}

- (void)handleFirstTime {
    BOOL firstTime = [[NSUserDefaults standardUserDefaults] boolForKey:@"FirstTime"];
    if (firstTime) {
        Checklist *checklist = [[Checklist alloc] init];
        checklist.name = @"List";
        [lists addObject:checklist];
        [self setIndexOfSelectedChecklist:0];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"FirstTime"];
    }
}

- (id)init {
    if ((self = [super init])) {
        [self loadChecklists];
        [self registerDefaults];
        [self handleFirstTime];
    }
    return self;
}

- (int)indexOfSelectedChecklist {
    return [[NSUserDefaults standardUserDefaults] integerForKey:@"ChecklistIndex"];
}

- (void)setIndexOfSelectedChecklist:(int)index {
    [[NSUserDefaults standardUserDefaults] setInteger:index forKey:@"ChecklistIndex"];
}

@end
