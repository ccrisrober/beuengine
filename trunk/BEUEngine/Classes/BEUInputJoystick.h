//
//  BEUInputJoystick.h
//  BEUEngine
//
//  Created by Chris Mele on 3/13/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "cocos2d.h"
#import "BEUInputObject.h"
#import "BEUInputLayer.h"
#import "BEUInputMovementEvent.h"

@class BEUInputObject;
@class BEUInputLayer;
@class BEUInputMovementEvent;

@interface BEUInputJoystick : BEUInputObject {
	
	float radius;
	float minZone;
	float maxZone;
	
	float percent;
	float angle;
	
	CCSprite *joystickBase;
	CCSprite *joystickStick;
}

@property(nonatomic) float percent;
@property(nonatomic) float angle;

-(id)initWithRadius:(float)radius_ minZone:(float)min maxZone:(float)max;

-(void)updateJoystickPosition:(CGPoint)point;

@end
