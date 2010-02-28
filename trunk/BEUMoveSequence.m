//
//  MoveSequence.m
//  BEUEngine
//
//  Created by Chris Mele on 2/27/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUMoveSequence.h"


@implementation BEUMoveSequence

@synthesize moves, currentMove, cooldownTimer;

-(id)init
{
	if( (self = [super init]) )
	{
		
	}
	
	return self;
}

-(id)initWithMoves:(NSMutableArray *)moves_
{
	[self init];
	
	self.moves = moves_;
	
	return self;
}

-(BOOL)tryInputQueue:(NSMutableArray *)inputQueue
{
	
	BEUMove *nextMove;
	
	if(!self.currentMove)
	{
		nextMove = [self.moves objectAtIndex:0];
	} else if(self.currentMove.inProgress || !cooldownTimer)
	{ 
		return NO;
	} else if(self.moves.count > ([self.moves indexOfObject:self.currentMove] + 1) )
	{
		[[CCScheduler sharedScheduler] unscheduleTimer:cooldownTimer];
		cooldownTimer = nil;
		nextMove = [self.moves objectAtIndex:[self.moves indexOfObject:self.currentMove] + 1];
	} else 
	{
		[self resetSequence];
		return NO;
	}
	
	for(int i=0; i<inputQueue.count; i++)
	{
		BEUMove *move;
		if(moves.count > i)
		{
			move = [moves objectAtIndex:i];
		} else {
			[self resetSequence];
			return NO;
		}
		if(move.input != [[inputQueue objectAtIndex:i] type])
		{
			[self resetSequence];
			return NO;
		}
		
	}
	
	self.currentMove = nextMove;
	nextMove.completeTarget = self;
	nextMove.completeSelector = @selector(moveComplete:);
	[nextMove startMove];
	return YES;
	
	
}

-(void)moveComplete:(BEUMove *)completedMove_
{
	if( ([self.moves indexOfObject:self.currentMove] + 1) < self.moves.count )
	{
		[self startCooldown:self.currentMove.cooldownTime];
	} else {
		[self resetSequence];
	}
		
}

-(void)startCooldown:(float)time_
{
	cooldownTimer = [CCTimer timerWithTarget: self 
									selector: @selector(endCooldown:) 
									interval: time_];
	
	[[CCScheduler sharedScheduler] scheduleTimer:cooldownTimer];
	
}

-(void)endCooldown:(ccTime)delta
{
	
	NSLog(@"SSS:%@",self.cooldownTimer);
	
	[[CCScheduler sharedScheduler] unscheduleTimer:self.cooldownTimer];
	//self.cooldownTimer = nil;
	
	[self resetSequence];
}

-(void)resetSequence
{
	self.currentMove = nil;
	/*if(self.cooldownTimer)
	{
		[[CCScheduler sharedScheduler] unscheduleTimer:self.cooldownTimer];
	}
	self.cooldownTimer = nil;*/
}

-(void)dealloc
{
	[self resetSequence];
	
	[self.moves release];
	
	[super dealloc];
}

@end
