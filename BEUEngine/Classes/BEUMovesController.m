//
//  BEUMovesController.m
//  BEUEngine
//
//  Created by Chris Mele on 2/27/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUMovesController.h"


@implementation BEUMovesController

@synthesize moves, currentMove, inputSequence, 
cooldownTimer, coolingDown, cooldownTime, waitTimer,
waitTime, waiting, canReceiveInput;

-(id)init
{
	if( (self = [super init]) )
	{
		moves = [[NSMutableArray alloc] init];
		canReceiveInput = YES;
		waitTime = 0.5f;
		cooldownTime = 0.2f;
	}
	
	return self;
}

-(id)initWithMoves:(NSMutableArray *)moves_
{
	[self init];
	[moves release];
	moves = moves_;
	
	return self;
}

-(void)addMove:(BEUMove *)move
{
	[moves addObject:move];
}

-(void)sendInput:(BEUInputEvent *)inputEvent
{
	if(!canReceiveInput) return;
	
	if(waiting)
	{
		[[CCScheduler sharedScheduler] unscheduleTimer:waitTimer];
		waiting = NO;
	}
	
	//Try current input sequence against all moves
	if(inputSequence)
	{
		[inputSequence addObject:[inputEvent clone]];
		
		for(BEUMove *move in moves)
		{
			if([move trySequence:inputSequence])
			{
				canReceiveInput = NO;
				currentMove = move;
				currentMove.completeTarget = self;
				currentMove.completeSelector = @selector(moveComplete:);
				
				return;
			}
		}
		//No input sequence has been found, nullify it
		inputSequence = nil;
		
	}
	
	
	//If there is no current inputSequence create a new one with the current event as its first input
	inputSequence = [[NSMutableArray alloc] initWithObjects: [inputEvent clone], nil];
	
	//Now test the new input sequence against all the moves
	for(BEUMove *move in moves)
	{
		
		if([move trySequence:inputSequence])
		{
			canReceiveInput = NO;
			currentMove = move;
			currentMove.completeTarget = self;
			currentMove.completeSelector = @selector(moveComplete:);
			
			return;
		}
	}
	
	//No moves were matched	
	canReceiveInput = YES;
	inputSequence = nil;
	currentMove = nil;
	//[self startCooldown];
	
}

-(void)moveComplete:(BEUMove *)move
{
	[self waitForNextInput];
}

-(void)waitForNextInput
{
	
	canReceiveInput = YES;
	waitTimer = [CCTimer timerWithTarget:self 
								selector:@selector(noInputReceived:) 
								interval: waitTime];
	waiting = YES;
	[[CCScheduler sharedScheduler] scheduleTimer:waitTimer];
}

-(void)noInputReceived:(ccTime)delta
{
	waiting = NO;
	canReceiveInput = YES;
	[[CCScheduler sharedScheduler] unscheduleTimer:waitTimer];
	
	inputSequence = nil;
	currentMove = nil;
}

-(void)startCooldown
{
	cooldownTimer = [CCTimer timerWithTarget:self selector:@selector(endCooldown:) interval:cooldownTime];
	[[CCScheduler sharedScheduler] scheduleTimer:cooldownTimer];
	
	coolingDown = YES;
	canReceiveInput = NO;
}

-(void)endCooldown:(ccTime)delta
{
	[[CCScheduler sharedScheduler] unscheduleTimer:cooldownTimer];
	
	coolingDown = NO;
	canReceiveInput = YES;
}

-(BEUMove *)getMoveWithName:(NSString *)name
{
	for ( BEUMove *move in moves )
	{
		if(move.name == name) return move;
	}
	
	NSLog(@"No Move with name: %@ found!",name);
	return nil;
}

-(void)dealloc
{
	[inputSequence release];
	[moves release];
	currentMove = nil;
	
	[super dealloc];
}

@end
