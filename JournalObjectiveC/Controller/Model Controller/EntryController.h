//
//  EntryController.h
//  JournalObjectiveC
//
//  Created by Bryce Bradshaw on 5/4/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryController : NSObject

+ (EntryController *)sharedController;

- (void)loadFromPersistentStorage;
- (void)saveToPersistentStorage;

@property (nonatomic, strong, readonly) NSArray *entries;
- (void)addEntries:(Entry *)entry;
- (void)removeEntries:(Entry *)entry;

@end

NS_ASSUME_NONNULL_END
