//
//  ViewController.m
//  CircularProgressBar
//
//  Created by Bandhavi on 11/20/13.
//  Copyright (c) 2013 Tavant. All rights reserved.
//

#import "ViewController.h"
#import "PathView.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController (){
    ProgressBarView * m_testView;
    NSTimer* m_timer;
    PathView *pathView;
}

-(IBAction)moveObject:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //add path bezier path...
    
//    pathView = [[PathView alloc] initWithFrame:CGRectMake(0, 0, 260+10, 260+10)];
    pathView = [[PathView alloc] initWithFrame:CGRectMake(0, 50, 320, 480)];
//    pathView.center = CGPointMake(160, 240);
    [self.view addSubview:pathView];
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
//    m_testView = [[ProgressBarView alloc] initWithFrame:self.view.bounds];
    
    
    

    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    UITouch *touch = [touches anyObject];
//    CGPoint startPoint = [touch locationInView:self.view];
//    if(m_testView.isAnimationDone){
//        [self shiftTheObjectTo:startPoint];
//    }
 
}

-(IBAction)moveObject:(id)sender{
    [pathView xyz];
}

-(IBAction)eraseLastObject:(id)sender{
    [pathView eraseLastView];
}

-(void)didChangePositionAt:(CGPoint)moveToPoint{
    [self shiftTheObjectTo:moveToPoint];
}

-(void)shiftTheObjectTo:(CGPoint)point{
    CGPoint moveToPoint = CGPointMake(point.x, point.y);
    m_testView.center = moveToPoint;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    // Kick off a timer to count it down
    m_timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(incrementSpin) userInfo:nil repeats:YES];
}

- (void)decrementSpin
{
    // If we can decrement our percentage, do so, and redraw the view
    if (m_testView.percent > 0) {
        m_testView.percent = m_testView.percent - 1;
        [m_testView setNeedsDisplay];
    }
    else {
        [m_timer invalidate];
        m_timer = nil;
    }
}

- (void)incrementSpin
{
    // If we can decrement our percentage, do so, and redraw the view
//    if (m_testView.percent < 100) {
//        m_testView.percent = m_testView.percent + 1;
//        [m_testView setNeedsDisplay];
//    }
//    else {
//        [m_timer invalidate];
//        m_timer = nil;
//    }
    
    [m_testView changePositionOfObject];
    
    
}


@end
