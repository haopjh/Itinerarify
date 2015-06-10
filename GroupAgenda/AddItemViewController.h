//
//  AddItemViewController.h
//  GroupAgenda
//
//  Created by JunHao Peh on 3/6/15.
//  Copyright (c) 2015 JunHao Peh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomAnnotation.h"
@interface AddItemViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *detailsField;
@property (weak, nonatomic) IBOutlet UITextField *dateField;

@property (weak, nonatomic) CustomAnnotation *selectedPin;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *details;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSNumber *timestampStart;
@property (nonatomic, strong) NSNumber *timestampCreated;


@end
