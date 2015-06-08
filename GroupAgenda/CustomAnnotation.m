//
//  CustomAnnotation.m
//  GroupAgenda
//
//  Created by JunHao Peh on 7/6/15.
//  Copyright (c) 2015 JunHao Peh. All rights reserved.
//

#import "CustomAnnotation.h"

@implementation CustomAnnotation

- (id)initWithMapItem:(MKMapItem *)item {
    self = [super init];
    if(self) {
        _title = item.name;
        _coordinate = item.placemark.location.coordinate;
        _subtitle = [item.placemark.addressDictionary objectForKey:@"Street"];
    }
    
    return self;
}



- (MKAnnotationView *)annotationView {
    MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"CustomAnnotation"];
    
    annotationView.enabled = true;
    annotationView.canShowCallout = true;
    UIImage *image = [UIImage imageNamed:@"map_annotation"];
    annotationView.image = image;
    annotationView.centerOffset = CGPointMake(0, -image.size.height/2);
    
    //Added a button to add to itinerary
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [rightButton addTarget:nil action: @selector(hello:) forControlEvents:UIControlEventTouchUpInside];
    annotationView.leftCalloutAccessoryView = rightButton;
    
    
    return annotationView;
}

- (void) hello:(id) sender {
    NSLog(@"asda");
}

@end
