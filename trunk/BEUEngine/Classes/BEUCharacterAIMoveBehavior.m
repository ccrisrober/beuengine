//
//  BEUCharacterAIMoveBehavior.m
//  BEUEngine
//
//  Created by Chris Mele on 3/6/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUCharacterAIMoveBehavior.h"

@implementation BEUCharacterAIMove

@synthesize nearTargetDistance,currentAction;

-(id)init
{
	if( (self = [super init]) )
	{
		name = @"move";
		nearTargetDistance = 50;
	}
	
	return self;
}


+(id)behavior
{
	return [[[BEUCharacterAIMove alloc] init] autorelease];
}

-(void)cancel
{
	[super cancel];
	
	[ai.parent stopAction:currentAction];
	currentAction = nil;
}

-(void)complete
{
	[super complete];
	
	[ai.parent stopAction:currentAction];
	currentAction = nil;
}

@end


@implementation BEUCharacterAIMoveToTarget

-(id)init
{
	
	if( (self = [super init]) )
	{
		name = @"moveToTarget";
	}
	
	return self;
}

+(id)behavior
{
	return [[[BEUCharacterAIMoveToTarget alloc] init] autorelease];
}
			  
-(void)run
{
	[super run];
	NSLog(@"MOVING TO TARGET");
	currentAction = [BEUCharacterMoveToObject actionWithObject:[ai targetCharacter] 
													  distance: (30 + (50 % arc4random()))]; 
	currentAction.onCompleteTarget = self;
	currentAction.onCompleteSelector = @selector(complete);
	[ai.parent runAction: currentAction];
}

-(float) value
{
	/*float dist = ccpDistance(ccp(ai.parent.x,ai.parent.z), 
							 ccp(ai.targetCharacter.x,ai.targetCharacter.z));
	if( dist > nearTargetDistance + 30 )
	{
		return (nearTargetDistance/dist);
		
	}
	
	return 0;*/
	return arc4random() % 100;
}

@end



@implementation BEUCharacterAIMoveAwayFromTarget

-(id)init
{
	if( (self = [super init]) )
	{
		name = @"moveAwayFromTarget";
	}
	
	return self;
}

+(id)behavior
{
	return [[[BEUCharacterAIMoveAwayFromTarget alloc] init] autorelease];
}


-(void)run
{
	[super run];
	
	currentAction = [BEUCharacterMoveTo actionWithPoint:
					 ccp( ai.targetCharacter.x - 150 + (arc4random()%300) , (arc4random()%100) )
					 ];
	
	currentAction.onCompleteSelector = @selector(complete);
	currentAction.onCompleteTarget = self;
	
	[ai.parent runAction: currentAction];
	 
	 
}

-(float)value
{
	
	/*float dist = ccpDistance(ccp(ai.parent.x,ai.parent.z), 
							 ccp(ai.targetCharacter.x,ai.targetCharacter.z));
	
	if( dist <= self.nearTargetDistance + 30 )
	{
		return (1 - (nearTargetDistance/dist));
	}
	
	return 0;*/
	
	return arc4random()%100;
}

@end