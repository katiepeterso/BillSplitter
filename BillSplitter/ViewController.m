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
@property (strong, nonatomic) IBOutlet UILabel *numberOfPeopleLabel;
@property (strong, nonatomic) IBOutlet UILabel *percentTipLabel;

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

- (IBAction)typeBillAmount:(UITextField *)sender {
    
    NSDecimalNumber *bill = [NSDecimalNumber decimalNumberWithString:sender.text];
    
    NSNumber *tip = [NSNumber numberWithFloat:(100.00 + self.percentTip.value)/100.00];
    NSDecimalNumber *decTip = [NSDecimalNumber decimalNumberWithDecimal:[tip decimalValue]];
    
    NSNumber *people = [NSNumber numberWithFloat:self.numberOfPeople.value];
    NSDecimalNumber *decPeople = [NSDecimalNumber decimalNumberWithDecimal:[people decimalValue]];
    
    NSDecimalNumber *withTip = [bill decimalNumberByMultiplyingBy:decTip];
    NSDecimalNumber *totalEach = [withTip decimalNumberByDividingBy:decPeople];
    
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    self.amountEach.text = [formatter stringFromNumber:totalEach];
}

- (IBAction)selectNumberOfPeople:(UISlider *)sender {
    
    if ([self.billAmount.text length] == 0) {
        self.numberOfPeopleLabel.text = [[NSString stringWithFormat:@"%.0f", sender.value] stringByAppendingString:@" People"];
    }
    else {
        sender = self.numberOfPeople;
        NSDecimalNumber *bill = [NSDecimalNumber decimalNumberWithString:self.billAmount.text];

        NSNumber *tip = [NSNumber numberWithFloat:(100.00 + self.percentTip.value)/100.00];
        NSDecimalNumber *decTip = [NSDecimalNumber decimalNumberWithDecimal:[tip decimalValue]];
        
        NSNumber *people = [NSNumber numberWithFloat:sender.value];
        NSDecimalNumber *decPeople = [NSDecimalNumber decimalNumberWithDecimal:[people decimalValue]];
        
        NSDecimalNumber *withTip = [bill decimalNumberByMultiplyingBy:decTip];
        NSDecimalNumber *totalEach = [withTip decimalNumberByDividingBy:decPeople];
        
        NSNumberFormatter *currencyFormatter = [NSNumberFormatter new];
        [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        self.amountEach.text = [currencyFormatter stringFromNumber:totalEach];
        self.numberOfPeopleLabel.text = [[NSString stringWithFormat:@"%.0f", sender.value] stringByAppendingString:@" People"];
    }
}

- (IBAction)selectTipPercentage:(UISlider *)sender {
    if ([self.billAmount.text length] == 0) {
        self.percentTipLabel.text = [[NSString stringWithFormat:@"%.0f", sender.value] stringByAppendingString:@"%"];
    }
    else {
        sender = self.percentTip;
        NSDecimalNumber *bill = [NSDecimalNumber decimalNumberWithString:self.billAmount.text];
        
        NSNumber *tip = [NSNumber numberWithFloat:(100.00 + sender.value)/100.00];
        NSDecimalNumber *decTip = [NSDecimalNumber decimalNumberWithDecimal:[tip decimalValue]];
        
        NSNumber *people = [NSNumber numberWithFloat:self.numberOfPeople.value];
        NSDecimalNumber *decPeople = [NSDecimalNumber decimalNumberWithDecimal:[people decimalValue]];
        
        NSDecimalNumber *withTip = [bill decimalNumberByMultiplyingBy:decTip];
        NSDecimalNumber *totalEach = [withTip decimalNumberByDividingBy:decPeople];
        
        NSNumberFormatter *currencyFormatter = [NSNumberFormatter new];
        [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        self.amountEach.text = [currencyFormatter stringFromNumber:totalEach];
        self.percentTipLabel.text = [[NSString stringWithFormat:@"%.0f", sender.value] stringByAppendingString:@"%"];
    }
}

@end
