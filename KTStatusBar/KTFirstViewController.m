//
//  KTFirstViewController.m
//  KTStatusBar
//
//  Created by JefferyKao on 2018/5/17.
//  Copyright © 2018年 kkbox. All rights reserved.
//

#import "KTFirstViewController.h"
#import "KTStateLoader.h"

@interface KTFirstViewController()
@property (strong, nonatomic) KTStateLoader *stateLoader;
@end

@implementation KTFirstViewController
- (instancetype)init
{
	if (self = [super init]) {
		self.stateLoader = [[KTStateLoader alloc] init];
		self.view.backgroundColor = [UIColor blackColor];
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	__weak typeof(self) weakSelf = self;
	[self.stateLoader loadStateWithType:KTViewStateEmpty completedCallback:^{
//		 check state and make UI difference
		weakSelf.statusBarStyle = UIStatusBarStyleLightContent;
		[weakSelf setNeedsStatusBarAppearanceUpdate];
	}];
}
@end

