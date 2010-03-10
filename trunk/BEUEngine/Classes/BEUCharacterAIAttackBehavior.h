//
//  BEUCharacterAIAttackBehavior.h
//  BEUEngine
//
//  Created by Chris Mele on 3/8/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUCharacterAIBehavior.h"
#import "BEUCharacterMoveAction.h"
#import "BEUMove.h"

@class BEUCharacterAIBehavior;
@class BEUCharacterMoveToObject;

@interface BEUCharacterAIAttackBehavior : BEUCharacterAIBehavior 
{

}

-(BOOL)hasMoveInRange;

@end


@interface BEUCharacterAIAttackWithRandomMove : BEUCharacterAIAttackBehavior
{
	NSMutableArray *moves;
}

@property(nonatomic,retain) NSMutableArray *moves;

-(id)initWithMoves:(NSMutableArray *)moves;

+(id)behaviorWithMoves:(NSMutableArray *)moves;

-(BEUMove *)getRandomMove;
-(BEUMove *)getRandomMoveInRange;


@end

@interface BEUCharacterAIMoveToAndAttack : BEUCharacterAIAttackWithRandomMove
{
	BEUMove *attackMove;
}

@property(nonatomic,assign) BEUMove *attackMove;

-(void)moveToComplete;

@end