//
//  KTTabbarController.m
//  KTStatusBar
//
//  Created by JefferyKao on 2018/5/17.
//  Copyright © 2018年 kkbox. All rights reserved.
//

#import "KTTabbarController.h"
#import "KTSecondViewController.h"

@interface KTTabbarController ()
@property (assign, nonatomic) NSUInteger selectedIndex;
@property (strong, nonatomic) UITabBar *tabBar;
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) NSMutableArray *tabBarItems;
@end

@implementation KTTabbarController

- (instancetype)initWithItems:(NSArray *)items viewControllers:(NSArray *)viewControllers
{
	if (self = [super init]) {

		self.viewControllers = viewControllers;
		self.selectedIndex = 0;
		for (UIViewController *vc in self.viewControllers) {
			[self addChildViewController:vc];
		}

		self.tabBarItems = [NSMutableArray array];
		for (NSUInteger index = 0; index < items.count; index++) {
			NSDictionary *itemInfo = items[index];
			UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:itemInfo[@"title"] image:itemInfo[@"image"] tag:index];
			[item setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor grayColor]} forState:UIControlStateNormal];
			[item setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateSelected];
			item.selectedImage = itemInfo[@"selectedImage"];
			[self.tabBarItems addObject:item];
		}
	}

	return self;
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	[self.view layoutIfNeeded];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];

	self.contentView = [[UIView alloc] init];
	self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
	self.contentView.clipsToBounds = YES;
	[self.view addSubview:self.contentView];
	[NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_contentView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_contentView)]];
	[NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_contentView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_contentView)]];

	self.tabBar = [[UITabBar alloc] init];
	self.tabBar.translatesAutoresizingMaskIntoConstraints = NO;
	self.tabBar.delegate = self;
	self.tabBar.items = self.tabBarItems;
	[self.view addSubview:self.tabBar];

	[NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_tabBar]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tabBar)]];
	NSLayoutConstraint *tabbarHeight = [NSLayoutConstraint constraintWithItem:self.tabBar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50];
	[self.tabBar addConstraint:tabbarHeight];
    NSLayoutConstraint *tabBarBottom = [NSLayoutConstraint constraintWithItem:self.tabBar attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
	[self.view addConstraint:tabBarBottom];
	[self showViewControllerAtIndex:0];
	[self.tabBar setSelectedItem:self.tabBarItems[0]];
}

- (void)showViewControllerAtIndex:(NSUInteger)index
{
	if (self.selectedIndex != NSNotFound) {
		UINavigationController *currentNavigationController = self.viewControllers[self.selectedIndex];
		[currentNavigationController.view removeFromSuperview];
	}
	self.selectedIndex = index;
    UINavigationController *targetViewController = self.viewControllers[index];
	UIView *activityView = targetViewController.view;
	activityView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.contentView addSubview:activityView];

	NSDictionary *views = NSDictionaryOfVariableBindings(activityView);
	[NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[activityView]|" options:0 metrics:nil views:views]];
	[NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[activityView]|" options:0 metrics:nil views:views]];

	[self.tabBar setSelectedItem:self.tabBarItems[index]];
}

#pragma mark - tabbar delegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
	[self showViewControllerAtIndex:item.tag];
}

#pragma mark - status bar method
-(UIStatusBarStyle)preferredStatusBarStyle
{
	UIViewController *vc = ((UINavigationController *)self.viewControllers[_selectedIndex]).topViewController;
	if ([vc isKindOfClass:[KTSecondViewController class]]) {
		return UIStatusBarStyleDefault;
	}
	return vc.preferredStatusBarStyle;
}

@end
