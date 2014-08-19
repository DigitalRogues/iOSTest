//
//  ViewController.h
//  iOSTest
//
//  Created by punk on 8/18/14.
//  Copyright (c) 2014 Digital Rogues. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iCarousel.h>

@interface ViewController : UIViewController<iCarouselDelegate, iCarouselDataSource, UIGestureRecognizerDelegate>

@property (nonatomic, strong) IBOutlet iCarousel *carousel;
@property (nonatomic,strong) NSMutableArray *itemsArray;

@end

