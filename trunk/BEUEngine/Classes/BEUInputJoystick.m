//
//  BEUInputJoystick.m
//  BEUEngine
//
//  Created by Chris Mele on 3/13/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUInputJoystick.h"


@implementation BEUInputJoystick

@synthesize percent, angle;

-(id)initWithRadius:(float)radius_ minZone:(float)min maxZone:(float)max
{
	
	if( (self = [super init]) )
	{
		minZone = min;
		maxZone = max;
		
		radius = radius_;
		
		joystickBase = [[CCSprite alloc] initWithFile:@"joystickBase.png"];
		joystickBase.scaleX = joystickBase.scaleY = radius*2/joystickBase.contentSize.width;
		
		joystickStick = [[CCSprite alloc] initWithFile:@"joystickStick.png"];
		joystickStick.scaleX = joystickStick.scaleY = (radius)/joystickStick.contentSize.width;
		
		[self addChild:joystickBase];
		[self addChild:joystickStick];
		
		joystickBase.opacity = 60;
		joystickStick.opacity = 60;
		
	}
	return self;
}

-(void)updateJoystickPosition:(CGPoint)point
{
	float distFromCenter = sqrtf(point.x*point.x + point.y*point.y);
	
	float actualPercent = distFromCenter/radius;
	if(actualPercent > 1) actualPercent = 1;
	
	percent = (distFromCenter - minZone)/(maxZone - minZone);
	
	if(percent > 1) percent = 1;
	else if(percent < 0) percent = 0;
	
	angle = [BEUMath angleFromPoint:CGPointZero toPoint:point];
	
	joystickStick.position = ccp(
								 cos(angle)*radius*actualPercent, 
								 sin(angle)*radius*actualPercent
								 );
	[inputLayer dispatchEvent: [BEUInputMovementEvent eventWithAngle:angle percent:percent sender:self]];
}

-(BOOL)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGPoint location = [touch locationInView:[touch view]];
	location = [[CCDirector sharedDirector] convertToGL:location];
	location = [self convertToNodeSpace:location];
	if(location.x > radius || 
	   location.x < -radius || 
	   location.y > radius || 
	   location.y < -radius)
	{
		return NO;
	} else {
		ownedTouch = touch;
		[self updateJoystickPosition:location];
		
		return YES;
	}
	
	
}

-(void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGPoint location = [touch locationInView:[touch view]];
	location = [[CCDirector sharedDirector] convertToGL:location];
	location = [self convertToNodeSpace:location];
	[self updateJoystickPosition:location];
}

-(void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGPoint location = [touch locationInView:[touch view]];
	location = [[CCDirector sharedDirector] convertToGL:location];
	location = [self convertToNodeSpace:location];
	[self updateJoystickPosition:CGPointZero];
	
	ownedTouch = nil;
}

-(void)dealloc
{
	[joystickBase release];
	[joystickStick release];
	inputLayer = nil;
	ownedTouch = nil;
	[super dealloc];
}



@end
