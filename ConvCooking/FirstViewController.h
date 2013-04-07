//
//  FirstViewController.h
//  ConvCooking
//
//  Created by chenshun on 13-4-2.
//  Copyright (c) 2013年 ChenShun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UnitsConvertViewController.h"

@interface FirstViewController : UnitsConvertViewController
{
    UITableView *resultView;
    UITextField *inputTextField;
    UITextField *resultTextfield;
    
    IBOutlet UIButton *inputButton;
    IBOutlet UIButton *outputButton;
}
@property (nonatomic, retain)IBOutlet UITableView *resultView;
@property (nonatomic, retain)IBOutlet UITextField *inputTextField;
@property (nonatomic, retain)IBOutlet UITextField *resultTextfield;

- (IBAction)showInputUnit:(id)sender;
- (IBAction)showOutputUnit:(id)sender;
- (IBAction)done:(id)sender;
- (IBAction)CovertAction:(id)sender;
- (IBAction)ClearAction:(id)sender;
@end
