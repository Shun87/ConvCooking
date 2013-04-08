//
//  FirstViewController.m
//  ConvCooking
//
//  Created by chenshun on 13-4-2.
//  Copyright (c) 2013年 ChenShun. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"

#define HEXCOLOR(rgbValue, alpa) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:alpa]
@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize resultView;
@synthesize inputTextField, resultTextfield;
@synthesize topLabel;
- (void)dealloc
{
    [inputTextField release];
    [resultTextfield release];
    [resultView release];
    [units release];
    [topLabel release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = HEXCOLOR(0xe9eaeb, 1);
    UIImage *backgroundImage = [[UIImage imageNamed:@"textBk.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0,15,0,6)];
    
    inputTextField.background = backgroundImage;
    resultTextfield.background = backgroundImage;
    if (type == kVolume)
    {
        [inputButton setTitle:@"Cup" forState:UIControlStateNormal];
        [outputButton setTitle:@"Fluid ounce" forState:UIControlStateNormal];
        [units addObjectsFromArray:[NSArray arrayWithObjects:@"Cup", @"Fluid ounce", @"Gallon",  @"Gill", @"Liter", @"Milliliter",
                                    @"Pint", @"Quart", @"Tablespoon",  @"Teaspoon", nil]];
    }
    else if (type == kWeight)
    {

        [inputButton setTitle:@"Kilogram" forState:UIControlStateNormal];
        [outputButton setTitle:@"Gram" forState:UIControlStateNormal];
        [units addObjectsFromArray:[NSArray arrayWithObjects:@"Gram", @"Kilogram",  @"Ounce", @"Pound", nil]];
    }
    
    [self resetValue];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    if (app.adBanner.superview != nil)
    {
        [app.adBanner removeFromSuperview];
    }
    CGRect rect = app.adBanner.frame;
    rect.origin.y = self.view.frame.size.height -  CGSizeFromGADAdSize(kGADAdSizeBanner).height;
    app.adBanner.frame = rect;
    app.adBanner.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:app.adBanner];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if (dropDown != nil)
    {
        [self showUnit:nil];
    }
}

- (IBAction)showInputUnit:(id)sender
{
    [self showUnit:sender];
}

- (IBAction)showOutputUnit:(id)sender
{
    [self showUnit:sender];
}

- (void)resetValue
{
    if ([inputTextField.text length] <= 0)
    {
        inputTextField.text = @"1.0";
    }
    
    NSString *text = [self convertedResult:[inputTextField.text floatValue] sunit:inputButton.titleLabel.text
                                    toConv:outputButton.titleLabel.text];
    resultTextfield.text = text;
    NSString *eachValue = [self convertedResult:1.0 sunit:inputButton.titleLabel.text
                                         toConv:outputButton.titleLabel.text];
    topLabel.text = [NSString stringWithFormat:@"1 %@ = %@ %@", inputButton.titleLabel.text, eachValue, outputButton.titleLabel.text];
}

- (IBAction)done:(id)sender
{
    [inputTextField resignFirstResponder];
    [self resetValue];
    if (dropDown != nil)
    {
        [self showUnit:nil];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ((([string compare:@"0"]  == NSOrderedDescending || [string compare:@"0"]  == NSOrderedSame) 
        && ([string compare:@"9"]  == NSOrderedAscending || [string compare:@"9"]  == NSOrderedSame)) 
        || [string isEqualToString:@""]
        || [string isEqualToString:@"."]
        || [string isEqualToString:@"\n"])
    {
        return YES;
    }
    
    return NO;
}

- (IBAction)ClearAction:(id)sender
{
    inputTextField.text = nil;
    resultTextfield.text = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
