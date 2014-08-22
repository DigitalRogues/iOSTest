//
//  MenuViewController.m
//  iOSTest
//
//  Created by Brandon on 8/20/14.
//  Copyright (c) 2014 Digital Rogues. All rights reserved.
//

#import "MenuViewController.h"


@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //self.navigationItem.hidesBackButton = YES;
    
    [self buildHamburger];
   


}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
    //set bool for text changing
    self.labelBool = YES;
    [self buildBlur];
    
   
   
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:NO];
    self.textLabel = [[TOMSMorphingLabel alloc] initWithFrame:CGRectMake(0, 0, 130, 100)];
    self.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:40];
//    self.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
//    self.textLabel.numberOfLines = 0;
   // [self.textLabel sizeToFit];
    self.textLabel.text = @"Hello";
    [self.view addSubview:self.textLabel];
    
    
    
    
    [self startTimer];
}


-(void)labelConstraints
{
    
}

- (void)startTimer
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1
                                             target:self
                                           selector:@selector(loopText)
                                           userInfo:nil
                                            repeats:YES];
    [timer fire];
    
}

-(void)loopText
{
    
    if (self.labelBool == YES)
    {
        self.textLabel.text = @"Envoy";
        self.labelBool = NO;
    }
    
    else{
        self.textLabel.text = @"Hello";
        self.labelBool = YES;

    }
    
}

-(void)buildBlur
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"colorful_reef.jpg"]];
    NSString *deviceType = [UIDevice currentDevice].model;
    if([deviceType isEqualToString:@"iPhone"])
    {
        self.blurView = [[FXBlurView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, [[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height)];
    }
    else {
        self.blurView = [[FXBlurView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, [[UIScreen mainScreen] bounds].size.height,[[UIScreen mainScreen] bounds].size.width)];
    }
    self.blurView.underlyingView = self.view;
    [self.view addSubview:self.blurView];
    [self.view sendSubviewToBack:self.blurView];

}


-(void)buildHamburger
{
    self.menuButton = [[FRDLivelyButton alloc] initWithFrame:CGRectMake(0,0,36,28)];
    [self.menuButton setStyle:kFRDLivelyButtonStyleClose animated:YES];
    [self.menuButton addTarget:self action:@selector(hamburgerAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.menuButton];
    self.menuButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSArray *upperConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_menuButton]"
                                                                       options:0
                                                                       metrics:nil
                                                                         views:NSDictionaryOfVariableBindings(_menuButton)];
    
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_menuButton]-20-|"
                                                                   options:0
                                                                   metrics:nil
                                                                     views:NSDictionaryOfVariableBindings(_menuButton)];
    
    
    [self.view addConstraints:constraints];
    [self.view addConstraints:upperConstraint];
}

-(void)hamburgerAction
{
        [self.menuButton setStyle:kFRDLivelyButtonStyleHamburger animated:YES];
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
