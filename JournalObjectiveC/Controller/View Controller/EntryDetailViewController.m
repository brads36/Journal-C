//
//  EntryDetailViewController.m
//  JournalObjectiveC
//
//  Created by Bryce Bradshaw on 5/4/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

#import "EntryDetailViewController.h"
#import "EntryController.h"

@interface EntryDetailViewController ()

// MARK: - Outlets
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *textTextView;

@end

@implementation EntryDetailViewController

- (void)viewDidLoad
{
    [EntryController.sharedController loadFromPersistentStorage];
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews
{
    if (!self.entry) return;
    
    self.titleTextField.text = self.entry.title;
    self.textTextView.text = self.entry.text;
}

// MARK: - Actions
- (IBAction)saveButtonTapped:(id)sender
{
    if (self.entry)
    {
        self.entry.title = self.titleTextField.text;
        self.entry.text = self.textTextView.text;
        self.entry.timestamp = NSDate.date;
    }
    else
    {
        Entry *entry = [[Entry alloc] initWithTitle:self.titleTextField.text text:self.textTextView.text timestamp:NSDate.date];
        [EntryController.sharedController addEntries:entry];
    }
    [EntryController.sharedController saveToPersistentStorage];
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)clearButtonTapped:(id)sender
{
    self.titleTextField.text = @"";
    self.textTextView.text = @"";
}

- (BOOL)textFieldShoudlReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

// MARK: - Properties
- (void)setEntry:(Entry *)entry
{
    if (entry != _entry)
    {
        _entry = entry;
        [self updateViews];
    }
}

@end
