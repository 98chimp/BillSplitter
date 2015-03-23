//
//  ViewController.m
//  BillSplitter
//
//  Created by Shahin on 2015-03-23.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    self.billAmount = 0;
    self.tipAmount = 15;
    self.numberOfPersons = 2;
    self.totalTipAmount = 0;
    self.totalBillAmount = 0;
    self.tipPerPersonAmount = 0;
    self.billPerPersonAmount = 0;
    self.tipLabel.text = [NSString stringWithFormat:@"%d%%", self.tipAmount];
    self.personLabel.text = [NSString stringWithFormat:@"%d", self.numberOfPersons];
    self.totalTipLabel.text = [NSString stringWithFormat:@"$%.2f", self.totalTipAmount];
    self.totalBillLabel.text = [NSString stringWithFormat:@"$%.2f", self.totalBillAmount];
    self.tipPerPersonLabel.text = [NSString stringWithFormat:@"$%.2f", self.tipPerPersonAmount];
    self.billPerPersonLabel.text = [NSString stringWithFormat:@"$%.2f", self.billPerPersonAmount];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)orientationChanged:(NSNotification *)notification {
    // Respond to changes in device orientation
}

-(void) viewDidDisappear {
    // Request to stop receiving accelerometer events and turn off accelerometer
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [self becomeFirstResponder];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake)
    {
        // User was shaking the device. Post a notification named "shake."
        [[NSNotificationCenter defaultCenter] postNotificationName:@"shake" object:self];
        self.billAmount = 0;
        self.tipAmount = 15;
        self.numberOfPersons = 2;
        self.totalTipAmount = 0;
        self.totalBillAmount = 0;
        self.tipPerPersonAmount = 0;
        self.billPerPersonAmount = 0;
        self.tipSliderInput.value = self.tipAmount;
        self.personSliderInput.value = self.numberOfPersons;
        self.tipLabel.text = [NSString stringWithFormat:@"%d%%", self.tipAmount];
        self.personLabel.text = [NSString stringWithFormat:@"%d", self.numberOfPersons];
        self.totalTipLabel.text = [NSString stringWithFormat:@"$%.2f", self.totalTipAmount];
        self.totalBillLabel.text = [NSString stringWithFormat:@"$%.2f", self.totalBillAmount];
        self.tipPerPersonLabel.text = [NSString stringWithFormat:@"$%.2f", self.tipPerPersonAmount];
        self.billPerPersonLabel.text = [NSString stringWithFormat:@"$%.2f", self.billPerPersonAmount];
        self.billAmountInput.text = [NSString stringWithFormat:@"0.00"];
    }
}

- (IBAction)billAmountInput:(UITextField *)sender {
    self.billAmount = [sender.text floatValue];
    [self recalculateTip];
}

- (void)recalculateTip {
    self.totalTipAmount = self.billAmount * self.tipAmount / 100;
    self.totalTipLabel.text = [NSString stringWithFormat:@"$%.2f", self.totalTipAmount];
    self.totalBillAmount = self.billAmount + self.totalTipAmount;
    self.totalBillLabel.text = [NSString stringWithFormat:@"$%.2f", self.totalBillAmount];
    
    self.tipPerPersonAmount = self.totalTipAmount / self.numberOfPersons;
    self.tipPerPersonLabel.text = [NSString stringWithFormat:@"$%.2f", self.tipPerPersonAmount];
    self.billPerPersonAmount = self.totalBillAmount / self.numberOfPersons;
    self.billPerPersonLabel.text = [NSString stringWithFormat:@"$%.2f", self.billPerPersonAmount];
}

- (IBAction)tipSlider:(id)sender {
    
    self.tipLabel.text = [NSString stringWithFormat:@"%d%%", self.tipAmount];
    self.tipAmount = self.tipSliderInput.value;
    [self recalculateTip];
}

- (IBAction)personSlider:(id)sender {
    self.personLabel.text = [NSString stringWithFormat:@"%d", self.numberOfPersons];
    self.numberOfPersons = self.personSliderInput.value;
    [self recalculateTip];
}

- (IBAction)tipCalculatorButton:(id)sender {
    [self recalculateTip];
    [self.view endEditing:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

@end
