//
//  Item.h
//  GroupAgenda
//
//  Created by JunHao Peh on 2/6/15.
//  Copyright (c) 2015 JunHao Peh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Item : NSManagedObject

@property (nonatomic, retain) NSString * details;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * timestamp_created;
@property (nonatomic, retain) NSNumber * timestamp_start;

@end
