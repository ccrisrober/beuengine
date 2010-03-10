//
//  BEUCharacterAI.m
//  BEUEngine
//
//  Created by Chris on 3/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BEUCharacterAI.h"


@implementation BEUCharacterAI

@synthesize parent,targetCharacter,rootBehavior,currentBehavior,updateEvery,difficultyMultiplier;


int tick = 0;


-(id)init
{
	if( (self = [super init]) )
	{
		updateEvery = 8;
		rootBehavior = [[BEUCharacterAIBehavior alloc] initWithName:@"root"];
		rootBehavior.ai = self;
		difficultyMultiplier = .7;
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
			parent.orientToObject = targetCharacter;
		}
		
		if(!currentBehavior)
		{
			currentBehavior = [self getHighestValueBehavior];
			if(currentBehavior){
				[currentBehavior run];
			}
		} else {
			BEUCharacterAIBehavior *nextBehavior = [self getHighestValueBehavior];
			NSLog(@"HIGHEST VALUE BEHAVIOR: %@",nextBehavior.name);
			if(nextBehavior){
				if(currentBehavior.running)
				{
					if(nextBehavior.canInteruptOthers && (nextBehavior.value > currentBehavior.value))
					{
						NSLog(@"INTERRUPTING CURRENT BEHAVIOR WITH BLOCK");
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
	//temp variable for highest value behavior so far
	if([behavior_ isLeaf]) return behavior_;
	
	BEUCharacterAIBehavior *highest = nil;
	
	for ( BEUCharacterAIBehavior *behavior in behavior_.behaviors )
	{
		//if(![behavior isLeaf]) behavior = [self getHighestValueBehaviorFromBehavior:behavior];
		
		if(!highest)
		{
			[behavior value];
			highest = behavior;
		} else if(highest.lastValue < behavior.value){
			highest = behavior;
		}
	}
	return [self getHighestValueBehaviorFromBehavior:highest];//highest;
	
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
