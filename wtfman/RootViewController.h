//
//  RootViewController.h
//  wtfman
//
//  Created by Alberto Plata on 4/28/14.
//  Copyright (c) 2014 Alberto Plata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    UITableView *tableView;
    NSArray *data;
}
@property (nonatomic, retain) UITableView *tableView;
@end
