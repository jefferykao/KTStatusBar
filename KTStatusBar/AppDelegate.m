//
//  AppDelegate.m
//  KTStatusBar
//
//  Created by JefferyKao on 2018/5/17.
//  Copyright © 2018年 kkbox. All rights reserved.
//

#import "AppDelegate.h"
#import "KTTabbarController.h"
#import "KTFirstViewController.h"
#import "KTSecondViewController.h"

@interface AppDelegate () <KTTabbarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	NSArray *tabBarItems = @[
	@{@"title": @"first",
	  @"image": [[UIImage imageNamed:@"TabBar_Stream"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],
	  @"selectedImage":[UIImage imageNamed:@"TabBar_Stream_Selected"]},
	@{@"title": @"second",
	  @"image": [[UIImage imageNamed:@"TabBar_Library"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],
	  @"selectedImage":[UIImage imageNamed:@"TabBar_Library_Selected"]}
	];

	// tab
	KTFirstViewController *firstVC = [[KTFirstViewController alloc] init];
	KTSecondViewController *secondVC = [[KTSecondViewController alloc] init];
	UINavigationController *navi1Controller = [[UINavigationController alloc] initWithRootViewController:firstVC];
	UINavigationController *navi2Controller = [[UINavigationController alloc] initWithRootViewController:secondVC];

	KTTabbarController *tabBarController = [[KTTabbarController alloc] initWithItems:tabBarItems viewControllers:@[navi2Controller, navi1Controller]];
	self.window.rootViewController = tabBarController;
	[self.window makeKeyAndVisible];
	return YES;
}

- (void)tabbarController:(id)inTabBarController didSelectViewController:(UIViewController *)inViewController
{

}

@end
