//
//  RootViewController.m
//  wtfman
//
//  Created by Alberto Plata on 4/28/14.
//  Copyright (c) 2014 Alberto Plata. All rights reserved.
//

#import "RootViewController.h"
#import "SecondViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

@synthesize tableView;

-(void) createData{
    data = [[NSArray alloc]initWithObjects:@"one",@"two",@"three", nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self createData];
    CGRect bounds = [[UIScreen mainScreen]bounds];
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, bounds.size.width, bounds.size.height-20) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.navigationController setNavigationBarHidden:NO];
    [self.view addSubview:tableView];
    self.title = @"Numbers";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45.0f;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [data count];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SecondViewController *newView = [[SecondViewController alloc]init];
    newView.theTitle = [self.tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    [newView.view setBackgroundColor:[UIColor redColor]];
    [self.navigationController pushViewController:newView animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [data objectAtIndex:indexPath .row];
    return cell;
    
}


@end
