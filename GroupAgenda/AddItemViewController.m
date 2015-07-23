//
//  AddItemViewController.m
//  GroupAgenda
//
//  Created by JunHao Peh on 3/6/15.
//  Copyright (c) 2015 JunHao Peh. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()

@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Enter add item form");
    //Set name
    if(self.selectedPin) {
        self.nameField.text = self.selectedPin.title;
    }
    
    // Do any additional setup after loading the view.
    UIDatePicker* picker = [[UIDatePicker alloc] init];
    picker.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    picker.datePickerMode = UIDatePickerModeDate;
    picker.backgroundColor = [UIColor whiteColor];
    
    UIView *inputAccView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 310.0, 40.0)];
    [inputAccView setBackgroundColor:[UIColor lightGrayColor]];
    [inputAccView setAlpha: 0.8];
    UIButton *btnPrev = [UIButton buttonWithType: UIButtonTypeCustom];
    
    // Set the button’ s frame. We will set their widths to 80px and height to 40px.
    [btnPrev setFrame: CGRectMake(([UIScreen mainScreen].bounds.size.width-80.0), 0.0, 80.0, 40.0)];
    [btnPrev setTitle: @"Done" forState: UIControlStateNormal];
    [btnPrev setBackgroundColor: [UIColor blackColor]];
    
    [btnPrev addTarget: self action: @selector(setDateText:) forControlEvents: UIControlEventTouchUpInside];

    
    // Now that our buttons are ready we just have to add them to our view.
    [inputAccView addSubview:btnPrev];
    [self.dateField setInputView: picker];
    [self.dateField setInputAccessoryView:inputAccView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDateText:(id) sender {
    [self.dateField resignFirstResponder];
    UIDatePicker *picker = (UIDatePicker*)self.dateField.inputView;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM dd yyyy, h:mm a"];
    NSDate *date = picker.date;
    self.dateField.text = [dateFormatter stringFromDate:date];
    self.timestampStart = [NSNumber numberWithInt:[picker.date timeIntervalSince1970]];
//    self.dateField.text = [[NSNumber numberWithInt:[picker.date timeIntervalSince1970]] stringValue];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if (sender != self.saveButton) return;
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    self.name = self.nameField.text;
    self.details = self.detailsField.text;
    
    NSMutableString *coordinate = [NSMutableString localizedStringWithFormat:@"%f",self.selectedPin.coordinate.latitude];
    [coordinate appendString:@","];
    [coordinate appendString:[NSMutableString localizedStringWithFormat:@"%f",self.selectedPin.coordinate.longitude]];
    self.location = coordinate;
    
    self.timestampCreated = [NSNumber numberWithInt:[[NSDate date] timeIntervalSince1970]];
}


@end
