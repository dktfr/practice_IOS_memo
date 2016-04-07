//
//  MemoListControllerTableViewController.m
//  PracticeProject
//
//  Created by NHNEnt on 2016. 4. 1..
//  Copyright © 2016년 NHNEnt. All rights reserved.
//

#import "MemoListController.h"
#import "MemoItemCell.h"
#import "MemoItem.h"
#import "MemoItemStore.h"
#import "DetailController.h"

@interface MemoListController ()

@property (nonatomic, strong) MemoItem *currentSelected;

@end

@implementation MemoListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
//    [self.tableView registerClass:[MemoItemCell class] forCellReuseIdentifier:@"MemoItemCell"];
    
    MemoItemStore *store = [MemoItemStore sharedStore];
    for (int i = 0; i < 10; i++) {
        [store createMemoItemInGroup:@"" withMemo:NSLocalizedString(@"Memo", @"Test Localization") andContentsOrNil:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[MemoItemStore sharedStore].itemsInGroup count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MemoItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MemoItemCell" forIndexPath:indexPath];
    
    // Configure the cell...
    MemoItem *item = [MemoItemStore sharedStore].itemsInGroup[indexPath.row];
    cell.titleLabel.text = item.memo;
    cell.dateLabel.text = [NSString stringWithFormat:@"%@",item.date];
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [[MemoItemStore sharedStore] deleteMemoItemAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"selectCell"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        MemoItem *item = [[MemoItemStore sharedStore].itemsInGroup objectAtIndex:indexPath.row];
        ((DetailController *)segue.destinationViewController).currentItem = item;
    }
}


@end
