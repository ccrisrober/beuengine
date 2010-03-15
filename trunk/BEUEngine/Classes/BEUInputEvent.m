//
//  BEUInputEvent.m
//  BEUEngine
//
//  Created by Chris on 2/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BEUInputEvent.h"


@implementation BEUInputEvent

@synthesize type, completed, sender;

NSString *const BEUInputTap = @"BEUInputTap";
NSString *const BEUInputSwipeLeft = @"BEUInputSwipeLeft";
NSString *const BEUInputSwipeRight = @"BEUInputSwipeRight";
NSString *const BEUInputSwipeUp = @"BEUInputSwipeUp";
NSString *const BEUInputSwipeDown = @"BEUInputSwipeDown";

NSString *const BEUInputSwipeForward = @"BEUInputSwipeForward";
NSString *const BEUInputSwipeBack = @"BEUInputSwipeBack";


-(id)initWithType:(NSString *)type_ sender:(BEUInputObject *)object
{
	if( (self = [super init]) ) {
		self.type = type_;
		self.sender = object;
		completed = NO;
	}
	
	return self;
}

+(id)eventWithType:(NSString *)type_ sender:(BEUInputObject *)object
{
	return [[[self alloc] initWithType:type_ sender:object] autorelease];
}

-(void)complete
{
	completed = YES;
}

-(BEUInputEvent *)clone
{
	BEUInputEvent *clonedEvent = [[BEUInputEvent alloc] initWithType:type sender:sender];
	clonedEvent.completed = completed;
	
	return clonedEvent;
}

-(void)dealloc
{
	[type release];
	
	sender = nil;
	
	[super dealloc];
}

@end
