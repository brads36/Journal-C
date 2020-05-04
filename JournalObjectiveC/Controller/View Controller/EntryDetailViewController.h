//
//  EntryDetailViewController.h
//  JournalObjectiveC
//
//  Created by Bryce Bradshaw on 5/4/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EntryController.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryDetailViewController : UIViewController

@property (nonatomic, strong) Entry *entry;

@end

NS_ASSUME_NONNULL_END
