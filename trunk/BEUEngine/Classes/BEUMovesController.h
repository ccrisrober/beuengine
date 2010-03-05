//
//  BEUMovesController.h
//  BEUEngine
//
//  Created by Chris Mele on 2/27/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUMove.h"

@class BEUMove;

@interface BEUMovesController : NSObject {
	BEUMove *currentMove;
	NSMutableArray *moves;
	NSMutableArray *inputSequence;
	CCTimer *cooldownTimer;
	
	BOOL coolingDown;
	float cooldownTime;
	
	BOOL canReceiveInput;
	
	CCTimer *waitTimer;
	float waitTime;
	BOOL waiting;
}

@property(nonatomic) float cooldownTime;
@property(nonatomic) BOOL canReceiveInput;
@property(nonatomic) BOOL waiting;
@property(nonatomic) float waitTime;
@property(nonatomic,retain) CCTimer *waitTimer;
@property(nonatomic) BOOL coolingDown;
@property(nonatomic,retain) CCTimer *cooldownTimer;
@property(nonatomic,retain) BEUMove *currentMove;
@property(nonatomic,retain) NSMutableArray *moves;
@property(nonatomic,retain) NSMutableArray *inputSequence;

-(id)initWithMoves:(NSMutableArray *)moves_;
-(void)addMove:(BEUMove *)move;
-(void)sendInput:(BEUInputEvent *)inputEvent;
-(void)startCooldown;
-(void)endCooldown:(ccTime)delta;
-(void)moveComplete:(BEUMove *)move;
-(void)waitForNextInput;
-(void)noInputReceived:(ccTime)delta;
-(BEUMove *)getMoveWithName:(NSString *)name;
@end
