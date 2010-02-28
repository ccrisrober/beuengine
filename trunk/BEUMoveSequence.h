//
//  MoveSequence.h
//  BEUEngine
//
//  Created by Chris Mele on 2/27/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUMove.h"
#import "BEUInputEvent.h"

@class BEUMove;
@class BEUInputEvent;

@interface BEUMoveSequence : NSObject {
	NSMutableArray *moves;
	BEUMove *currentMove;
	CCTimer *cooldownTimer;
}

@property(nonatomic, retain) NSMutableArray *moves;
@property(nonatomic, retain) BEUMove *currentMove;
@property(nonatomic, retain) CCTimer *cooldownTimer;

-(id)initWithMoves:(NSMutableArray *)moves_;

-(BOOL)tryInputQueue:(NSMutableArray *)inputQueue;
-(void)moveComplete:(BEUMove *)completedMove_;
-(void)startCooldown:(float)time_;
-(void)endCooldown:(ccTime)delta;
-(void)resetSequence;
@end
