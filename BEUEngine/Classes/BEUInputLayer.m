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
		
		inputs = [[NSMutableArray alloc] init];
		receivers = [[NSMutableArray alloc] init];
				
		maximumTapDist = 10;
		
		self.isTouchEnabled = YES;
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		
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
	
	for ( BEUInputObject *input in inputs ) 
	{
		if([input touchBegan:touch withEvent:event]) return YES;
	}
	
	return NO;
	
	/*
	if(CGRectContainsPoint(self.gestureArea, location) && !self.gestureTouch)
	{
		self.gestureTouch = touch;
		self.gestureStart = [NSValue valueWithCGPoint: location];
		return YES;
	}
	
	return NO;	*/
}



-(void)ccTouchMoved:(UITouch *)touch 
		  withEvent:(UIEvent *)event 
{
	CGPoint location = [touch locationInView:[touch view]];
	location = [[CCDirector sharedDirector] convertToGL:location];
	
	
	for ( BEUInputObject *input in inputs ) 
	{
		if(input.ownedTouch == touch)
		{
			[input touchMoved:touch withEvent:event];
		}
	}
	
	
}


-(void)ccTouchEnded:(UITouch *)touch 
		  withEvent:(UIEvent *)event 
{
	
	CGPoint location = [touch locationInView:[touch view]];
	location = [[CCDirector sharedDirector] convertToGL:location];
	
	
	for ( BEUInputObject *input in inputs )
	{
		if(input.ownedTouch == touch)
		{
			[input touchEnded:touch withEvent:event];
		}
	}
	
	/*
	if(touch == self.gestureTouch)
	{
		
		float gestureDistance = ccpDistance([self.gestureStart CGPointValue], location);
		
		//Check the distance from start to finish in a gesture, if less than maximumTapDist, then 
		//the gesture was a tap
		if(gestureDistance <= maximumTapDist){
			[self dispatchEvent:[[BEUInputEvent alloc] initWithType:BEUInputTap]];
		} else {
			CGPoint start = [gestureStart CGPointValue];
			CGPoint end = location;
			float vDist = end.y - start.y;
			float hDist = end.x - start.x;
			
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
		
		self.gestureStart = nil;
		self.gestureTouch = nil;
	 }*/
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

-(void)addInput:(BEUInputObject *)input
{
	if([inputs containsObject:input]){
		NSLog(@"BEUInputLayer: Cannot add input, already added");
		return;
	}
	input.inputLayer = self;
	[inputs addObject:input];
	
	[self addChild:input];
}

-(void)removeInput:(BEUInputObject *)input
{
	if([inputs containsObject:input]){
		[inputs removeObject:input];
		
	} else {
		NSLog(@"BEUInputLayer: Cannot add input, already added");
		return;
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
