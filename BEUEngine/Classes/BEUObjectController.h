//
//  BEUObjectController.h
//  BEUEngine
//
//  Created by Chris Mele on 2/22/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUObject.h"
#import "BEUCharacter.h"
#import "BEUEnvironment.h"
#import "BEUActionsController.h"
#import "BEUTriggerController.h"
#import "BEUTrigger.h"
#import "BEUSpawner.h"

@class BEUEnvironment;
@class BEUObject;
@class BEUCharacter;
@class BEUSpawner;

@interface BEUObjectController : NSObject {
	NSMutableArray *characters;
	NSMutableArray *objects;
	NSMutableArray *items;
	NSMutableArray *spawners;
	
	
	BEUCharacter *_playerCharacter;
	
	float gravity;
}

@property(nonatomic,retain) NSMutableArray *objects;
@property(nonatomic,retain) NSMutableArray *items;
@property(nonatomic,retain) NSMutableArray *characters;
@property(nonatomic,retain) NSMutableArray *spawners;
@property(nonatomic,assign) BEUCharacter *_playerCharacter;

@property(nonatomic) float gravity;

+(BEUObjectController *)sharedController;


//Function to add and remove BEUObjects to the environment, all objects added
//should be added/removed here
-(void)addObject:(BEUObject *)object;
-(void)removeObject:(BEUObject *)object;

//Function to add/remove items that characters can pick up
-(void)addItem:(BEUObject *)item;
-(void)removeItem:(BEUObject *)item;

//Function to add/remove characters
-(void)addCharacter:(BEUCharacter *)character;
-(void)removeCharacter:(BEUCharacter *)character;

-(void)setPlayerCharacter:(BEUCharacter *)character;
-(BEUCharacter *)playerCharacter;

//Add/remove spawners
-(void)addSpawner:(BEUSpawner *)spawner;
-(void)removeSpawner:(BEUSpawner *)spawner;

-(void)moveObjects:(ccTime)delta;
-(void)checkItems:(ccTime)delta;
-(void)updateSpawners:(ccTime)delta;
-(void)step:(ccTime)delta;

@end
