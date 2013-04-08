//
//  AppDelegate.m
//  ConvCooking
//
//  Created by chenshun on 13-4-2.
//  Copyright (c) 2013年 ChenShun. All rights reserved.
//

#import "AppDelegate.h"

#import "FirstViewController.h"

#import "TemperatureViewController.h"

@implementation AppDelegate
@synthesize window = _window;
@synthesize adBanner;
@synthesize tabBarController = _tabBarController;
- (void)dealloc
{
    [adBanner release];
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];

    FirstViewController *viewController1 = [[[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil] autorelease];
    viewController1.type = kVolume;
    viewController1.title = NSLocalizedString(@"Volume", @"Volume");
    viewController1.tabBarItem.image = [UIImage imageNamed:@"Volume"];
    FirstViewController *viewController2 = [[[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil] autorelease];
    viewController2.type = kWeight;
    viewController2.title = NSLocalizedString(@"Weight", @"Weight");
    viewController2.tabBarItem.image = [UIImage imageNamed:@"weight"];
    TemperatureViewController *viewController3 = [[[TemperatureViewController alloc] initWithNibName:@"TemperatureViewController" bundle:nil] autorelease];
    viewController3.type = kTemperature;
    viewController3.title = NSLocalizedString(@"Temperature", @"Temperature");
    viewController3.tabBarItem.image = [UIImage imageNamed:@"thermometer"];
    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1,viewController2, viewController3, nil];
    
    self.window.rootViewController = self.tabBarController;
    
    // Initialize the banner at the bottom of the screen.
    CGPoint origin = CGPointMake(0.0,
                                 self.window.frame.size.height -
                                 CGSizeFromGADAdSize(kGADAdSizeBanner).height - 49);
    
    // Use predefined GADAdSize constants to define the GADBannerView.
    self.adBanner = [[[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner
                                                    origin:origin]
                     autorelease];
    
    // Note: Edit SampleConstants.h to provide a definition for kSampleAdUnitID
    // before compiling.
    self.adBanner.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    self.adBanner.adUnitID = @"a15162e493d39de";
    self.adBanner.delegate = self;
    [self.adBanner setRootViewController:self.tabBarController];
    self.adBanner.center =
    CGPointMake(self.window.center.x, self.adBanner.center.y);
    [self.adBanner loadRequest:[self createRequest]];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark GADRequest generation

// Here we're creating a simple GADRequest and whitelisting the application
// for test ads. You should request test ads during development to avoid
// generating invalid impressions and clicks.
- (GADRequest *)createRequest {
    GADRequest *request = [GADRequest request];
//    NSString *uuid = [[UIDevice currentDevice] uniqueIdentifier];
//    request.testDevices = [NSArray arrayWithObjects:
//                           uuid,                                           // 模拟器
//                                        
//                           nil];
    
    return request;
}

#pragma mark GADBannerViewDelegate impl

// We've received an ad successfully.
- (void)adViewDidReceiveAd:(GADBannerView *)adView {
    NSLog(@"Received ad successfully");
}

- (void)adView:(GADBannerView *)view
didFailToReceiveAdWithError:(GADRequestError *)error {
    NSLog(@"Failed to receive ad with error: %@", [error localizedFailureReason]);
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
