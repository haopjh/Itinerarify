//
//  CustomAnnotation.m
//  GroupAgenda
//
//  Created by JunHao Peh on 7/6/15.
//  Copyright (c) 2015 JunHao Peh. All rights reserved.
//

#import "CustomAnnotation.h"
#import "AddMapItemViewController.h"

@implementation CustomAnnotation

- (id)initWithCoordinate:(CLLocationCoordinate2D *)coordinate withTitle:(NSString *)title withSubTitle:(NSString *)subtitle {
    self = [super init];
    if(self) {
        _title = title;
        _coordinate = *coordinate;
        _subtitle = subtitle;
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
    [rightButton addTarget:nil action:nil forControlEvents:UIControlEventTouchUpInside];
    annotationView.leftCalloutAccessoryView = rightButton;
    
    
    return annotationView;
}

- (void) addMapObject:(id) sender {
    
}


@end
