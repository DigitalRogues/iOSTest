//
//  MenuViewController.h
//  iOSTest
//
//  Created by Brandon on 8/20/14.
//  Copyright (c) 2014 Digital Rogues. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <VBFPopFlatButton.h>
#import <FRDLivelyButton.h>
@interface MenuViewController : UIViewController <UIDynamicAnimatorDelegate, UICollisionBehaviorDelegate>

//@property (strong, nonatomic) IBOutlet VBFPopFlatButton *menuButton;
@property (nonatomic,strong) FRDLivelyButton *menuButton;
@property (nonatomic) UIDynamicAnimator* animator;
@property (strong) UICollisionBehavior *collision;
@property (strong) UIGravityBehavior *gravity;
@property (strong, nonatomic) IBOutlet UILabel *textLabel;
@property (strong) UIDynamicItemBehavior *itemBehavior;
@property BOOL labelBool;

@end
