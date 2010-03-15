//
//  BEUInputObject.m
//  BEUEngine
//
//  Created by Chris Mele on 3/13/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUInputObject.h"


@implementation BEUInputObject
@synthesize inputLayer,ownedTouch;


-(BOOL)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	return NO;
}

-(void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
	
}

-(void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
	
	
}

-(CGPoint)getLocalTouchPoint:(UITouch *)touch
{
	CGPoint location = [touch locationInView:[touch view]];
	location = [[CCDirector sharedDirector] convertToGL:location];
	location = [self convertToNodeSpace:location];
	
	return location;
}

@end
