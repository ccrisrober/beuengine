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
#import "BEUMath.h"
#import "BEUMove.h"
#import "BEUMovesController.h"
#import "BEUTrigger.h"
#import "BEUTriggerController.h"
#import "BEUCharacterAI.h"

@class BEUInputEvent;
@class BEUInputMovementEvent;
@class BEUAction;
@class BEUHitAction;
@class BEUMove;
@class BEUMovesController;
@class BEUTrigger;
@class BEUTriggerController;
@class BEUCharacterAI;

@interface BEUCharacter : BEUObject <BEUInputReceiverProtocol> {
	
	float life;	
	
	BOOL canMove;
	BOOL enemy;
	BEUMovesController *movesController;
	BEUMove *currentMove;
	
	
	//Ai of character, will run if assigned
	BEUCharacterAI *ai;
	
	
	//Array of selectors that should be run on each update of character
	//remove and add to array if you ened a specific action to run for the character
	//Selectors added should accept 1 argument of delta ccTime
	NSMutableArray *updateSelectors;
	
	//String value of the current state the character is in, the character
	//should always have a state
	NSString *state;
	
	//If set, the character should orient itself to the object, even 
	//when moving away from it. (Useful for enemies as they really only look at 
	//the player)
	BEUObject *orientToObject;
	
	BEUInputMovementEvent *inputEvent;
	
	//angle and percent to continuosly apply to movex and movez
	float movingAngle;
	float movingPercent;

}

//Some standard character states to use
extern NSString *const BEUCharacterStateIdle;
extern NSString *const BEUCharacterStateMoving;
extern NSString *const BEUCharacterStateBlocking;
extern NSString *const BEUCharacterStateAttacking;

@property(nonatomic,retain) BEUMovesController *movesController;
@property(nonatomic,retain) BEUMove *currentMove;
@property(nonatomic) float life;
@property(nonatomic) BOOL canMove;
@property(nonatomic,assign) BOOL enemy;
@property(nonatomic,retain) BEUCharacterAI *ai;
@property(nonatomic,retain) NSMutableArray *updateSelectors;
@property(nonatomic,copy) NSString *state;
@property(nonatomic,assign) BEUObject *orientToObject;
//Basic move function with angle and percent which control the percent of moveSpeed that the character moves
-(void)moveCharacterWithAngle:(float)angle percent:(float)percent;

//Basic receiver of hit actions, which will take the forces and apply them to the character
//Also makes sure that the character can receive the hit and returns BOOL value on checking
-(BOOL)receiveHit:(BEUAction *)action;

//empty hit function to override for each character, function actually called if hit is
//not blocked by the character
-(void)hit:(BEUAction *)action;

//Standard walk function called when move message is received
-(void)walk;

//Standard walk function when move message is received and moveX and Z are 0
-(void)idle;

//Killing of character
-(void)kill;


@end
