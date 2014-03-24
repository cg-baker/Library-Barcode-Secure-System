//
//  BarViewController.m
//  Library Barcode Secure System
//
//  Created by Chloe Baker on 12/11/13.
//  Copyright (c) 2013 CBaker. All rights reserved.
//

#import "BarViewController.h"
#import "BarcodeDisplayView.h"

@interface BarViewController ()
@property (weak, nonatomic) IBOutlet BarcodeDisplayView *barcodeDisplayView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation BarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.barcodeDisplayView.barcode = self.user.barcodeNumber;
	// Do any additional setup after loading the view.
    self.nameLabel.text = self.user.name;
}

- (User *) user //lazy instantiation of User in getter method
{
    if (!_user) _user = [[User alloc] init];
    return _user;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
