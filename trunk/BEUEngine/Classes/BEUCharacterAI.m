//
//  BEUCharacterAI.m
//  BEUEngine
//
//  Created by Chris on 3/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BEUCharacterAI.h"


@implementation BEUCharacterAI

@synthesize parent,targetCharacter,behaviors,currentBehavior,updateEvery;


int tick = 0;


-(id)init
{
	if( (self = [super init]) )
	{
		updateEvery = 6;
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
			[currentBehavior run];
		} else {
			BEUCharacterAIBehavior *nextBehavior = [self getHighestValueBehavior];
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

-(BEUCharacterAIBehavior *)getHighestValueBehavior
{
	BEUCharacterAIBehavior *highest = nil;
	
	for ( BEUCharacterAIBehavior *behavior in behaviors )
	{
		if(!highest) highest = behavior;
		if(highest.value < behavior.value)
			highest = behavior;
	}
	
	return highest;
}

-(BEUCharacter *)findClosestEnemy
{
	BEUCharacter *closest = nil;
	float closestDist = 999999.0;//absurdly high number, dont know how to use NAN in obj-c to test against
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
	if(!behaviors) 
		behaviors = [[NSMutableArray alloc] init];
	[behaviors addObject:behavior];
	behavior.ai = self;
}

-(void)removeBehavior:(BEUCharacterAIBehavior *)behavior
{
	if([behaviors containsObject:behavior]) 
		[behaviors removeObject:behavior];
}


-(void)dealloc
{
	parent = nil;
	currentBehavior = nil;
	[behaviors release];
	[super dealloc];
}

@end
