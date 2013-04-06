//
//  FirstViewController.h
//  ConvCooking
//
//  Created by chenshun on 13-4-2.
//  Copyright (c) 2013年 ChenShun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"

@interface FirstViewController : UIViewController<NIDropDownDelegate>
{
    UITableView *resultView;
    UITextField *inputTextField;
    UITextField *resultTextfield;
    
    NIDropDown *dropDown;
}
@property (nonatomic, retain)IBOutlet UITableView *resultView;
@property (nonatomic, retain)IBOutlet UITextField *inputTextField;
@property (nonatomic, retain)IBOutlet UITextField *resultTextfield;

- (IBAction)showUnit:(id)sender;
@end
