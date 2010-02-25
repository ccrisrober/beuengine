//
//  BEUInputEvent.m
//  BEUEngine
//
//  Created by Chris on 2/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BEUInputEvent.h"


@implementation BEUInputEvent

@synthesize type, completed, startTime, endTime;

NSString *const BEUInputTap = @"BEUInputTap";

-(id)initWithType:(NSString *)type_
{
	if( (self = [super init]) ) {
		self.type = type_;
		
		completed = NO;
	}
	
	return self;
}

-(void)complete
{
	completed = YES;
}

-(void)dealloc
{
	[type release];
	[super dealloc];
}

@end
