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
    // Do any additional setup after loading the view, typically from a nib.
}




#pragma mark - iCarousel Methods

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    NSLog(@"%@",carousel.currentItemView);
    for (UIGestureRecognizer *g in carousel.currentItemView.gestureRecognizers) {
        NSLog(@"g %@", g);
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
        UIPanGestureRecognizer * recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(trackPan:)];
        recognizer.delegate = self;
        [view addGestureRecognizer:recognizer];
        
        
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

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}
-(void)trackPan:(UIPanGestureRecognizer *)recognizer
{
    
    NSLog(@"%@",recognizer);
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    
}



#pragma mark - lifecycle


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
