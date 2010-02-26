//
//  BEUAction.m
//  BEUEngine
//
//  Created by Chris on 2/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BEUAction.h"


@implementation BEUAction

@synthesize sender, selector, receivableClasses, duration, sendsLeft;

-(id)init
{
	if( (self=[super init]) )
	{
		duration = 1;
		sendsLeft = -1;
	}
	
	return self;
}

-(id)initWithSender:(id)sender_ selector:(SEL)selector_ duration:(int)duration_
{
	[self init];
	
	sender = sender_;
	selector = selector_;
	duration = duration_;
	
	return self;
}

-(id)initWithSender:(id)sender_ selector:(SEL)selector_ duration:(int)duration_ receivableClasses:(NSMutableArray *)classes
{
		
	[self initWithSender:sender	selector:selector_ duration:duration_];
	
	receivableClasses = classes;
	
	return self;
	
}

-(BOOL)isReceivableClass:(Class)class_
{
	if(receivableClasses)
	{
		for(Class receivableClass in receivableClasses)
		{
			if([receivableClass isKindOfClass:class_]){
				return YES;
			}
		}
		
		return NO;
	} else {
		return YES;
	}
}


-(void)dealloc
{
	sender = nil;
	selector = nil;
	
	[receivableClasses release];
	
	[super dealloc];
}


@end
