//
//  BEUProjectile.m
//  BEUEngine
//
//  Created by Chris on 3/16/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "BEUProjectile.h"


@implementation BEUProjectile

@synthesize power,fromCharacter;

-(id)init
{
	if( (self = [super init]) )
	{
		isWall = NO;
		affectedByGravity = NO;
		weight = 20;
		power = 20;
		startX = -99999999;
		maxXDistance = 500;
	}
	return self;
	
}

-(id)initWithPower:(float)power_ weight:(float)weight_ fromCharacter:(BEUCharacter *)character
{
	[self init];
	power = power_;
	weight = weight_;
	fromCharacter = character;
	
	
	hitAction = [[BEUHitAction alloc] initWithSender:fromCharacter
														  selector:@selector(receiveHit:)
														  duration:-1
														   hitArea:[self globalHitArea]
														  hitDepth:[self globalMoveArea]
															 power:power
															xForce:(moveX + weight)
															yForce:0 
															zForce:0];
	hitAction.completeTarget = self;
	hitAction.completeSelector = @selector(removeProjectile);
	hitAction.sendsLeft = 1;
	[[BEUActionsController sharedController] addAction:hitAction];
	
	
	
	return self;
}


-(void)removeProjectile
{
	[[BEUObjectController sharedController] removeObject: self];
}

-(void)moveWithAngle:(float)angle magnitude:(float)mag_
{
	[self applyForceX: cos(angle)*mag_];
	[self applyForceY: sin(angle)*mag_];	
}


-(void)step:(ccTime)delta
{	
	[super step:delta];
	
	if(startX == -99999999)
	{
		startX = x;
	}
	if(hitAction)
	{
		hitAction.hitArea = [self globalHitArea];
		hitAction.hitDepth = [self globalHitArea];
	}
	 
	 if(fabsf(startX - x) > maxXDistance)
	{
		[self removeProjectile];
		return;
	}
	
	if(moveX > 0)
	{
		[self setFacingRight:YES];
	} else if(moveX < 0) {
		[self setFacingRight:NO];
	}

}

-(void)dealloc
{
	
	
	[super dealloc];
}

@end
