//
//  BEUInputLayer.m
//  BEUEngine
//
//  Created by Chris Mele on 2/18/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUInputLayer.h"


@implementation BEUInputLayer

@synthesize movementTouch, gestureTouch, character;

-(id)init 
{
	if( (self=[super init] )) {
		maximumMovementDist = 15;
		
		self.isTouchEnabled = YES;
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		
		movementArea = CGRectMake(0, 0, winSize.width*.5, winSize.height);
		gestureArea = CGRectMake(winSize.width*.5,0,winSize.width*.5,winSize.height);
		
		
		[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
	}
	
	return self;
}



-(BOOL)ccTouchBegan:(UITouch *)touch 
		  withEvent:(UIEvent *)event 
{
	
	
	CGPoint location = [touch locationInView:[touch view]];
	location = [[CCDirector sharedDirector] convertToGL:location];
	if (CGRectContainsPoint(movementArea, location) && !movementTouch)
	{
		movementTouch = touch;
		movementStart = location;
		movementDelta = CGPointZero;
		return YES;
	}
	
	if(CGRectContainsPoint(gestureArea, location) && !gestureTouch)
	{
		gestureTouch = touch;
		gestureStart = location;
		return YES;
	}
	
	return NO;	
}

-(void)ccTouchMoved:(UITouch *)touch 
		  withEvent:(UIEvent *)event 
{
	CGPoint location = [touch locationInView:[touch view]];
	location = [[CCDirector sharedDirector] convertToGL:location];
	
	
	if(touch == movementTouch)
	{
		movementPercent = hypot(location.x-movementStart.x, location.y-movementStart.y)/maximumMovementDist;
		if(movementPercent > 1) movementPercent = 1;			
		movementTheta = [BEUMath angleFromPoint:movementStart toPoint:location];
	}
	
	if(touch == gestureTouch)
	{
		
	}
}


-(void)ccTouchEnded:(UITouch *)touch 
		  withEvent:(UIEvent *)event 
{
	
	if(touch == movementTouch)
	{
		
		
		movementTouch = nil;
	}
	
	if(touch == gestureTouch)
	{
		
		gestureTouch = nil;
	}
}

-(void)assignPlayer:(BEUCharacter *)char_
{
	self.character = char_;
	
}

- (void)step:(ccTime)delta
{
	if(movementTouch && character){
		[character moveCharacterWithAngle:movementTheta percent:movementPercent];
	}
}

@end
