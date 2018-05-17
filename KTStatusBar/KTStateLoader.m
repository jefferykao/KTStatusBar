//
//  KTStateLoader.m
//  KTStatusBar
//
//  Created by JefferyKao on 2018/5/17.
//  Copyright © 2018年 kkbox. All rights reserved.
//

#import "KTStateLoader.h"

@interface KTStateLoader()
@end

@implementation KTStateLoader
- (void)loadStateWithType:(KTViewState)type completedCallback:(void (^)(void))cpdCallback
{
	switch(type) {
		case KTViewStateSellingTrigger: {
			// do your view state change
			break;
		}
		default: break;
	}
	// show the loading view
	if (cpdCallback) {
		cpdCallback();
	}
}
@end
