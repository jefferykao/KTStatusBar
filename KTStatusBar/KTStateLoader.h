//
//  KTStateLoader.h
//  KTStatusBar
//
//  Created by JefferyKao on 2018/5/17.
//  Copyright © 2018年 kkbox. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, KTViewState) {
	KTViewStateSellingTrigger,
	KTViewStateNoNetwork,
	KTViewStateEmpty
};

@interface KTStateLoader: NSObject
- (void)loadStateWithType:(KTViewState)type completedCallback:(void (^)(void))cpdCallback;
@end
