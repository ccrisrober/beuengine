//
//  BEUCharacterAI.m
//  BEUEngine
//
//  Created by Chris on 3/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BEUCharacterAI.h"


@implementation BEUCharacterAI

@synthesize parent,targetCharacter;

-(id)init
{
	if( (self = [super init]) )
	{
		
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
	if(parent)
	{
		if(!targetCharacter)
		{
			//NSLog(@"NEED TO FIND CLOSEST ENEMY: %@",targetCharacter);
			targetCharacter = [self findClosestEnemy];
		}
		
		float targetDirection = [BEUMath angleFromPoint:parent.position toPoint:targetCharacter.position];
		[parent moveCharacterWithAngle:targetDirection percent:1.0f];
	}
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

-(void)dealloc
{
	parent = nil;
	
	[super dealloc];
}

@end
