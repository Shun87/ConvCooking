//
//  TemperatureViewController.m
//  ConvCooking
//
//  Created by  on 13-4-7.
//  Copyright (c) 2013年 ChenShun. All rights reserved.
//

#import "TemperatureViewController.h"

@implementation TemperatureViewController
@synthesize slider, fahrenheitLabel, celsiusLabel;

- (void)dealloc
{
    [slider release];
    [fahrenheitLabel release];
    [celsiusLabel release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [units addObjectsFromArray:[NSArray arrayWithObjects:@"Celsius", @"Fahrenheit", nil]];
    self.slider.minimumValue = -100;
    self.slider.maximumValue = 800;
    self.slider.value = 32.0;
    [self temperatureChange:nil];
}

- (IBAction)temperatureChange:(id)sender
{
    fahrenheitLabel.text = [NSString stringWithFormat:@"%.0f℉ ", slider.value];
    float value = (slider.value - 32.00) / 1.8;
    celsiusLabel.text = [NSString stringWithFormat:@"%.0f℃", value];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
