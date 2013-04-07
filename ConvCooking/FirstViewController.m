//
//  FirstViewController.m
//  ConvCooking
//
//  Created by chenshun on 13-4-2.
//  Copyright (c) 2013年 ChenShun. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize resultView;
@synthesize inputTextField, resultTextfield;

- (void)dealloc
{
    [inputTextField release];
    [resultTextfield release];
    [resultView release];
    [units release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
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
}

- (IBAction)showInputUnit:(id)sender
{
    [self showUnit:sender];
}

- (IBAction)showOutputUnit:(id)sender
{
    [self showUnit:sender];
}

- (IBAction)done:(id)sender
{
    [inputTextField resignFirstResponder];
    NSString *text = [self convertedResult:[inputTextField.text floatValue] sunit:inputButton.titleLabel.text
                                    toConv:outputButton.titleLabel.text];
    resultTextfield.text = text;
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
