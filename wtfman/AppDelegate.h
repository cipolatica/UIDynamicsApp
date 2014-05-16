//
//  AppDelegate.h
//  wtfman
//
//  Created by Alberto Plata on 4/28/14.
//  Copyright (c) 2014 Alberto Plata. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    UINavigationController *navController;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,retain) UINavigationController *navController;
@property (nonatomic,retain) RootViewController *rootViewController;

@end
