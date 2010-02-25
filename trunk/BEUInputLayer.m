//
//  BEUInputLayer.m
//  BEUEngine
//
//  Created by Chris Mele on 2/18/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUInputLayer.h"

@implementation BEUInputLayer

@synthesize movementTouch, gestureTouch, receivers;

-(id)init 
{
	if( (self=[super init] )) {
		
		receivers = [[NSMutableArray alloc] init];
		
		maximumMovementDist = 15;
		
		maximumTapDist = 10;
		
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
		
		movementEvent = [[BEUInputMovementEvent alloc] initWithStartPosition:location 
														 maximumMovementDist:maximumMovementDist];
		[self dispatchEvent:movementEvent];
		
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
	
	
	if(touch == movementTouch && movementEvent)
	{
		[movementEvent addPosition:location];
		[self dispatchEvent:movementEvent];
	}
	
	if(touch == gestureTouch)
	{
		
	}
}


-(void)ccTouchEnded:(UITouch *)touch 
		  withEvent:(UIEvent *)event 
{
	
	CGPoint location = [touch locationInView:[touch view]];
	location = [[CCDirector sharedDirector] convertToGL:location];
	
	if(touch == movementTouch)
	{
		[movementEvent complete];
		[self dispatchEvent:movementEvent];
		
		movementTouch = nil;
	}
	
	if(touch == gestureTouch)
	{
		
		float gestureDistance = ccpDistance(gestureStart, location);
		
		
		//Check the distance from start to finish in a gesture, if less than maximumTapDist, then 
		//the gesture was a tap
		if(gestureDistance <= maximumTapDist){
			[self dispatchEvent:[[BEUInputEvent alloc] initWithType:BEUInputTap]];
		}
		
		gestureTouch = nil;
	}
}

-(void)addReceiver:(id <BEUInputReceiverProtocol>)receiver
{
	if([receivers containsObject:receiver]){
		NSLog(@"BEUInputLayer: Cannot add receiver, already added");
		return;
	}
	
	[receivers addObject:receiver];
	
	
}

-(void)removeReceiver:(id <BEUInputReceiverProtocol>)receiver
{
	if([receivers containsObject:receiver]){
		[receivers removeObject:receiver];
	} else {
		NSLog(@"BEUInputLayer: Cannot remove receiver, not added");
	}
}

-(void)dispatchEvent:(BEUInputEvent *)event
{
	for(id<BEUInputReceiverProtocol> receiver in receivers)
	{
		[receiver receiveInput:event];
	}
}

- (void)step:(ccTime)delta
{
	
}

@end
