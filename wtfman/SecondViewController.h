//
//  SecondViewController.h
//  wtfman
//
//  Created by Alberto Plata on 4/28/14.
//  Copyright (c) 2014 Alberto Plata. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface SecondViewController : UIViewController{
    NSString *theTitle;
    UIImageView *animatedImageView;
    UIDynamicAnimator *animator;
    UIGravityBehavior *gravityBehavior;
    UICollisionBehavior* collisionBehavior;
    UILabel *xLabel;
    UILabel *yLabel;
    UILabel *zLabel;
    CGFloat screenWidth;
    CGFloat screenHeight;
    UIView *barrier;
    
}


@property (nonatomic, strong) NSString *theTitle;
@property (nonatomic, strong) UIView *barrier;
@property (nonatomic, strong) UIImageView *animatedImageView;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIGravityBehavior *gravityBehavior;
@property (nonatomic, strong) UICollisionBehavior* collisionBehavior;
@property (nonatomic, strong) CMMotionManager *manager;
@property (nonatomic, strong) UILabel *xLabel;
@property (nonatomic, strong) UILabel *yLabel;
@property (nonatomic, strong) UILabel *zLabel;
@property (nonatomic)         CGFloat screenWidth;
@property (nonatomic)         CGFloat screenHeight;
@end