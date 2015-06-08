//
//  Agenda.h
//  GroupAgenda
//
//  Created by JunHao Peh on 2/6/15.
//  Copyright (c) 2015 JunHao Peh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Item;

@interface Agenda : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * timestamp_created;
@property (nonatomic, retain) NSSet *items;
@end

@interface Agenda (CoreDataGeneratedAccessors)

- (void)addItemsObject:(Item *)value;
- (void)removeItemsObject:(Item *)value;
- (void)addItems:(NSSet *)values;
- (void)removeItems:(NSSet *)values;

@end
