//
//  MenuViewController.h
//  iOSTest
//
//  Created by Brandon on 8/20/14.
//  Copyright (c) 2014 Digital Rogues. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FRDLivelyButton.h>
#import <FXBlurView.h>
#import "iOSTest-Swift.h"
@interface MenuViewController : UIViewController <UIDynamicAnimatorDelegate, UICollisionBehaviorDelegate>


@property (nonatomic,strong) IBOutlet FRDLivelyButton *menuButton;
@property (nonatomic) UIDynamicAnimator* animator;
@property (strong) UICollisionBehavior *collision;
@property (strong) UIGravityBehavior *gravity;
@property (strong, nonatomic) IBOutlet LTMorphingLabel *textLabel;
@property (strong) UIDynamicItemBehavior *itemBehavior;
@property BOOL labelBool;
@property (strong, nonatomic) IBOutlet FXBlurView *blurView;

@end
