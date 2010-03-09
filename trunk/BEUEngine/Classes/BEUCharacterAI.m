//
//  BEUCharacterAI.m
//  BEUEngine
//
//  Created by Chris on 3/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BEUCharacterAI.h"


@implementation BEUCharacterAI

@synthesize parent,targetCharacter,rootBehavior,currentBehavior,updateEvery;


int tick = 0;


-(id)init
{
	if( (self = [super init]) )
	{
		updateEvery = 6;
		rootBehavior = [[BEUCharacterAIBehavior alloc] initWithName:@"root"];
		rootBehavior.ai = self;
	}
	
	return self;
}

-(id)initWithParent:(BEUCharacter *)parent_
{
	[self init];
	
	parent = parent_;
	
	return self;
}

-(void)update:(ccTime)delta
{
	//return if the tick is not == updateEvery
	if(tick == updateEvery)
	{
		tick = 0;
	} else {
		tick++;
		return;
	}
	
	
	if(parent)
	{
		if(!targetCharacter)
		{
			targetCharacter = [self findClosestEnemy];
		}
		
		if(!currentBehavior)
		{
			currentBehavior = [self getHighestValueBehavior];
			if(currentBehavior){
				[currentBehavior run];
			}
		} else {
			BEUCharacterAIBehavior *nextBehavior = [self getHighestValueBehavior];
			if(nextBehavior){
				if(currentBehavior.running)
				{
					if(nextBehavior.canInteruptOthers && (nextBehavior.value > currentBehavior.value))
					{
						[currentBehavior cancel];
						currentBehavior = nextBehavior;
						[currentBehavior run];
					}
				} else {
					currentBehavior = nextBehavior;
					[currentBehavior run];
				}
			}
		}
		
		
	}
}

-(BEUCharacterAIBehavior *)getHighestValueBehavior
{
	
	if(!rootBehavior) return nil;
	
	return [self getHighestValueBehaviorFromBehavior:rootBehavior];
}

-(BEUCharacterAIBehavior *)getHighestValueBehaviorFromBehavior:(BEUCharacterAIBehavior *)behavior_
{
	if([behavior_ isLeaf]) return behavior_;
	
	//temp variable for highest value behavior so far
	BEUCharacterAIBehavior *highest = nil;
	
	//temp variable for actual highest value number so far, this is necessary because sometimes the value of
	//behavior.value is random and we dont want it to change mid loop
	float highestValue = 0;
	
	for ( BEUCharacterAIBehavior *behavior in behavior_.behaviors )
	{
		float val = behavior.value;
		
		if(val > highestValue)
		{	
			highest = behavior;
			highestValue = val;
		}
	}
	return [self getHighestValueBehaviorFromBehavior:highest];
	
}

-(BEUCharacter *)findClosestEnemy
{
	BEUCharacter *closest = nil;
	float closestDist = 999999.0; //absurdly high number, dont know how to use NAN in obj-c to test against
	for ( BEUCharacter *character in [[BEUObjectController sharedController] characters] )
	{
		if(character.enemy != parent.enemy)
		{
			float dist = ccpDistance(character.position, parent.position);
			if(closestDist > dist)
			{
				closestDist = dist;
				closest = character;
			}
		}
	}
	
	return closest;
}

-(void)addBehavior:(BEUCharacterAIBehavior *)behavior
{
	[rootBehavior addBehavior:behavior];
}

-(void)removeBehavior:(BEUCharacterAIBehavior *)behavior
{
	[rootBehavior removeBehavior:behavior];
}


-(void)dealloc
{
	parent = nil;
	currentBehavior = nil;
	[rootBehavior release];
	[super dealloc];
}

@end
