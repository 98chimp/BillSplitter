//
//  ViewController.h
//  BillSplitter
//
//  Created by Shahin on 2015-03-23.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *billAmountInput;
@property (strong, nonatomic) IBOutlet UISlider *personSliderInput;
@property (strong, nonatomic) IBOutlet UISlider *tipSliderInput;
@property (strong, nonatomic) IBOutlet UIButton *tipCalculatorLabel;
@property (strong, nonatomic) IBOutlet UILabel *tipLabel;
@property (strong, nonatomic) IBOutlet UILabel *personLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalTipLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalBillLabel;
@property (strong, nonatomic) IBOutlet UILabel *tipPerPersonLabel;
@property (strong, nonatomic) IBOutlet UILabel *billPerPersonLabel;

@property (assign, nonatomic) int tipAmount;
@property (assign, nonatomic) int numberOfPersons;
@property (assign, nonatomic) double billAmount;
@property (assign, nonatomic) double totalTipAmount;
@property (assign, nonatomic) double totalBillAmount;
@property (assign, nonatomic) double tipPerPersonAmount;
@property (assign, nonatomic) double billPerPersonAmount;

- (IBAction)billAmountInput:(id)sender;
- (IBAction)tipSlider:(id)sender;
- (IBAction)personSlider:(id)sender;
- (IBAction)tipCalculatorButton:(id)sender;

@end

