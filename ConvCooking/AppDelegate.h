//
//  AppDelegate.h
//  ConvCooking
//
//  Created by chenshun on 13-4-2.
//  Copyright (c) 2013年 ChenShun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADBannerView.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate, GADBannerViewDelegate>
{
    GADBannerView *bannerView_;
}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) GADBannerView *adBanner;
@property (strong, nonatomic) UITabBarController *tabBarController;

@end
