//
//  AddMapItemViewController.m
//  GroupAgenda
//
//  Created by JunHao Peh on 7/6/15.
//  Copyright (c) 2015 JunHao Peh. All rights reserved.
//

#import "AddMapItemViewController.h"
#import "CustomAnnotation.h"

@interface AddMapItemViewController ()

@end

@implementation AddMapItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //Sets the delegates
    self.searchBar.delegate = self;
    self.mapView.delegate = self;
    
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

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *searchText = searchBar.text;
    
    
    //Searches the map here
    // Create and initialize a search request object.
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = searchText;
    request.region = self.mapView.region;
    
    // Create and initialize a search object.
    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:request];
    
    // Start the search and display the results as annotations on the map.
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error)
     {
        [self.mapView removeAnnotations:[self.mapView annotations]];
        MKMapRect zoomRect = MKMapRectNull;
         CustomAnnotation *annotation;
        for (MKMapItem *item in response.mapItems) {
            annotation = [[CustomAnnotation alloc] initWithMapItem:item];
            [self.mapView addAnnotation:annotation];
            
            MKMapPoint annotationPoint = MKMapPointForCoordinate(annotation.coordinate);
            MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0, 0);
            if (MKMapRectIsNull(zoomRect)) {
                zoomRect = pointRect;
            } else {
                zoomRect = MKMapRectUnion(zoomRect, pointRect);
            }
            
        }
        
         if ([response.mapItems count] == 1) {
             [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(
                                                                        annotation.coordinate,
                                                                        1000,
                                                                        1000
                                                                        )];
         } else {
             [self.mapView setVisibleMapRect:zoomRect animated:YES];
         }
    }];
    
    
    [self.searchBar resignFirstResponder];
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
