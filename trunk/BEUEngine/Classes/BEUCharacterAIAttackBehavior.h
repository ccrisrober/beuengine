//
//  BEUCharacterAIAttackBehavior.h
//  BEUEngine
//
//  Created by Chris Mele on 3/8/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUCharacterAIBehavior.h"
#import "BEUMove.h"

@class BEUCharacterAIBehavior;

@interface BEUCharacterAIAttackBehavior : BEUCharacterAIBehavior 
{

}

-(BOOL)hasMoveInRange;

@end


@interface BEUCharacterAIAttackWithRandomMove : BEUCharacterAttackBehavior
{
	NSMutableArray *moves;
}

-(id)initWithMoves:(NSMutableArray *)moves;

+(id)behaviorWithMoves:(NSMutableArray *)moves;

@end