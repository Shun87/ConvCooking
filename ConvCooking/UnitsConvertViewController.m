//
//  UnitsConvertViewController.m
//  ConvCooking
//
//  Created by  on 13-4-7.
//  Copyright (c) 2013年 ChenShun. All rights reserved.
//

#import "UnitsConvertViewController.h"
#include "Conversion.h"

@implementation UnitsConvertViewController
@synthesize type;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        units = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (NSString *)convertedResult:(float)num sunit:(NSString *)inUnit toConv:(NSString *)toUnit
{
    NSInteger inIndex = [units indexOfObject:inUnit];
    NSInteger outIndex = [units indexOfObject:toUnit];
    if (inIndex >= 0 && inIndex < 10 && outIndex >=0 && outIndex < 10)
    {
        if (type == kVolume)
        {
            float value = volume[inIndex][outIndex];
            return [NSString stringWithFormat:@"%.4f", num * value];
        }
        else if (type == kWeight)
        {
            float value = weight[inIndex][outIndex];
            return [NSString stringWithFormat:@"%.4f", num * value];
        }
        else if (type == kTemperature)
        {
//            float value = temperature[inIndex][outIndex];
//            return [NSString stringWithFormat:@"%.4f", num * value];
        }
    }
    
    return nil;
}

-(void)rel
{
    [dropDown release];
    dropDown = nil;
}

- (IBAction)showUnit:(id)sender
{
    if(dropDown == nil)
    {
        CGFloat f = 200;
        dropDown = [[NIDropDown alloc]showDropDown:sender height:&f arr:units];
        dropDown.delegate = self;
    }
    else
    {
        [dropDown hideDropDown:sender];
        [self rel];
    }
}

#pragma mark -- NIDropDownDelegate
// called when select a row
- (void) niDropDownDelegateMethod: (NIDropDown *) sender
{
    [self rel];
}

#pragma mark - View lifecycle


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
