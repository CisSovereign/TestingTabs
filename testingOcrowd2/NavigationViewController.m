//
//  NavigationViewController.m
//  testingOcrowd2
//
//  Created by Collin Hartigan on 7/2/14.
//  Copyright (c) 2014 testing. All rights reserved.
//

#import "NavigationViewController.h"
#import "RBMenu.h"
#import "FirstViewController.h"
#import "FirstSecondViewController.h"

@interface NavigationViewController ()

@property(nonatomic, strong)RBMenu *menu;

@end

@implementation NavigationViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //creating the menu items
    FirstViewController *firstViewController = [storyboard instantiateViewControllerWithIdentifier:@"firstView"];
    [self setViewControllers:@[firstViewController] animated:NO];
    
    RBMenuItem *item = [[RBMenuItem alloc]initMenuItemWithTitle:@"First" withCompletionHandler:^(BOOL finished){
        
        FirstViewController *firstViewController = [storyboard instantiateViewControllerWithIdentifier:@"firstView"];
        [self setViewControllers:@[firstViewController] animated:NO];
        NSLog(@"First selected");
        
    }];
    RBMenuItem *item2 = [[RBMenuItem alloc]initMenuItemWithTitle:@"Second" withCompletionHandler:^(BOOL finished){
        
         FirstSecondViewController *secondViewController = [storyboard instantiateViewControllerWithIdentifier:@"secondView"];
        [self setViewControllers:@[secondViewController] animated:NO];
        NSLog(@"Second selected");
        
    }];
    
    _menu = [[RBMenu alloc] initWithItems:@[item, item2] andTextAllignment:RBMenuTextAllignmentLeft forViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
