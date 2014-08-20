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
    
    self.menuButton  = [[VBFPopFlatButton alloc]initWithFrame:CGRectMake(275, 20, 30, 30)
                                                   buttonType:buttonCloseType
                                                  buttonStyle:buttonRoundedStyle];
    self.menuButton.roundBackgroundColor = [UIColor whiteColor];
    self.menuButton.lineThickness = 2;
    self.menuButton.linesColor = [UIColor blueColor];
    [self.menuButton addTarget:self
                        action:@selector(menuButtonPressed)
              forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.menuButton];

}

-(void)menuButtonPressed
{
    if (self.menuButton.currentButtonType == buttonMenuType) {
        self.menuButton.currentButtonType = buttonCloseType;
        [self.menuButton animateToType:buttonCloseType];
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
    
    else if (self.menuButton.currentButtonType == buttonCloseType)
    {
        self.menuButton.currentButtonType = buttonMenuType;
        [self.menuButton animateToType:buttonMenuType];
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
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
