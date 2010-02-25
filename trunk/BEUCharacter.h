//
//  BEUCharacter.h
//  BEUEngine
//
//  Created by Chris Mele on 2/17/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUObject.h"
#import "BEUInputEvent.h"
#import "BEUInputMovementEvent.h"
#import "BEUInputReceiverProtocol.h"

@class BEUInputEvent;
@class BEUInputMovementEvent;

@interface BEUCharacter : BEUObject <BEUInputReceiverProtocol> {
	NSNumber *life;
	CCSprite *body;
	
	NSString *currentAnimation;
	CCAction *currentAction;
	
	BOOL canMove;
}

@property(nonatomic,retain) NSNumber *life;
@property(nonatomic,retain) CCSprite *body;
@property(nonatomic) BOOL canMove;

-(void)moveRight;
-(void)moveLeft;
-(void)standStill;

-(void)punch;
-(void)punchComplete;

-(void)moveCharacterWithAngle:(float)angle percent:(float)percent;

@end
