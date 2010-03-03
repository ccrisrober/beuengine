//
//  BEUInputMovementEvent.h
//  BEUEngine
//
//  Created by Chris Mele on 2/24/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUInputEvent.h"
#import "BEUMath.h"

@class BEUMath;
@class BEUInputEvent;

@interface BEUInputMovementEvent : BEUInputEvent {
	CGPoint movementDelta;
	float movementPercent;
	float movementTheta;
	float maximumMovementDist;
	
	//Array of positions during the movement event
	NSMutableArray *positions;
}

extern NSString *const BEUInputMovement;

@property(nonatomic) float movementPercent;
@property(nonatomic) float movementTheta;
@property(nonatomic) float maximumMovementDist;

-(id)initWithStartPosition:(CGPoint)position maximumMovementDist:(float)dist;

-(void)addPosition:(CGPoint)position;

@end
