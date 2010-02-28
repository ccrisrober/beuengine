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
#import "BEUAction.h"
#import "BEUActionsController.h"
#import "BEUHitAction.h"
#import "BEUMovesController.h"
#import "BEUMoveSequence.h"
#import "BEUMove.h"

@class BEUInputEvent;
@class BEUInputMovementEvent;
@class BEUAction;
@class BEUHitAction;
@class BEUMove;
@class BEUMoveSequence;
@class BEUMovesController;

@interface BEUCharacter : BEUObject <BEUInputReceiverProtocol> {
	NSNumber *life;
	CCSprite *body;
	
	NSString *currentAnimation;
	CCAction *currentAction;
	
	BOOL canMove;
	
	BEUMovesController *movesController;
	BEUMove *currentMove;
}

@property(nonatomic,retain) BEUMove *currentMove;
@property(nonatomic,retain) BEUMovesController *movesController;
@property(nonatomic,retain) NSNumber *life;
@property(nonatomic,retain) CCSprite *body;
@property(nonatomic) BOOL canMove;

-(void)moveRight;
-(void)moveLeft;
-(void)standStill;

-(void)hit;

-(void)punch;
-(void)sendPunch;
-(void)punchComplete;

-(BOOL)receiveHit:(BEUAction *)action;

-(void)moveCharacterWithAngle:(float)angle percent:(float)percent;



@end
