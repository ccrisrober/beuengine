//
//  BEUInputLayer.m
//  BEUEngine
//
//  Created by Chris Mele on 2/18/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUInputLayer.h"

@implementation BEUInputLayer

@synthesize movementArea, gestureArea, gestureStart, movementTouch, gestureTouch, receivers, movementEvent, gestureEvent;

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
	if (CGRectContainsPoint(self.movementArea, location) && !self.movementTouch)
	{
		self.movementTouch = touch;
		
		self.movementEvent = [[BEUInputMovementEvent alloc] initWithStartPosition:location 
														 maximumMovementDist:maximumMovementDist];
		[self dispatchEvent:movementEvent];
		
		return YES;
	}
	
	if(CGRectContainsPoint(self.gestureArea, location) && !self.gestureTouch)
	{
		self.gestureTouch = touch;
		self.gestureStart = [NSValue valueWithCGPoint: location];
		return YES;
	}
	
	return NO;	
}

-(void)ccTouchMoved:(UITouch *)touch 
		  withEvent:(UIEvent *)event 
{
	CGPoint location = [touch locationInView:[touch view]];
	location = [[CCDirector sharedDirector] convertToGL:location];
	
	
	if(touch == self.movementTouch && self.movementEvent)
	{
		[self.movementEvent addPosition:location];
		[self dispatchEvent:self.movementEvent];
	}
	
	if(touch == self.gestureTouch)
	{
		
	}
}


-(void)ccTouchEnded:(UITouch *)touch 
		  withEvent:(UIEvent *)event 
{
	
	CGPoint location = [touch locationInView:[touch view]];
	location = [[CCDirector sharedDirector] convertToGL:location];
	
	if(touch == self.movementTouch)
	{
		[self.movementEvent complete];
		[self dispatchEvent:self.movementEvent];
		
		self.movementTouch = nil;
	}
	
	if(touch == self.gestureTouch)
	{
		
		float gestureDistance = ccpDistance([self.gestureStart CGPointValue], location);
		
		
		//Check the distance from start to finish in a gesture, if less than maximumTapDist, then 
		//the gesture was a tap
		if(gestureDistance <= maximumTapDist){
			[self dispatchEvent:[[BEUInputEvent alloc] initWithType:BEUInputTap]];
		}
		
		self.gestureStart = nil;
		self.gestureTouch = nil;
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
