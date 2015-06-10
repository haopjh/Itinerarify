//
//  AddMapItemViewController.h
//  GroupAgenda
//
//  Created by JunHao Peh on 7/6/15.
//  Copyright (c) 2015 JunHao Peh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface AddMapItemViewController : UIViewController <UISearchBarDelegate, MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
