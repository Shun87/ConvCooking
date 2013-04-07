//
//  UnitsConvertViewController.h
//  ConvCooking
//
//  Created by  on 13-4-7.
//  Copyright (c) 2013年 ChenShun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"

typedef enum 
{
    kVolume,
    kWeight,
    kTemperature,
}UnitType;

@interface UnitsConvertViewController : UIViewController<NIDropDownDelegate>
{
    NIDropDown *dropDown;
    NSMutableArray *units;
    UnitType type;
}
@property (nonatomic, assign) UnitType type;
- (IBAction)showUnit:(id)sender;
- (NSString *)convertedResult:(float)num sunit:(NSString *)inUnit toConv:(NSString *)toUnit;
@end
