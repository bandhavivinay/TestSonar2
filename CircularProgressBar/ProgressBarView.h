//
//  ProgressBarView.h
//  CircularProgressBar
//
//  Created by Bandhavi on 11/20/13.
//  Copyright (c) 2013 Tavant. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PositionChange

-(void)didChangePositionAt:(CGPoint)moveToPoint;

@end

@interface ProgressBarView : UIView
@property(nonatomic,assign)int percent;
@property(nonatomic,assign)BOOL isAnimationDone;
@property(nonatomic,assign)id<PositionChange> positionChangeDelegate;

-(void)changePositionOfObject;

@end
