//
//  ViewController.m
//  iOSTest
//
//  Created by punk on 8/18/14.
//  Copyright (c) 2014 Digital Rogues. All rights reserved.
//

#import "ViewController.h"




@interface ViewController ()

@end

@implementation ViewController
            

-(void)awakeFromNib
{
    self.itemsArray = [NSMutableArray array];
    for (int i = 0; i < 200; i++) {
        [self.itemsArray addObject:@(i)];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.carousel.type = iCarouselTypeLinear;
    self.carousel.ignorePerpendicularSwipes = NO;
    self.carousel.pagingEnabled = YES;
    self.recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(trackPan:)];
    self.recognizer.delegate = self;
    
    for (UIGestureRecognizer *gesture in self.carousel.currentItemView.gestureRecognizers) {
        [self.recognizer requireGestureRecognizerToFail:gesture];
    }
    [self.carousel addGestureRecognizer:self.recognizer];
    
    

    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Ocean_park_wiki-2.jpg"]];
    
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
    

    
    
    [self buildHamburger];
    //[self setUpConstraints];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
    [self.menuButton setStyle:kFRDLivelyButtonStyleHamburger animated:YES];
}


-(void)buildHamburger
{
    self.menuButton = [[FRDLivelyButton alloc] initWithFrame:CGRectMake(0,0,36,28)];
    [self.menuButton setStyle:kFRDLivelyButtonStyleHamburger animated:NO];
    [self.menuButton addTarget:self action:@selector(hamburgerAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:self.menuButton];
    self.navigationItem.rightBarButtonItem = buttonItem;
    
}

-(void)hamburgerAction
{
    
    if (self.menuButton.buttonStyle == kFRDLivelyButtonStyleHamburger) {
        [self.menuButton setStyle:kFRDLivelyButtonStyleClose animated:YES];
        [self performSegueWithIdentifier:@"menuSegue" sender:nil];
    }

}



#pragma mark - iCarousel Methods


- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    NSLog(@"%@",carousel.currentItemView);
    for (UIGestureRecognizer *gesture in carousel.currentItemView.gestureRecognizers) {
        NSLog(@"gesture %@", gesture);
    }
}

-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    
    switch (option) {
        case iCarouselOptionSpacing:
        {
            return value * 1.1;
        }
            
        case iCarouselOptionWrap:
        {
            return YES;
        }
            
        case iCarouselOptionOffsetMultiplier:
        {
            return 0.15;
        }
        
        case iCarouselOptionFadeMin:
        {
            return 0;
        }
            
        case iCarouselOptionFadeMax:
        {
            return 0;
        }
            
        case iCarouselOptionFadeMinAlpha:
        {
            return 0.5;
        }
            
            default:
            return value;
    }
    
    
    
}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //return the total number of items in the carousel
    return [self.itemsArray count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        //create the bounds view
        
        
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)];
        ((UIImageView *)view).image = [UIImage imageNamed:@"smallCardBG"];
        view.contentMode = UIViewContentModeScaleToFill;
        view.userInteractionEnabled = YES;
        label = [[UILabel alloc] initWithFrame:view.bounds];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [label.font fontWithSize:50];
        label.tag = 1;
        [view addSubview:label];
        
    }
    else
    {
        //get a reference to the label in the recycled view
        label = (UILabel *)[view viewWithTag:1];
    }
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
    label.text = [self.itemsArray[index] stringValue];
    
    return view;
}

#pragma mark - gesture methods

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)panGestureRecognizer {
    CGPoint velocity = [panGestureRecognizer velocityInView:self.carousel];
    return fabs(velocity.y) > fabs(velocity.x);
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {

    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@",touches);
    
}


-(void)trackPan:(UIPanGestureRecognizer *)recognizer
{

    
    CGPoint translation = [recognizer translationInView:self.view];
    CGPoint newCenter = CGPointMake(recognizer.view.center.x, recognizer.view.center.y + translation.y);


    
    //hardcode ipad mini landscape and iphone 5 portrait variables
    NSString *deviceType = [UIDevice currentDevice].model;
    if([deviceType isEqualToString:@"iPhone"])
        {   // it's an iPhone
            if (newCenter.y >= 398 && newCenter.y <= 480) {
                recognizer.view.center = CGPointMake(recognizer.view.center.x, recognizer.view.center.y + translation.y);
                [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
            }
        }
    else
    
        if (newCenter.y >= 503 && newCenter.y <= 651) {
            recognizer.view.center = CGPointMake(recognizer.view.center.x, recognizer.view.center.y + translation.y);
            [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];

    }
    

    double newAlpha = self.envoyLabel.alpha;
    if (translation.y <0)
    {   //NSLog(@"Down");
        newAlpha = MIN(newAlpha + 0.04,1.0);
        self.envoyLabel.alpha = newAlpha;
    }
    else if (translation.y > 0)
    {
        //NSLog(@"Up");
        newAlpha = MAX(newAlpha - 0.04,0);
        self.envoyLabel.alpha = newAlpha;
    }
   


    }



#pragma mark - lifecycle


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
