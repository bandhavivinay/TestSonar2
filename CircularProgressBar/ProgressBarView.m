//
//  ProgressBarView.m
//  CircularProgressBar
//
//  Created by Bandhavi on 11/20/13.
//  Copyright (c) 2013 Tavant. All rights reserved.
//

#import "ProgressBarView.h"

@interface ProgressBarView () {
    CGFloat startAngle;
    CGFloat endAngle;
    UIBezierPath* bezierPath;
    CGPoint startPoint;
    CGRect rectangle;
    CGFloat radians;
}
@end


#define   DEGREES_TO_RADIANS(degrees)  ((M_PI * degrees)/ 180)

@implementation ProgressBarView

@synthesize percent;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        bezierPath = [UIBezierPath bezierPath];
        // Determine our start and stop angles for the arc (in radians)
        startAngle = DEGREES_TO_RADIANS(270);
        
        radians = DEGREES_TO_RADIANS(0);
        
        NSLog(@"radians is %f",DEGREES_TO_RADIANS(radians));
        
        
//        endAngle = startAngle + DEGREES_TO_RADIANS(360);
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    CGContextSetLineWidth(context, 20.0);
//    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
//    CGContextMoveToPoint(context, 0, 0);
//    CGContextAddLineToPoint(context, 300, 400);
    
    
    // Create our arc, with the correct angles
//    [bezierPath addArcWithCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2)
//                          radius:20
//                      startAngle: DEGREES_TO_RADIANS(270)
//                        endAngle:startAngle+DEGREES_TO_RADIANS(360)
//                       clockwise:YES];
//
//    
//    [[UIColor blackColor] setFill];
//    
////    CGContextRef aRef = UIGraphicsGetCurrentContext();
////    CGContextTranslateCTM(aRef, 0, 0);
//    bezierPath.lineWidth = 1;
//    [bezierPath fill];
    
    //using Quartz 2D

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 4.0);
    CGContextSetFillColorWithColor(context,
                                     [UIColor blueColor].CGColor);
//    rectangle = CGRectMake(rect.size.width / 2, rect.size.height / 2,50,80);
    
    CGContextAddArc(context, rect.size.width/2,rect.size.height/2, 15, DEGREES_TO_RADIANS(0), radians+DEGREES_TO_RADIANS(360), YES);
    
   // CGContextAddEllipseInRect(context, rectangle);
    CGContextFillPath(context);
    
    
}

-(void)changePositionOfObject{
    
}

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    self.isAnimationDone = NO;
//    UITouch *touch = [touches anyObject];
//    startPoint = [touch locationInView:self];
//    CGFloat radiansToAdd = DEGREES_TO_RADIANS(90);
//
//    [UIView animateWithDuration:1.0 animations:^{
//        self.transform  = CGAffineTransformMakeRotation( radians + radiansToAdd);
//        
//    }completion:^(BOOL finished) {
//        if (finished) {NSLog(@"Finished !!!!");
//            self.isAnimationDone = YES;
//            radians = atan2f(self.transform.b, self.transform.a);
//        }
//        else NSLog(@"Interrupted !!!");
//    }];
//    
//}
//
//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//    
//    UITouch *touch = [touches anyObject];
//    startPoint = [touch locationInView:self.superview];
//    NSLog(@"%@",NSStringFromCGPoint(startPoint));
//    
//    [self.positionChangeDelegate didChangePositionAt:startPoint];
//    
//}
//
//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
