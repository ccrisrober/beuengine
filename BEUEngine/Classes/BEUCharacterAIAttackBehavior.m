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
	return lastValue = (1 - ai.difficultyMultiplier)*[BEUMath random];
	
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
	return [[[self alloc] initWithMoves:moves_] autorelease];
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

-(BEUMove *)getRandomMove
{
	return [moves objectAtIndex:arc4random()%moves.count];
}

-(BEUMove *)getRandomMoveInRange
{
	NSMutableSet *inRangeMoves = [[[NSMutableSet alloc] init] autorelease];
	float dist = ccpDistance(ccp(ai.parent.x,ai.parent.z), 
							 ccp(ai.targetCharacter.x,ai.targetCharacter.z));
	for ( BEUMove *move in moves )
	{
		if(move.range >= dist) [inRangeMoves addObject:move];
	}
	
	return [inRangeMoves anyObject];	
}

-(float)value
{
	if([self hasMoveInRange])
	{
		return lastValue = (1 - ai.difficultyMultiplier)*[BEUMath random];
	} else {
		return lastValue = 0;
	}
}

-(void)run
{
	BEUMove *moveToRun = [self getRandomMoveInRange];
	[moveToRun startMove];
	moveToRun.completeTarget = self;
	moveToRun.completeSelector = @selector(complete);
}

@end


@implementation BEUCharacterAIMoveToAndAttack

@synthesize attackMove;

-(float)value
{
	return lastValue = (1 - ai.difficultyMultiplier)*[BEUMath random];
}

-(void)run
{
	attackMove = [self getRandomMove];
	BEUCharacterMoveToObject *moveToAction = [BEUCharacterMoveToObject actionWithObject:ai.targetCharacter distance:attackMove.range*.75];
	moveToAction.onCompleteTarget = self;
	moveToAction.onCompleteSelector = @selector(moveToComplete);
	
	[ai.parent runAction: moveToAction];
}

-(void)moveToComplete
{
	[attackMove startMove];
	attackMove.completeTarget = self;
	attackMove.completeSelector = @selector(complete);
}

@end