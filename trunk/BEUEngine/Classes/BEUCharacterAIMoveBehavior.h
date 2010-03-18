//
//  BEUCharacterAIMoveBehavior.h
//  BEUEngine
//
//  Created by Chris Mele on 3/6/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUCharacterAIBehavior.h"
#import "BEUCharacterAction.h"
#import "BEUCharacterMoveAction.h"
#import "BEUCharacterAI.h"

#import "BEUEnvironment.h"

@class BEUCharacterMoveTo;
@class BEUCharacterMoveToObject;
@class BEUCharacterAction;
@class BEUCharacterAI;

@interface BEUCharacterAIMove : BEUCharacterAIBehavior
{
	//Distance to be considered 'near target'
	float nearTargetDistance;
	
	//
	BEUCharacterAction *currentAction;
}

@property(nonatomic,assign) float nearTargetDistance;
@property(nonatomic,assign) BEUCharacterAction *currentAction;

@end


@interface BEUCharacterAIMoveToTarget : BEUCharacterAIMove 
{
	
}

@end

@interface BEUCharacterAIMoveAwayFromTarget : BEUCharacterAIMove
{
	
}

@end