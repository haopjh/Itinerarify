//
//  AddAgendaViewController.h
//  GroupAgenda
//
//  Created by JunHao Peh on 23/7/15.
//  Copyright (c) 2015 JunHao Peh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddAgendaViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@property (nonatomic, strong) NSString *name;

@end
