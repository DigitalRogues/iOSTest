//
//  ViewController.h
//  iOSTest
//
//  Created by punk on 8/18/14.
//  Copyright (c) 2014 Digital Rogues. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iCarousel.h>
//#import <VBFPopFlatButton.h>
#import <FRDLivelyButton.h>
#import <FXBlurView.h>

@interface ViewController : UIViewController<iCarouselDelegate, iCarouselDataSource, UIGestureRecognizerDelegate>

@property (nonatomic, strong) IBOutlet iCarousel *carousel;
@property (nonatomic,strong) NSMutableArray *itemsArray;
@property (nonatomic,strong) UIPanGestureRecognizer *recognizer;
@property (weak, nonatomic) IBOutlet UILabel *envoyLabel;
//@property (strong, nonatomic) IBOutlet VBFPopFlatButton *menuButton;
@property (nonatomic,strong) FRDLivelyButton *menuButton;
@property (strong, nonatomic) IBOutlet FXBlurView *blurView;


@end

