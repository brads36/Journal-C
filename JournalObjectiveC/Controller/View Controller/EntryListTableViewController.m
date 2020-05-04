//
//  EntryListTableViewController.m
//  JournalObjectiveC
//
//  Created by Bryce Bradshaw on 5/4/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

#import "EntryListTableViewController.h"
#import "EntryController.h"
#import "EntryDetailViewController.h"

@interface EntryListTableViewController ()

@end

@implementation EntryListTableViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return EntryController.sharedController.entries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    EntryController *entryController = EntryController.sharedController;
    Entry *entry = entryController.entries[indexPath.row];
    
    cell.textLabel.text = entry.title;
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toDetailVC"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        Entry *entry = EntryController.sharedController.entries[indexPath.row];
        
        EntryDetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.entry = entry;
    }
}


@end
