//
//  ItemCollectionViewController.h
//  GroupAgenda
//
//  Created by JunHao Peh on 2/6/15.
//  Copyright (c) 2015 JunHao Peh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Agenda.h"

@interface ItemCollectionViewController : UICollectionViewController

@property NSMutableArray *itemList;
@property Agenda *agenda;

- (IBAction)unwindToList:(UIStoryboardSegue *)segue;

@end
