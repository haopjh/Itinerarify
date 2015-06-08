//
//  AppDelegate.m
//  GroupAgenda
//
//  Created by JunHao Peh on 1/6/15.
//  Copyright (c) 2015 JunHao Peh. All rights reserved.
//

#import "AppDelegate.h"
#import "Agenda.h"
#import "Item.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    [self runFixtureData];

    
    //    #95b8ca
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:149.0/255.0 green:184.0/255.0 blue:202.0/255.0 alpha:1]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    return YES;
}

- (void)runFixtureData {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    Agenda *agenda2 = [NSEntityDescription
                      insertNewObjectForEntityForName:@"Agenda"
                      inManagedObjectContext:context];
    agenda2.name = @"New Zealand 2015";
    
    Item *item11 = [NSEntityDescription
                   insertNewObjectForEntityForName:@"Item"
                   inManagedObjectContext:context];
    item11.name = @"Visit Land of Hobbiton";
    
    Item *item12 = [NSEntityDescription
                    insertNewObjectForEntityForName:@"Item"
                    inManagedObjectContext:context];
    item12.name = @"Stand at the top of Sky Tower and scream!";
    
    Item *item13 = [NSEntityDescription
                    insertNewObjectForEntityForName:@"Item"
                    inManagedObjectContext:context];
    item13.name = @"Visit Tower of Sauron";
    
    Item *item14 = [NSEntityDescription
                    insertNewObjectForEntityForName:@"Item"
                    inManagedObjectContext:context];
    item14.name = @"Go snorkling at the Bay of Island";
    
    NSSet *items2 = [NSSet setWithObjects:item11, item12, item13, item14, nil];
    
    [agenda2 addItems:items2];
    
    Agenda *agenda = [NSEntityDescription
                      insertNewObjectForEntityForName:@"Agenda"
                      inManagedObjectContext:context];
    agenda.name = @"Japan 2016";
    
    Item *item1 = [NSEntityDescription
                   insertNewObjectForEntityForName:@"Item"
                   inManagedObjectContext:context];
    item1.name = @"Visit Hokkaido";
    
    Item *item2 = [NSEntityDescription
                   insertNewObjectForEntityForName:@"Item"
                   inManagedObjectContext:context];
    item2.name = @"Visit Raman Place";
    
    NSSet *items = [NSSet setWithObjects:item1, item2, nil];
    
    [agenda addItems:items];
    
    Agenda *agenda3 = [NSEntityDescription
                      insertNewObjectForEntityForName:@"Agenda"
                      inManagedObjectContext:context];
    agenda3.name = @"Singapura, Oh Singapura";
    
    Item *item21 = [NSEntityDescription
                   insertNewObjectForEntityForName:@"Item"
                   inManagedObjectContext:context];
    item21.name = @"Eat Serangoon Garden's Hokkien Mee";
    
    Item *item22 = [NSEntityDescription
                   insertNewObjectForEntityForName:@"Item"
                   inManagedObjectContext:context];
    item22.name = @"Visit 2 Jalan Chulek and play with Truffles and Pudding the doggies!";
    
    NSSet *items3 = [NSSet setWithObjects:item21, item22, nil];
    
    [agenda3 addItems:items3];
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Agenda" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (Agenda *agenda in fetchedObjects) {
        NSLog(@"Name of Agenda: %@", agenda.name);
        NSSet *items = agenda.items;
        for (Item *item in items) {
            NSLog(@"Name of item: %@", item.name);
        }
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "oyster.GroupAgenda" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"GroupAgenda" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSDictionary *options = @{
                              NSMigratePersistentStoresAutomaticallyOption : @YES,
                              NSInferMappingModelAutomaticallyOption : @YES
                              };
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"GroupAgenda.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
