//
//  TemperatureViewController.h
//  ConvCooking
//
//  Created by  on 13-4-7.
//  Copyright (c) 2013年 ChenShun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UnitsConvertViewController.h"
@interface TemperatureViewController : UnitsConvertViewController
{
    UISlider *slider;
    UILabel *fahrenheitLabel;
    UILabel *celsiusLabel;
    IBOutlet UITextView *textView;
}
@property (nonatomic, retain)IBOutlet UILabel *fahrenheitLabel;
@property (nonatomic, retain)IBOutlet UILabel *celsiusLabel;
@property (nonatomic, retain)IBOutlet UISlider *slider;

- (IBAction)temperatureChange:(id)sender;
@end
