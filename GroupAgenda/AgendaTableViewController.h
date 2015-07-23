//
//  AgendaTableViewController.h
//  GroupAgenda
//
//  Created by JunHao Peh on 2/6/15.
//  Copyright (c) 2015 JunHao Peh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AgendaTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *agendaList;

- (IBAction)unwindToList:(UIStoryboardSegue *)segue;

@end
