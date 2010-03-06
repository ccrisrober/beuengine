//
//  BEUCharacterAction.m
//  BEUEngine
//
//  Created by Chris on 3/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BEUCharacterAction.h"


@implementation BEUCharacterAction

@synthesize completed;


-(id)init
{
	if( (self = [super init]) )
	{
		completed = NO;
	}
	
	return self;
}

-(void)dealloc
{

	[super dealloc];
}

-(void)step:(ccTime)dt
{
	[self update:dt];
}

@end
