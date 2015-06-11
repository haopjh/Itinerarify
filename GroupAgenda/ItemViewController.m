//
//  ItemViewController.m
//  GroupAgenda
//
//  Created by JunHao Peh on 11/6/15.
//  Copyright (c) 2015 JunHao Peh. All rights reserved.
//

#import "ItemViewController.h"
#import "CustomAnnotation.h"
#import "AppDelegate.h"
#import "ItemCollectionViewController.h"

@interface ItemViewController ()

@end

@implementation ItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //set delegates
    self.mapView.delegate = self;
    
    self.nameField.text = self.item.name;
    self.detailsField.text = self.item.details;
    
    double timestamp = [self.item.timestamp_start doubleValue];
    if (timestamp > 0) {
        //Formates the date here
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MMM dd yyyy, h:mm a"];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
        self.dateField.text = [dateFormatter stringFromDate:date];
    } else {
        self.dateField.text = @"";
    }
    NSArray *coordinateList = [self.item.location componentsSeparatedByString:@","];
    if(coordinateList.count == 2) {
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake([coordinateList[0] doubleValue], [coordinateList[1] doubleValue]);
        CustomAnnotation *annotation = [[CustomAnnotation alloc] initWithCoordinate:&coordinate withTitle:self.item.name withSubTitle:@"subtitle"];
        [self.mapView addAnnotation:annotation];
        [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(
                                                                   annotation.coordinate,
                                                                   1000,
                                                                   1000
                                                                   )];
    }
    
    self.deleteButton.layer.cornerRadius = 5.0f;
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {

    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    } else if ([annotation isKindOfClass:[CustomAnnotation class]]) {
        static NSString * const identifier = @"CustomAnnotation";
        MKAnnotationView* annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        CustomAnnotation *myAnnotation = (CustomAnnotation *) annotation;
        
        if (annotationView == nil) {
            annotationView = myAnnotation.annotationView;
        } else {
            annotationView.annotation = annotation;
        }
        
        return annotationView;
    }
    
    return nil;
}

- (IBAction)buttonReceived:(UIButton *)sender {
    
//    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
//    NSManagedObjectContext *context = [appDelegate managedObjectContext];
//    [context deleteObject:self.item];
    
//    NSError *error;
//    if (![context save:&error]) {
//        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
//    }
    
//    removeItemFromList
    NSInteger index = [self.navigationController.viewControllers indexOfObject:self];
    ItemCollectionViewController *viewController = [self.navigationController.viewControllers objectAtIndex:index-1];
    [viewController removeItemFromList:self.item];

    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
