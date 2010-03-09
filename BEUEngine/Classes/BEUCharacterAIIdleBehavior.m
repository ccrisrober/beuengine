//
//  BEUCharacterAIIdleBehavior.m
//  BEUEngine
//
//  Created by Chris on 3/8/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "BEUCharacterAIIdleBehavior.h"


@implementation BEUCharacterAIIdleBehavior

@synthesize minTime,maxTime;

-(id)initWithMinTime:(float)min maxTime:(float)max
{
	if( (self = [super initWithName:@"idle"]) ){
		minTime = min;
		maxTime = max;
	}
	
	return self;
}

+(id)behaviorWithMinTime:(float)min maxTime:(float)max
{
	return [[[BEUCharacterAIIdleBehavior alloc] initWithMinTime:min maxTime:max] autorelease];
}

-(float)value
{
	return arc4random() % 50;
}

-(void)run
{
	NSLog(@"GOING IDLE");
	[super run];
	[ai.parent runAction:
	 [CCSequence actions: 
	  [CCDelayTime actionWithDuration:1],
	  [CCCallFunc actionWithTarget:self selector:@selector(complete)],
	  nil 
	  ]
	 ];
}

@end
