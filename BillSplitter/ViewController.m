//
//  ViewController.m
//  BillSplitter
//
//  Created by Katherine Peterson on 2015-09-05.
//  Copyright (c) 2015 KatieExpatriated. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextField *billAmount;
@property (strong, nonatomic) IBOutlet UISlider *numberOfPeople;
@property (strong, nonatomic) IBOutlet UISlider *percentTip;
@property (strong, nonatomic) IBOutlet UILabel *amountEach;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)typingBillAmount:(UITextField *)sender {
    
}

- (IBAction)calculateSplit:(UISlider *)sender {
    
}

@end
