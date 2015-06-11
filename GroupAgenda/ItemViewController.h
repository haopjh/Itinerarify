//
//  ItemViewController.h
//  GroupAgenda
//
//  Created by JunHao Peh on 11/6/15.
//  Copyright (c) 2015 JunHao Peh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import <MapKit/MapKit.h>


@interface ItemViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *nameField;
@property (weak, nonatomic) IBOutlet UILabel *detailsField;
@property (weak, nonatomic) IBOutlet UILabel *dateField;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UIView *deleteButton;


@property Item *item;

@end
