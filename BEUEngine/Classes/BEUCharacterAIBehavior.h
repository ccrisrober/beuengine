//
//  BEUCharacterAIDecision.h
//  BEUEngine
//
//  Created by Chris on 3/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BEUCharacterAI.h"

@class BEUCharacterAI;

@interface BEUCharacterAIBehavior : NSObject {
	//String name of behavior
	NSString *name;
	
	//Owner AI of behavior
	BEUCharacterAI *ai;
	
	//Array of sub behaviors, each a BEUCharacterAIBehavior
	NSMutableArray *behaviors;
	
	//Boolean value if behavior is running
	BOOL running;
	
	
	//Boolean value if the behavior can interupt other behaviors
	BOOL canInteruptOthers;
	
}

@property(nonatomic,copy) NSString *name;
@property(nonatomic,assign) BEUCharacterAI *ai;
@property(nonatomic,retain) NSMutableArray *behaviors;
@property(nonatomic,assign) BOOL running;
@property(nonatomic,assign) BOOL canInteruptOthers;


+(id)behavior;

+(id)behaviorWithName:(NSString *)name_ ;

+(id)behaviorWithName:(NSString *)name_ 
			behaviors:(NSMutableArray *)behaviors_;

-(id)initWithName:(NSString *)name_;

-(id)initWithName:(NSString *)name_
		behaviors:(NSMutableArray *)behaviors_;

-(void)addBehavior:(BEUCharacterAIBehavior *)behavior;

-(void)removeBehavior:(BEUCharacterAIBehavior *)behavior;

//The value of the behavior, higher is better, 0 is no value and decision will not be picked
-(float)value;

//Is the behavior the final value or is it just a branch with more behaviors
-(BOOL)isLeaf;

//Run behavior
-(void)run;

//Cancel the behavior
-(void)cancel;

//Complete the behavior
-(void)complete;

@end
