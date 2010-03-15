//
//  BEUInputGestureArea.m
//  BEUEngine
//
//  Created by Chris Mele on 3/14/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUInputGestureArea.h"


@implementation BEUInputGestureArea




-(id)initWithArea:(CGRect)area
{
	if( (self = [super init]) )
	{
		inputArea = area;
		maximumTapDist = 15;

	}
	
	return self;
}

-(BOOL)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGPoint location = [self getLocalTouchPoint:touch];
	if(CGRectContainsPoint(inputArea, location))
	{
		ownedTouch = touch;
		startPos = location;
		return YES;
	}
	
	return NO;
}

-(void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
	
}

-(void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGPoint location = [self getLocalTouchPoint:touch];
	float gestureDistance = hypot(location.x-startPos.x, location.y-startPos.y);
	
	if(gestureDistance <= maximumTapDist){
		[inputLayer dispatchEvent:[[BEUInputEvent alloc] initWithType:BEUInputTap sender:self]];
	} else {
		
		float vDist = location.y - startPos.y;
		float hDist = location.x - startPos.x;
		
		if(fabs(vDist) > fabs(hDist))
		{
			if(vDist >= 0)
			{
				[self dispatchEvent:[[BEUInputEvent alloc] initWithType:BEUInputSwipeUp]];
			} else {
				[self dispatchEvent:[[BEUInputEvent alloc] initWithType:BEUInputSwipeDown]];
			}
		} else {
			if(hDist >= 0)
			{
				[self dispatchEvent:[[BEUInputEvent alloc] initWithType:BEUInputSwipeRight]];
			} else {
				[self dispatchEvent:[[BEUInputEvent alloc] initWithType:BEUInputSwipeLeft]];
			}
		}
		
		
	}
	
}

-(void)dealloc
{
	
	[super dealloc];
}

@end
