//
//  BEUSpawner.m
//  BEUEngine
//
//  Created by Chris Mele on 3/9/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUSpawner.h"


@implementation BEUSpawner

@synthesize spawnArea,types,running,timeBetweenSpawns,maximumSpawnableAtOnce;

-(id)initWithSpawnArea:(CGRect)area types:(NSMutableSet *)types_ numberToSpawn:(int)toSpawn_
{
	if( (self = [super init]) )
	{
		spawnArea = area;
		types = [types_ retain];
		spawnsLeft = toSpawn_;
		running = NO;
		maximumSpawnableAtOnce = 3;
		timeBetweenSpawns = 1;
		timeSinceLastSpawn = 0;
		currentlySpawned = 0;
	}
	
	return self;
}

+(id)spawnerWithArea:(CGRect)area types:(NSMutableSet *)types_ numberToSpawn:(int)toSpawn_
{
	return [[[self alloc] initWithSpawnArea:area types:types_ numberToSpawn:toSpawn_] autorelease];
}

-(void)start
{
	running = YES;
}

-(void)spawn
{
	Class spawnClass = [types anyObject];
	BEUCharacter *newCharacter = [[spawnClass alloc] init];
	[[BEUTriggerController sharedController] addListener:self 
													type:BEUTriggerKilled 
												selector:@selector(characterKilled:) 
											  fromSender:newCharacter];
	
	newCharacter.x = spawnArea.origin.x + spawnArea.size.width*[BEUMath random];
	newCharacter.z = spawnArea.origin.y + spawnArea.size.height*[BEUMath random];
	newCharacter.enemy = YES;
	[[BEUObjectController sharedController] addCharacter:newCharacter];

	currentlySpawned++;
	spawnsLeft--;
	timeSinceLastSpawn = 0;
}

-(void)characterKilled:(BEUTrigger *)trigger
{
	currentlySpawned--;
	[[BEUTriggerController sharedController] removeListener:self 
													   type:BEUTriggerKilled 
												   selector:@selector(characterKilled:) 
												 fromSender:[trigger sender]];
		
}

-(void)complete
{
	running = NO;
	
}

-(void)update:(ccTime)delta
{
	timeSinceLastSpawn += delta;
	
	if(running)
	{
		if(timeSinceLastSpawn > timeBetweenSpawns 
		   && currentlySpawned < maximumSpawnableAtOnce
		   && spawnsLeft > 0)
		{
			[self spawn];
		} else if(spawnsLeft == 0)
		{
			[self complete];
		}
	}
}

-(void)dealloc
{
	[types release];
	
	[super dealloc];
}

@end
