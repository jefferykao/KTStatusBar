//
//  KTBasicViewController.m
//  KTStatusBar
//
//  Created by JefferyKao on 2018/5/17.
//  Copyright © 2018年 kkbox. All rights reserved.
//

#import "KTBasicViewController.h"

#pragma mark - KTBasicViewController
@implementation KTBasicViewController

- (instancetype)init
{
	if (self = [super init]) {
		_statusBarStyle = UIStatusBarStyleDefault;
	}

	return self;
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[self setNeedsStatusBarAppearanceUpdate];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
	return self.statusBarStyle;
}
@end
