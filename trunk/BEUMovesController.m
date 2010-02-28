//
//  BEUMovesController.m
//  BEUEngine
//
//  Created by Chris Mele on 2/27/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUMovesController.h"


@implementation BEUMovesController

@synthesize moveSequences, currentSequence, inputQueue;

-(id)init
{
	if( (self = [super init]) )
	{
		moveSequences = [[NSMutableArray alloc] init];
	}
	
	return self;
}

-(id)initWithSequences:(NSMutableArray *)sequences
{
	[self init];
	[moveSequences release];
	moveSequences = sequences;
	
	return self;
}

-(void)addSequence:(BEUMoveSequence *)sequence
{
	[moveSequences addObject:sequence];
}

-(void)sendInput:(BEUInputEvent *)inputEvent
{
	if(!inputQueue)
	{
		inputQueue = [[NSMutableArray alloc] initWithObjects: [inputEvent clone], nil];
	} else
	{
		[inputQueue addObject:[inputEvent clone]];
	}
	
	if(currentSequence)
	{
		if([currentSequence tryInputQueue:inputQueue])
		{
			return;
		} else 
		{
			currentSequence = nil;
			return;
		}
	} else {
		for(BEUMoveSequence *sequence in moveSequences)
		{
			if([sequence tryInputQueue:inputQueue])
			{
				currentSequence = sequence;
				return;
			}
		}
		
		inputQueue = nil;
	}
}

@end
