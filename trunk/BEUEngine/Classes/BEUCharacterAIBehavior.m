//
//  BEUCharacterAIDecision.m
//  BEUEngine
//
//  Created by Chris on 3/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BEUCharacterAIBehavior.h"


@implementation BEUCharacterAIBehavior

@synthesize name,behaviors,ai,running,canInteruptOthers;

+(id)behavior
{
	return [[[BEUCharacterAIBehavior alloc] init] autorelease];
}

+(id)behaviorWithName:(NSString *)name_ 
{
	return [[[BEUCharacterAIBehavior alloc]
			 initWithName:name_]
			autorelease];
}

+(id)behaviorWithName:(NSString *)name_
			behaviors:(NSMutableArray *)behaviors_
{
	return [[[BEUCharacterAIBehavior alloc] 
			 initWithName:name_ 
			 behaviors:behaviors_] 
			autorelease];
}

-(id)init
{
	if( (self = [super init]) )
	{
		ai = nil;
		running = NO;
		canInteruptOthers = NO;
	}
	
	return self;
}

-(id)initWithName:(NSString *)name_
{
	[super init];
	name = name_;
	
	return self;
}

-(id)initWithName:(NSString *)name_ behaviors:(NSMutableArray *)behaviors_
{
	[self initWithName:name_];
	behaviors = behaviors_;
	
	return self;
}

-(void)setAi:(BEUCharacterAI *)ai_
{
	ai = ai_;
	for(BEUCharacterAIBehavior *behavior in behaviors)
	{
		behavior.ai = ai_;
	}
}

-(BEUCharacterAI *)ai
{
	return ai;
}

-(void)addBehavior:(BEUCharacterAIBehavior *)behavior
{
	if(!behaviors) 
		behaviors = [[NSMutableArray alloc] init];
	[behaviors addObject:behavior];
	if(ai) behavior.ai = ai;
}

-(void)removeBehavior:(BEUCharacterAIBehavior *)behavior
{
	if([behaviors containsObject:behavior]) 
		[behaviors removeObject:behavior];
	[behavior release];
}

-(BOOL)isLeaf
{
	if(!behaviors) return YES;
	if(behaviors.count > 0) return NO;
	
	return YES;
}

-(float)value
{
	//OVERRIDE THIS AND RRETURN THE CORRECT VALUE
	return 1;
}

-(void)run
{
	//OVERRIDE THIS FUNCTION
	
	running = YES;
}

-(void)cancel
{
	//OVERRIDE THIS FUNCTION
	running = NO;
}

-(void)complete
{
	//OVERRIDE THIS FUNCTION
	running = NO;
}

-(void)dealloc
{	
	[behaviors release];
	ai = nil;
	[name release];
	
	[super dealloc];
}

@end
