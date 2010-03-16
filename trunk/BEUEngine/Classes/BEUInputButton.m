//
//  BEUInputButton.m
//  BEUEngine
//
//  Created by Chris on 3/15/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "BEUInputButton.h"


@implementation BEUInputButton

-(id)initWithUpSprite:(CCSprite *)up downSprite:(CCSprite *)down
{
	if( (self = [super init]) )
	{
		upSprite = up; 
		upSprite.opacity = 100;
		
		downSprite = down;
		downSprite.opacity = 100;
		
		[self addChild:upSprite];
		[self addChild:downSprite];
		
		downSprite.visible = NO;
	}
	
	return self;
	
}

-(BOOL)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGPoint location = [self getLocalTouchPoint:touch];
	if(location.x > -self.contentSize.width/2 &&
	   location.x < self.contentSize.width/2 &&
	   location.y > -self.contentSize.height/2 &&
	   location.y < self.contentSize.height/2)
	{
		upSprite.visible = NO;
		downSprite.visible = YES;
		
		[inputLayer dispatchEvent:[BEUInputEvent eventWithType:BEUInputButtonDown sender:self]];
		
		ownedTouch = touch;
		return YES;
	}
	
	return NO;
}

-(void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
	
}

-(void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
	upSprite.visible = YES;
	downSprite.visible = NO;
	
	ownedTouch = nil;
	
	[inputLayer dispatchEvent:[BEUInputEvent eventWithType:BEUInputButtonUp sender:self]];
}

-(void)dealloc
{
	ownedTouch = nil;
	[upSprite release];
	[downSprite release];
	
	[super dealloc];
}

@end
