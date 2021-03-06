//
//  AgendaTableViewController.m
//  GroupAgenda
//
//  Created by JunHao Peh on 2/6/15.
//  Copyright (c) 2015 JunHao Peh. All rights reserved.
//

#import "AgendaTableViewController.h"
#import "AppDelegate.h"
#import "Agenda.h"
#import "ItemCollectionViewController.h"
#import "AddAgendaViewController.h"

@interface AgendaTableViewController ()

@end

@implementation AgendaTableViewController
@synthesize agendaList;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Get list of Agenda
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Agenda" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    self.agendaList = [NSMutableArray arrayWithArray:[context executeFetchRequest:fetchRequest error:&error]];
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return self.agendaList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"agendaCell" forIndexPath:indexPath];
    
    // Configure the cell...
    Agenda *agenda = [self.agendaList objectAtIndex:indexPath.row];
    cell.textLabel.text = agenda.name;
    return cell;
}


- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    if([[segue sourceViewController] isKindOfClass:[AddAgendaViewController class]]) {
        
        AddAgendaViewController *source = [segue sourceViewController];
        if(source.name && [source.name length] > 0) {
            AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
            NSManagedObjectContext *context = [appDelegate managedObjectContext];
            Agenda *agenda = [NSEntityDescription
                          insertNewObjectForEntityForName:@"Agenda"
                          inManagedObjectContext:context];
            agenda.name = source.name;
            agenda.timestamp_created = [NSNumber numberWithInt:[[NSDate date] timeIntervalSince1970]];

            NSError *error;
            if (![context save:&error]) {
                NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
            }
            //Adds to itemList on collectionview
            [self.agendaList addObject:agenda];
            [self.tableView reloadData];
        } else {
            NSLog(@"No agenda recieved");
        }
        
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
    if([segue.identifier isEqualToString:@"enterAgenda"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        Agenda *agenda = [self.agendaList objectAtIndex:indexPath.row];
        NSSet *itemList = agenda.items;
        NSMutableArray *newItemList = [NSMutableArray arrayWithArray:[itemList allObjects]];
        
        [segue.destinationViewController setItemList:newItemList];
        [segue.destinationViewController setAgenda:agenda];

    } else if([segue.identifier isEqualToString:@"newAgenda"]) {
        NSLog(@"Enter create new agenda");
    }
    
}


@end
