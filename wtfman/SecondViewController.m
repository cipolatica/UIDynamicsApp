//
//  SecondViewController.m
//  wtfman
//
//  Created by Alberto Plata on 4/28/14.
//  Copyright (c) 2014 Alberto Plata. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize theTitle;
@synthesize animatedImageView;
@synthesize gravityBehavior;
@synthesize collisionBehavior;
@synthesize animator;
@synthesize manager;
@synthesize xLabel, yLabel, zLabel;
@synthesize screenWidth, screenHeight;
@synthesize barrier;



-(void)dropBall{
    self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    
    self.gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.animatedImageView]];
    [self.gravityBehavior setMagnitude:2.0f];
    [self.animator addBehavior:self.gravityBehavior];
    
    self.collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.animatedImageView, self.barrier]];
    self.collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [self.collisionBehavior setCollisionMode:UICollisionBehaviorModeEverything];
    [self.animator addBehavior:self.collisionBehavior];
    CGFloat height = self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height;
    
    CGPoint navBarBottomLeftEdge = CGPointMake(0, height);
    CGPoint navBarBottomRightEdge = CGPointMake(self.screenWidth, height);
    [self.collisionBehavior addBoundaryWithIdentifier:@"navBarBoundry" fromPoint:navBarBottomLeftEdge toPoint:navBarBottomRightEdge];
    
    CGPoint topLeftEdge = CGPointMake(self.screenWidth/2, self.screenHeight-150);
    CGPoint topRightEdge = CGPointMake(self.screenWidth, self.screenHeight-150);
    [self.collisionBehavior addBoundaryWithIdentifier:@"topSideBoundry" fromPoint:topLeftEdge toPoint:topRightEdge];
    
    CGPoint bottomLeftEdge = CGPointMake(self.screenWidth/2, self.screenHeight);
    [self.collisionBehavior addBoundaryWithIdentifier:@"leftSideBoundry" fromPoint:topLeftEdge toPoint:bottomLeftEdge];
    
    self.manager = [[CMMotionManager alloc]init];
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(getValues:) userInfo:nil repeats:YES];
    self.manager.accelerometerUpdateInterval = 0.05;  // 20 Hz
    [self.manager startAccelerometerUpdates];
}

- (void)setAngle:(CGFloat)angle magnitude:(CGFloat)magnitude{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = theTitle;
    CGRect bounds = [[UIScreen mainScreen]bounds];
    self.screenWidth = bounds.size.width;
    self.screenHeight = bounds.size.height;
    CGFloat imageWidth = [[UIImage imageNamed:@"image.png"] size].width;
    CGFloat xPos = (screenWidth/2.0f)-(imageWidth/2.0f);
    self.animatedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(xPos, 120, 15, 14)];
    self.animatedImageView.animationImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"small_smiley.gif"], nil];
    self.animatedImageView.animationDuration = 1.0f;
    self.animatedImageView.animationRepeatCount = 0;
    [self.animatedImageView startAnimating];
    [self.view addSubview: self.animatedImageView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self action:@selector(dropBall) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Drop Me" forState:UIControlStateNormal];
    button.frame = CGRectMake(xPos+40, 120-10, 70.0f, 40.0);
    [self.view addSubview:button];
    
    self.barrier = [[UIView alloc] initWithFrame:CGRectMake(0, 300, 130, 20)];
    self.barrier.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.barrier];
    
    self.xLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.screenWidth/2, self.screenHeight-150, self.screenWidth/2, 50)];
    self.xLabel.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.xLabel];
    self.yLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.screenWidth/2, self.screenHeight-100, self.screenWidth/2, 50)];
    self.yLabel.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.yLabel];
    self.zLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.screenWidth/2, self.screenHeight-50, self.screenWidth/2, 50)];
    self.zLabel.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.zLabel];
    
}

-(void) getValues:(NSTimer *) timer {
    
    [self.gravityBehavior setGravityDirection:CGVectorMake(self.manager.accelerometerData.acceleration.x, -self.manager.accelerometerData.acceleration.y)];
    self.xLabel.text = [NSString stringWithFormat:@"X Accel: %.2f",self.manager.accelerometerData.acceleration.x];
    self.yLabel.text = [NSString stringWithFormat:@"Y Accel: %.2f",self.manager.accelerometerData.acceleration.y];
    self.zLabel.text = [NSString stringWithFormat:@"Z Accel: %.2f",self.manager.accelerometerData.acceleration.z];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
