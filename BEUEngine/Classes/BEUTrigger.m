//
//  BEUTrigger.m
//  BEUEngine
//
//  Created by Chris on 3/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BEUTrigger.h"


@implementation BEUTrigger

@synthesize type, sender;

NSString *const BEUTriggerKilled = @"killed";
NSString *const BEUTriggerAllEnemiesKilled = @"allEnemiesKilled";
NSString *const BEUTriggerEnteredArea = @"enteredArea";
NSString *const BEUTriggerExitedArea = @"exitedArea";

-(id)init
{
	if( (self = [super init]) )
	{
		
	}
	
	return self;
	
}

-(id)initWithType:(NSString *)type_ sender:(id)sender_
{
	[self init];
	type = type_;
	sender = sender_;
	
	return self;
}

-(void)dealloc
{
	[type release];
	sender = nil;
	[super dealloc];
}

@end
