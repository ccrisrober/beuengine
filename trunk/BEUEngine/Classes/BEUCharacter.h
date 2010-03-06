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
	
}

@property(nonatomic,retain) BEUMovesController *movesController;
@property(nonatomic,retain) BEUMove *currentMove;
@property(nonatomic) float life;
@property(nonatomic) BOOL canMove;
@property(nonatomic,assign) BOOL enemy;
@property(nonatomic,retain) BEUCharacterAI *ai;
@property(nonatomic,retain) NSMutableArray *updateSelectors;

//Basic move function with angle and percent which control the percent of moveSpeed that the character moves
-(void)moveCharacterWithAngle:(float)angle percent:(float)percent;



-(void)kill;


@end
