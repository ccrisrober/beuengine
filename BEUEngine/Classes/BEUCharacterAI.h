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

@class BEUObject;
@class BEUObjectController;
@class BEUCharacter;
@class BEUMath;

@interface BEUCharacterAI : NSObject {
	//Object that owns this ai
	BEUCharacter *parent;
	
	//Object that the ai is currently targeting
	BEUCharacter *targetCharacter;
	
	//Array of move NAMES that the ai has access to
	NSMutableArray *moves;
	
	//Array of decisions, decisions then have sub decisions and so on until a actual decision is reach
	NSMutableArray *decisions;
}

@property(nonatomic,assign) BEUCharacter *parent;
@property(nonatomic,assign) BEUCharacter *targetCharacter;

-(id)initWithParent:(BEUCharacter *)parent_;

-(void)update:(ccTime)delta;

-(BEUCharacter *)findClosestEnemy;

@end
