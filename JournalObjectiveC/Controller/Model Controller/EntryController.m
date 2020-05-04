//
//  EntryController.m
//  JournalObjectiveC
//
//  Created by Bryce Bradshaw on 5/4/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

#import "EntryController.h"

static NSString * const ENTRIESKEY = @"entries";

@interface EntryController()

@property (nonatomic, strong) NSMutableArray *internalEntries;

@end

@implementation EntryController

+ (EntryController *)sharedController
{
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EntryController alloc] init];
        [sharedInstance loadFromPersistentStorage];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalEntries = [NSMutableArray array];
    }
    return self;
}

- (void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (Entry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:ENTRIESKEY];
}

- (void)loadFromPersistentStorage
{
    NSArray *entryDitionaries = [[NSUserDefaults standardUserDefaults] objectForKey:ENTRIESKEY];
    for (NSDictionary *dictionary in entryDitionaries)
    {
        Entry *entry = [[Entry alloc] initWithDictionary:dictionary];
        [self addEntries:entry];
    }
}

// MARK - Properties

- (NSArray *)entries { return self.internalEntries; }

- (void)addEntries:(Entry *)entry
{
    [self.internalEntries addObject:entry];
}

- (void)removeEntries:(Entry *)entry
{
    [self.internalEntries removeObject:entry];
}


@end
