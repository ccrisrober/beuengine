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
	
	//Array of string value inputs that must be completed to do move, must match all to do move
	NSArray *inputSequence;
	
	//Whether or not the move can be interupted by enemy attacks
	BOOL interruptible;
	
	//Time from when move is complete to when the next move in a sequence can be done
	float cooldownTime;
	CCTimer *cooldownTimer;
	
	//Selector to fire when move is successfully started
	SEL moveSelector;
	
	//Selector to fire when move is completed, usually used in conjuction with move sequences
	SEL completeSelector;
	id completeTarget;
	
	BOOL completed;
	BOOL inProgress;
	
}


@property(nonatomic,copy) NSString *name;
@property(nonatomic,retain) BEUCharacter *character;
@property(nonatomic,retain) NSArray *inputSequence;
@property(nonatomic) BOOL interruptible;
@property(nonatomic) float cooldownTime;
@property(nonatomic) SEL moveSelector;
@property(nonatomic) SEL completeSelector;
@property(nonatomic, retain) id completeTarget;
@property(nonatomic) BOOL completed;
@property(nonatomic) BOOL inProgress;

+(id)moveWithName:(NSString *)name_
		character:(BEUCharacter *)character_ 
		 sequence:(NSArray *)sequence_
		 selector:(SEL)selector_;

-(id)initWithName:(NSString *)name_
		character:(BEUCharacter *)character_ 
		 sequence:(NSArray *)sequence_
		 selector:(SEL)selector_;


-(void)resetMove;
-(void)startMove;
-(void)cancelMove;
-(void)completeMove;

-(BOOL)trySequence:(NSArray *)sequence;

@end
