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
#import "BEUMove.h"
#import "BEUMovesController.h"
#import "BEUTrigger.h"
#import "BEUTriggerController.h"

@class BEUInputEvent;
@class BEUInputMovementEvent;
@class BEUAction;
@class BEUHitAction;
@class BEUMove;
@class BEUMovesController;
@class BEUTrigger;
@class BEUTriggerController;

@interface BEUCharacter : BEUObject <BEUInputReceiverProtocol> {
	
	float life;	
	
	BOOL canMove;
	
	BEUMovesController *movesController;
	BEUMove *currentMove;
	
}


@property(nonatomic,retain) BEUMovesController *movesController;
@property(nonatomic,retain) BEUMove *currentMove;
@property(nonatomic) float life;
@property(nonatomic) BOOL canMove;


-(void)moveCharacterWithAngle:(float)angle percent:(float)percent;
-(void)kill;


@end
