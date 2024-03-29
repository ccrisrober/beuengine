//
//  BEUTestCharacter.h
//  BEUEngine
//
//  Created by Chris on 3/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BEUCharacter.h"
#import "BEUCharacterAI.h"
#import "BEUCharacterAIMoveBehavior.h"
#import "BEUCharacterAIBehavior.h"
#import "BEUCharacterAIIdleBehavior.h"
#import "BEUCharacterAIAttackBehavior.h"
#import "BEUCharacterAIBlockBehavior.h"

@class BEUCharacterAI;
@class BEUCharacterAIMoveAwayFromTarget;
@class BEUCharacterAIMoveToTarget;
@class BEUCharacterAIIdleBehavior;
@class BEUCharacterAIAttackWithRandomMove;
@class BEUCharacterAIBlockBehavior;

@interface BEUTestCharacter : BEUCharacter {
	CCSprite *body;
	
	NSString *currentAnimation;
	CCAction *currentAction;
}

@property(nonatomic,retain) CCSprite *body;

-(void)moveRight;
-(void)moveLeft;
-(void)standStill;
-(void)block;
-(void)hit:(BOOL)right;

-(void)punch:(BEUMove *)move;
-(void)punch2:(BEUMove *)move;
-(void)sendPunch;
-(void)punchComplete;

-(BOOL)receiveHit:(BEUAction *)action;


@end
