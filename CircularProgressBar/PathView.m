//
//  PathView.m
//  CircularProgressBar
//
//  Created by Bandhavi on 11/22/13.
//  Copyright (c) 2013 Tavant. All rights reserved.
//

#import "PathView.h"
#import "ProgressBarView.h"

#define   DEGREES_TO_RADIANS(degrees)  ((M_PI * degrees)/ 180)

@interface PathView(){
    ProgressBarView *m_testView;
    CAKeyframeAnimation *leafAnimation;
    NSMutableArray *pathArray;
}

@end

@implementation PathView

//@synthesize bezierPath1;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        pathArray = [[NSMutableArray alloc] init];
        m_testView = [[ProgressBarView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//         m_testView = [[ProgressBarView alloc] initWithFrame:CGRectMake(50, 50, 30, 30)];
        m_testView.center = CGPointMake(130, 0);
        NSLog(@"%f %f",m_testView.frame.origin.x,m_testView.frame.origin.y);
//      m_testView.positionChangeDelegate = self;
        m_testView.percent = 0;
        [self addSubview:m_testView];
//        bezierPath1=[[UIBezierPath alloc]init];
        
    }
    return self;
}

-(void)xyz{
    leafAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    leafAnimation.duration = 10.0;
//    NSLog(@"Current point of bezier path is %@",NSStringFromCGPoint(bezierPath1.currentPoint));
    UIBezierPath *finalPath = [[UIBezierPath alloc] init];
    for(UIBezierPath *path in pathArray){
        [finalPath appendPath:path];
    }
    leafAnimation.path = finalPath.CGPath;
//    leafAnimation.path = bezierPath1.CGPath;
    [m_testView.layer addAnimation:leafAnimation forKey:@"leafAnimation"];
    
//    [bezierPath1];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code

    for(UIBezierPath *paths in pathArray){
        paths.lineWidth = 2.0;
        [[UIColor redColor] setStroke];
        [paths stroke];
    }
    

    
//    bezierPath1 = [UIBezierPath bezierPath];
    
//	[bezierPath1 moveToPoint:CGPointMake(160, 133)];

//	[bezierPath1 addCurveToPoint:CGPointMake(10, 40 ) controlPoint1:CGPointMake( 160,100) controlPoint2:CGPointMake(160 ,40)];
    
//    bezierPath1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(40, 0, 230, 120) cornerRadius:4.0];
    
    // Create our arc, with the correct angles
//    [bezierPath1 addArcWithCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2)
//                           radius:130
//                       startAngle: DEGREES_TO_RADIANS(270)
//                         endAngle:DEGREES_TO_RADIANS(270) + DEGREES_TO_RADIANS(360)
//                        clockwise:YES];
    
    
    
    
//    [bezierPath1 addClip];
//    bezierPath1.lineWidth = 10;
//    [[UIColor redColor] setStroke];
//    [bezierPath1 stroke];

    
}

-(void)eraseLastView{
    [pathArray removeLastObject];
    [self setNeedsDisplay];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    [m_testView.layer removeAllAnimations];
    UIBezierPath *bezierPath1=[[UIBezierPath alloc]init];

    [pathArray addObject:bezierPath1];
    
    NSLog(@"Paths array is %d",[pathArray count]);
    
//    [bezierPath1 removeAllPoints];
    UITouch *mytouch=[[touches allObjects] objectAtIndex:0];
    [bezierPath1 moveToPoint:[mytouch locationInView:self]];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *mytouch=[[touches allObjects] objectAtIndex:0];
    [[pathArray lastObject] addLineToPoint:[mytouch locationInView:self]];
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self touchesMoved:touches withEvent:event];
}


@end
