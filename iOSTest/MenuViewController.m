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

    self.navigationItem.hidesBackButton = YES;
    
    [self buildHamburger];
   


}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:NO];
     [self setupAnimators];
    self.labelBool = YES;
    
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

-(void)setupAnimators
{
  
 
    
    ///creat amin animator object
    self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    self.animator.delegate = self;
    
    //create gravity object and add it to animator
    self.gravity = [[UIGravityBehavior alloc] initWithItems:@[self.textLabel]];
    [self.animator addBehavior:self.gravity];
    
    
    //create collision object (and set options) so items can be added ot it later. and add to animator
    self.collision = [[UICollisionBehavior alloc] initWithItems:@[self.textLabel]];
    self.collision.translatesReferenceBoundsIntoBoundary = YES;
    self.collision.collisionDelegate = self;
    [self.animator addBehavior:self.collision];
    
    
    self.itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.textLabel]];
    self.itemBehavior.elasticity = 1.0;
    [self.animator addBehavior:self.itemBehavior];

    

}

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item
   withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p {
     //NSLog(@"Boundary contact occurred - %@", identifier);
     //NSLog(@"POINT contact occurred - %f", p.y);
    if (self.labelBool == YES) {
        self.textLabel.text = @"Envoy";
        self.labelBool = NO;
    }
    else{
        self.textLabel.text = @"Hello";
        self.labelBool = YES;

    }
    
    }


-(void)buildHamburger
{
    self.menuButton = [[FRDLivelyButton alloc] initWithFrame:CGRectMake(0,0,36,28)];
    [self.menuButton setStyle:kFRDLivelyButtonStyleClose animated:YES];
    [self.menuButton addTarget:self action:@selector(hamburgerAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:self.menuButton];
    self.navigationItem.rightBarButtonItem = buttonItem;
    
}

-(void)hamburgerAction
{
        [self.menuButton setStyle:kFRDLivelyButtonStyleHamburger animated:YES];
        [self.navigationController popToRootViewControllerAnimated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
