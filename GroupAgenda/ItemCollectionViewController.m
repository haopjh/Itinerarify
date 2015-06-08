//
//  ItemCollectionViewController.m
//  GroupAgenda
//
//  Created by JunHao Peh on 2/6/15.
//  Copyright (c) 2015 JunHao Peh. All rights reserved.
//

#import "ItemCollectionViewController.h"
#import "Item.h"
#import "ItemCollectionViewCell.h"
#import "AddItemViewController.h"
#import "AppDelegate.h"

@interface ItemCollectionViewController ()

@end

@implementation ItemCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.itemList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"itemCell" forIndexPath:indexPath];
    
    // Configure the cell
    Item *item = [self.itemList objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = item.name;
    cell.detailsLabel.text = item.details;
    cell.locationLabel.text = item.location;
    double timestamp = [item.timestamp_start doubleValue];
    if (timestamp > 0) {
        //Formates the date here
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MMM dd yyyy, h:mm a"];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
        cell.dateLabel.text = [dateFormatter stringFromDate:date];
    } else {
        cell.dateLabel.text = @"";
    }
    
    cell.contentView.layer.cornerRadius = 5.0f;
    cell.contentView.layer.borderWidth = 0.5f;
    cell.contentView.layer.borderColor = [UIColor colorWithRed:195.0/255.0 green:195.0/255.0 blue:201.0/255.0 alpha:1].CGColor;
    cell.layer.shadowColor = [UIColor colorWithRed:195.0/255.0 green:195.0/255.0 blue:201.0/255.0 alpha:1].CGColor;
    cell.layer.shadowOffset = CGSizeMake(0, 2.0f);
    cell.layer.shadowRadius = 2.0f;
    cell.layer.shadowOpacity = 0.5f;
    cell.layer.masksToBounds = NO;
    cell.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:cell.bounds cornerRadius:cell.contentView.layer.cornerRadius].CGPath;
    cell.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1];
    
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGSize size;
    size.width = screenWidth*0.9;
    size.height = 100;
    return size;
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
//    AddItemViewController *source = [segue sourceViewController];
//    if(source.name && [source.name length] > 0) {
//        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
//        NSManagedObjectContext *context = [appDelegate managedObjectContext];
//        Item *item = [NSEntityDescription
//                        insertNewObjectForEntityForName:@"Item"
//                      inManagedObjectContext:context];
//        item.name = source.name;
//        item.details = source.details;
//        item.location = source.name;
//        item.timestamp_created = source.timestampCreated;
//        item.timestamp_start = source.timestampStart;
//        //Adds to agenda's itemlist
//        [self.agenda addItemsObject:item];
//        NSError *error;
//        if (![context save:&error]) {
//            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
//        }
//        //Adds to itemList on collectionview
//        [self.itemList addObject:item];
//        
//        [self.collectionView reloadData];
//    } else {
//        NSLog(@"No items recieved");
//    }
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
