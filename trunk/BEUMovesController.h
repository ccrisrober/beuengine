//
//  BEUMovesController.h
//  BEUEngine
//
//  Created by Chris Mele on 2/27/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUMove.h"
#import "BEUMoveSequence.h"

@class BEUMove;
@class BEUMoveSequence;

@interface BEUMovesController : NSObject {
	BEUMoveSequence *currentSequence;
	NSMutableArray *moveSequences;
	NSMutableArray *inputQueue;
}

@property(nonatomic,retain) BEUMoveSequence *currentSequence;
@property(nonatomic,retain) NSMutableArray *moveSequences;
@property(nonatomic,retain) NSMutableArray *inputQueue;

-(id)initWithSequences:(NSMutableArray *)sequences;
-(void)addSequence:(BEUMoveSequence *)sequence;
-(void)sendInput:(BEUInputEvent *)inputEvent;

@end
