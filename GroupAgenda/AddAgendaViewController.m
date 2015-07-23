//
//  AddAgendaViewController.m
//  GroupAgenda
//
//  Created by JunHao Peh on 23/7/15.
//  Copyright (c) 2015 JunHao Peh. All rights reserved.
//

#import "AddAgendaViewController.h"

@interface AddAgendaViewController ()

@end

@implementation AddAgendaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (sender != self.saveButton) return;
    
    self.name = self.nameField.text;
}


@end
