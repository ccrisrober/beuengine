//
//  BEUMove.h
//  BEUEngine
//
//  Created by Chris Mele on 2/27/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUCharacter.h"
#import "BEUAction.h"

@class BEUCharacter;
@class BEUAction;

@interface BEUMove : NSObject {
	
	//Unique name of move
	NSString *name;
	
	BEUCharacter *character;
	
	
	//Array of moves which can be performed in sequence after this move, should be nil if no
	//moves are after the current move
	NSMutableArray *subMoves;
	
	//Array of string value inputs that must be completed to do move, must match all to do move
	NSArray *inputSequence;
	
	//Whether or not the move can be interupted by enemy attacks
	BOOL interruptible;
	
	//Time from when move is complete to when the next move in a sequence can be done
	float cooldownTime;
	CCTimer *cooldownTimer;
	
	//Selector to fire when move is attempted, the selector should return YES or NO depending on if it was successful
	SEL moveSelector;
	
	//Selector to fire when move is completed, usually used in conjuction with move sequences
	SEL completeSelector;
	id completeTarget;
	
	BOOL completed;
	BOOL inProgress;
	
	//Distance range of the move, useful for AI so it 
	//knows how far the character must be to perform the move
	float range;
}


@property(nonatomic,copy) NSString *name;
@property(nonatomic,retain) BEUCharacter *character;
@property(nonatomic,retain) NSMutableArray *subMoves;
@property(nonatomic,retain) NSArray *inputSequence;
@property(nonatomic) BOOL interruptible;
@property(nonatomic) float cooldownTime;
@property(nonatomic) SEL moveSelector;
@property(nonatomic) SEL completeSelector;
@property(nonatomic, retain) id completeTarget;
@property(nonatomic) BOOL completed;
@property(nonatomic) BOOL inProgress;
@property(nonatomic) float range;

+(id)moveWithName:(NSString *)name_
		character:(BEUCharacter *)character_ 
		 sequence:(NSArray *)sequence_
		 selector:(SEL)selector_;

-(id)initWithName:(NSString *)name_
		character:(BEUCharacter *)character_ 
		 sequence:(NSArray *)sequence_
		 selector:(SEL)selector_;


+(id)moveWithName:(NSString *)name_ 
		character:(BEUCharacter *)character_
		 selector:(SEL)selector_ 
		 subMoves:(NSMutableArray *)moves_;

-(id)initWithName:(NSString *)name_ 
		character:(BEUCharacter *)character_ 
		 selector:(SEL)selector_ 
		 subMoves:(NSMutableArray *)moves_;

-(void)resetMove;
-(BOOL)startMove;
-(void)cancelMove;
-(void)completeMove;

-(BOOL)trySequence:(NSArray *)sequence;

@end
