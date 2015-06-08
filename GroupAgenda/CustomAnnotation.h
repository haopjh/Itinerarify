//
//  CustomAnnotation.h
//  GroupAgenda
//
//  Created by JunHao Peh on 7/6/15.
//  Copyright (c) 2015 JunHao Peh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CustomAnnotation : NSObject <MKAnnotation>

@property (nonatomic,readonly) CLLocationCoordinate2D coordinate;
@property (copy, nonatomic) NSString *title;
@property (nonatomic, retain) NSString *subtitle;

- (id)initWithMapItem:(MKMapItem *)item;
- (MKAnnotationView *) annotationView;



@end
