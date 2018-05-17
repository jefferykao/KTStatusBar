//
//  KTTabbarController.h
//  KTStatusBar
//
//  Created by JefferyKao on 2018/5/17.
//  Copyright © 2018年 kkbox. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KTTabbarController;
@protocol KTTabbarControllerDelegate <NSObject>
- (void)tabbarController:(KTTabbarController *)inTabBarController didSelectViewController:(UIViewController *)inViewController;
@end

@interface KTTabbarController : UIViewController <UITabBarDelegate>
@property (strong, nonatomic) NSArray <UINavigationController *> *viewControllers;
@property (weak, nonatomic) id <KTTabbarControllerDelegate> delegate;
- (instancetype)initWithItems:(NSArray *)items viewControllers:(NSArray *)viewControllers;
- (void)showViewControllerAtIndex:(NSUInteger)index;
@end
