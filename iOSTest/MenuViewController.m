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
    //[self setUpConstraints];

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

//-(void)buildHamburger
//{
//    self.menuButton  = [[VBFPopFlatButton alloc]initWithFrame:CGRectMake(275, 20, 30, 30)
//                                                   buttonType:buttonCloseType
//                                                  buttonStyle:buttonRoundedStyle];
//    self.menuButton.roundBackgroundColor = [UIColor whiteColor];
//    self.menuButton.lineThickness = 2;
//    self.menuButton.linesColor = [UIColor blueColor];
//    [self.menuButton addTarget:self
//                        action:@selector(menuButtonPressed)
//              forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:self.menuButton];
//}
//
//-(void)setUpConstraints
//{
//    
//    
//    
//    self.menuButton.translatesAutoresizingMaskIntoConstraints = NO;
//    NSArray *upperConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_menuButton]"
//                                                                       options:0
//                                                                       metrics:nil
//                                                                         views:NSDictionaryOfVariableBindings(_menuButton)];
//    
//    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_menuButton]-20-|"
//                                                                   options:0
//                                                                   metrics:nil
//                                                                     views:NSDictionaryOfVariableBindings(_menuButton)];
//    
//    
//    [self.view addConstraints:constraints];
//    [self.view addConstraints:upperConstraint];
//    
//}
//
//
//-(void)menuButtonPressed
//{
//    if (self.menuButton.currentButtonType == buttonMenuType) {
//        self.menuButton.currentButtonType = buttonCloseType;
//        [self.menuButton animateToType:buttonCloseType];
//        [self dismissViewControllerAnimated:YES completion:^{
//            
//        }];
//    }
//    
//    else if (self.menuButton.currentButtonType == buttonCloseType)
//    {
//        self.menuButton.currentButtonType = buttonMenuType;
//        [self.menuButton animateToType:buttonMenuType];
//        [self dismissViewControllerAnimated:YES completion:^{
//            
//        }];
//    }
//}

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
