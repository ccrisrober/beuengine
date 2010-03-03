//
//  BEUInputMovementEvent.m
//  BEUEngine
//
//  Created by Chris Mele on 2/24/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUInputMovementEvent.h"


@implementation BEUInputMovementEvent

@synthesize maximumMovementDist, movementPercent, movementTheta;

NSString *const BEUInputMovement = @"BEUInputMovement";

-(id)initWithStartPosition:(CGPoint)position maximumMovementDist:(float)dist
{
	if( (self = [super initWithType:BEUInputMovement]) )
	{
		positions = [[NSMutableArray alloc] init];
		
		NSValue *pos = [NSValue valueWithCGPoint:position];
		[positions addObject:pos];
		
		movementDelta = CGPointZero;
		movementPercent = 0.0f;
		movementTheta = 0.0f;
		maximumMovementDist = dist;
		
	}
	
	return self;
}

-(void)addPosition:(CGPoint)position
{
	CGPoint start = [[positions objectAtIndex:0] CGPointValue];
	movementPercent = hypot(position.x-start.x, position.y-start.y)/maximumMovementDist;
	if(movementPercent > 1) movementPercent = 1;			
	movementTheta = [BEUMath angleFromPoint:start toPoint:position];
	
	
}

-(void)complete
{
	movementPercent = 0;
	movementTheta = 0;
	movementDelta = CGPointZero;
	
	[super complete];
}

-(void)dealloc
{
	[positions release];
	[super dealloc];
}

@end
