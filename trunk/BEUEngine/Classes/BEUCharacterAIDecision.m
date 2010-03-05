//
//  BEUCharacterAIDecision.m
//  BEUEngine
//
//  Created by Chris on 3/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BEUCharacterAIDecision.h"


@implementation BEUCharacterAIDecision

@synthesize name,value,decisions;

+(id)decisionWithName:(NSString *)name_ 
				value:(float)value_
{
	return [[[BEUCharacterAIDecision alloc]
			 initWithName:name_ value:value_]
			autorelease];
}

+(id)decisionWithName:(NSString *)name_ 
				value:(float)value_ 
			decisions:(NSMutableArray *)decisions_
{
	return [[[BEUCharacterAIDecision alloc] 
			 initWithName:name_ 
			 value:value_ 
			 decisions:decisions_] 
			autorelease];
}

-(id)init
{
	if( (self = [super init]) )
	{
		
	}
	
	return self;
}

-(id)initWithName:(NSString *)name_ value:(float)value_
{
	[super init];
	name = name_;
	value = value_;
}

-(id)initWithName:(NSString *)name_ value:(float)value_ decisions:(NSMutableArray *)decisions_
{
	[self initWithName:name_ value:value_];
	decisions = decisions_;
}

@end
