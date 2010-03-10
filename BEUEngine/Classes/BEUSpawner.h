//
//  BEUSpawner.h
//  BEUEngine
//
//  Created by Chris Mele on 3/9/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "cocos2d.h"
#import "BEUObjectController.h"
#import "BEUCharacter.h"
#import "BEUTrigger.h"
#import "BEUTriggerController.h"
#import "BEUMath.h"

@class BEUObjectController;
@class BEUCharacter;
@class BEUTrigger;
@class BEUTriggerController;

@interface BEUSpawner : NSObject {
	
	//Rectanglar area to spawn from on map
	CGRect spawnArea;
	
	//Class types that the spawner will spawn, must be subclass of BEUCharacter
	NSMutableSet *types;
	
	
	//Is spawner running
	BOOL running;
	
	//Number of spawns left in spawner
	int spawnsLeft;
	
	//Minimum time between spawnings, if set to 0, spawner will spawn maximum allowable at once
	float timeBetweenSpawns;
	
	//Maximum amount of characters the spawner can spawn at once.   The characters spawned must 
	//be killed to allow more to spawn
	int maximumSpawnableAtOnce;
	
	//Number of currently spawned characters, should decrement when killed
	int currentlySpawned;
	
	//Time of last spawn
	float timeSinceLastSpawn;
	
}

@property(nonatomic,assign) CGRect spawnArea;
@property(nonatomic,retain) NSMutableSet *types;
@property(nonatomic,readonly) BOOL running;
@property(nonatomic,assign) float timeBetweenSpawns;
@property(nonatomic,assign) int maximumSpawnableAtOnce;

-(id)initWithSpawnArea:(CGRect)area types:(NSMutableSet *)types_ numberToSpawn:(int)toSpawn_;

+(id)spawnerWithArea:(CGRect)area types:(NSMutableSet *)types_ numberToSpawn:(int)toSpawn_;

-(void)start;
-(void)spawn;
-(void)characterKilled:(BEUTrigger *)trigger;
-(void)complete;
-(void)update:(ccTime)delta;

@end
