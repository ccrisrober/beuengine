//
//  BEUCharacterAI.h
//  BEUEngine
//
//  Created by Chris on 3/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#import "BEUCharacter.h"
#import "BEUObject.h"
#import "BEUObjectController.h"
#import "BEUMath.h"
#import "BEUCharacterAIBehavior.h"

@class BEUCharacterAIBehavior;
@class BEUObject;
@class BEUObjectController;
@class BEUCharacter;
@class BEUMath;

@interface BEUCharacterAI : NSObject {
	//Object that owns this ai
	BEUCharacter *parent;
	
	//Object that the ai is currently targeting
	BEUCharacter *targetCharacter;
	
		//Array of behaviors, behaviors then have sub behaviors and so on until a actual behavior is reached
	NSMutableArray *behaviors;
	
	//Current Behavior running
	BEUCharacterAIBehavior *currentBehavior;
	
	//run updated function every so many ticks
	int updateEvery;
	
}

@property(nonatomic,assign) BEUCharacter *parent;
@property(nonatomic,assign) BEUCharacter *targetCharacter;
@property(nonatomic,retain) NSMutableArray *behaviors;
@property(nonatomic,assign) BEUCharacterAIBehavior *currentBehavior;
@property(nonatomic,assign) int updateEvery;

-(id)initWithParent:(BEUCharacter *)parent_;

-(void)update:(ccTime)delta;

-(void)addBehavior:(BEUCharacterAIBehavior *)behavior_;
-(void)removeBehavior:(BEUCharacterAIBehavior *)behavior_;

-(BEUCharacterAIBehavior *)getHighestValueBehavior;

-(BEUCharacter *)findClosestEnemy;

@end
