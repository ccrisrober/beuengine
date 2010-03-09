//
//  BEUCharacterAIAttackBehavior.m
//  BEUEngine
//
//  Created by Chris Mele on 3/8/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUCharacterAIAttackBehavior.h"


@implementation BEUCharacterAIAttackBehavior

-(id)init
{
	if( (self = [super initWithName:@"attack"]) )
	{
		
	}
	
	return self;
}

+(id)behavior
{
	return [[[BEUCharacterAIAttackBehavior alloc] init] autorelease];
}

-(BOOL)hasMoveInRange
{
	return NO;
}

-(float)value
{
	BOOL foundMoveInRange = NO;
	for ( BEUCharacterAIAttackBehavior *behavior in behaviors )
	{
		if([behavior hasMoveInRange]) foundMoveInRange = YES;
	}
	
	if(foundMoveInRange)
	{
		return 100 - (arc4random() % 20);
	} else {	
		return 0;
	}
	
}

@end


@implementation BEUCharacterAIAttackWithRandomMove

@synthesize moves;

-(id)initWithMoves:(NSMutableArray *)moves_
{
	if( (self = [super initWithName:@"attackWithRandomMove"]) )
	{
		moves = moves_;
	}
	
	return self;
}

+(id)behaviorWithMoves:(NSMutableArray *)moves_
{
	return [[[BEUCharacterAIAttackWithRandomMove alloc] initWithMoves:moves_] autorelease];
}

-(BOOL)hasMoveInRange
{
	float dist = ccpDistance(ccp(ai.parent.x,ai.parent.z), 
							 ccp(ai.targetCharacter.x,ai.targetCharacter.z));
	for ( BEUMove *move in moves )
	{
		if(move.range >= dist) return YES;
	}
	
	return NO;
}

-(float)value
{
	return arc4random() % 100;
}

@end