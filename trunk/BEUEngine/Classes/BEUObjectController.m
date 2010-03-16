//
//  BEUObjectController.m
//  BEUEngine
//
//  Created by Chris Mele on 2/22/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUObjectController.h"


@implementation BEUObjectController

@synthesize objects, characters, spawners, _playerCharacter, gravity;

static BEUObjectController *_sharedController = nil;

-(id)init
{
	if( (self=[super init] )) {
		objects = [[NSMutableArray alloc] init];
		characters = [[NSMutableArray alloc] init];
		spawners = [[NSMutableArray alloc] init];
		
		
		gravity = 600.0f;
	}
	
	return self;
}

+(BEUObjectController *)sharedController
{
	if(!_sharedController)
	{
		_sharedController = [[BEUObjectController alloc] init];
	}
	
	return _sharedController;
}

-(void)setPlayerCharacter:(BEUCharacter *)character
{
	_playerCharacter = character;
	if(![characters containsObject:character]){
		[self addCharacter:character];
	}
	
}

-(BEUCharacter *)playerCharacter
{
	return _playerCharacter;
}

-(void)addObject:(BEUObject *)object
{
	[objects addObject:object];
	[[BEUEnvironment sharedEnvironment] addObject:object];
	[[BEUActionsController sharedController] addReceiver:object];
}

-(void)removeObject:(BEUObject *)object
{	
	
	[[BEUEnvironment sharedEnvironment] removeObject:object];
	[[BEUActionsController sharedController] removeReceiver:object];
	[objects removeObject:object];
	
}

-(void)addCharacter:(BEUCharacter *)character
{
	[characters addObject:character];
	[[BEUTriggerController sharedController] addListener:self 
													type:BEUTriggerKilled 
												selector:@selector(characterKilled:) 
											  fromSender:character
	 ];
	
	[self addObject:character];
}

-(void)removeCharacter:(BEUCharacter *)character
{
	
	
	[self removeObject:character];
	[characters removeObject:character];
	
	[[BEUTriggerController sharedController] removeListener:self 
													   type:BEUTriggerKilled
												   selector:@selector(characterKilled:) 
												 fromSender:character];
}
	

-(void)characterKilled:(BEUTrigger *)trigger
{
	[self removeCharacter: ((BEUCharacter *)trigger.sender)];
	//If all characters (aside from the player) added to object controller are killed fire trigger BEUTriggerAllEnemiesKilled
	int enemyCount = 0;
	for(BEUCharacter *character in characters)
	{
		if(character.enemy) enemyCount++;
	}
	NSLog(@"ENEMY COUNT: %d",enemyCount);
	if(enemyCount == 0)
	{
		NSLog(@"ALL ENEMIES KILLED");
		[[BEUTriggerController sharedController] 
		 sendTrigger:[BEUTrigger triggerWithType: BEUTriggerAllEnemiesKilled sender:self]
		 ];
	}
}


-(void)addSpawner:(BEUSpawner *)spawner
{
	[spawners addObject:spawner];
}

-(void)removeSpawner:(BEUSpawner *)spawner
{
	[spawners removeObject:spawner];
}

//MOVE ALL OBJECTS
-(void)moveObjects:(ccTime)delta
{
	
	
	
	for ( BEUObject *obj in objects )
	{
		if(obj.moveX != 0 || obj.moveY != 0 || obj.moveZ != 0 || obj.y > 0)
		{
			
			CGRect movedRect = [obj globalMoveArea];
			
			BOOL intersectsX = NO;
			BOOL intersectsZ = NO;
			
			
			//Move objects moveRect x position the moveX amount and check for collisions
			movedRect.origin.x += obj.moveX*delta;
			
			//Check tile walls in each area
			for(BEUArea *area in [[BEUEnvironment sharedEnvironment] areas])
			{
				if( (intersectsX = [area doesRectCollideWithTilesWalls:movedRect]) ) break;
			}
			
			//If there is no intersection in tile walls check each object that has isWall as YES
			if(!intersectsX)
			{
				if(obj.isWall)
				{
					
					for(BEUObject *object in objects)
					{
						if( (object != obj) && (object.isWall) ) 
							if( (intersectsX = CGRectIntersectsRect([object globalMoveArea], movedRect)) ) break;
					}
					
				}
			}
			
			//If object collides with wall after moving movedRect do not change objects x value
			if(!intersectsX) obj.x += obj.moveX*delta;
			else movedRect.origin.x -= obj.moveX*delta;
			
			//Move objects movedRect the moveZ amount and check collisions
			movedRect.origin.y += obj.moveZ*delta;
			
			for(BEUArea *area in [[BEUEnvironment sharedEnvironment] areas])
			{
				if( (intersectsZ = [area doesRectCollideWithTilesWalls:movedRect]) ) break;
			}
			
			
			//If there is no intersection in tile walls ehck each object that has isWall as YES
			if(!intersectsZ){
				if(obj.isWall)
				{
					for(BEUObject *object in objects)
					{
						if( (object != obj) && (object.isWall)) 
							if( (intersectsZ = CGRectIntersectsRect([object globalMoveArea], movedRect)) ) break;
					}
				}
			}
					
			
			//If object collides with wall after moving movedRect do not change objects z value
			if(!intersectsZ) obj.z += obj.moveZ*delta;
			else movedRect.origin.y -= obj.moveZ*delta;
			
			//Move objects y value the moveY amount, no collision checking on the y axis
			
			obj.y += obj.moveY*delta;
			
			if(obj.y <= 0)
			{
				obj.y = 0;
				obj.moveY = 0;
			} else {
				if(obj.affectedByGravity) obj.moveY -= gravity*delta;
			}
			
			if(obj.y == 0)
			{
				if(obj.moveX < 0)
				{
					obj.moveX += obj.friction*delta;
					if(obj.moveX > 0) obj.moveX = 0;
				} else if(obj.moveX > 0) 
				{
					obj.moveX -= obj.friction*delta;
					if(obj.moveX < 0) obj.moveX = 0;
				}
				
				if(obj.moveZ < 0)
				{
					obj.moveZ += obj.friction*delta;
					if(obj.moveZ > 0) obj.moveZ = 0;
				} else if(obj.moveZ > 0) 
				{
					obj.moveZ -= obj.friction*delta;
					if(obj.moveZ < 0) obj.moveZ = 0;
				}
			}
			
		}
		
		//Set objects x and y positions with x,y and z properties
		obj.position = ccp(obj.x, obj.z + obj.y);
		
	}
}


-(void)updateSpawners:(ccTime)delta
{
	for(BEUSpawner *spawner in spawners)
	{
		[spawner update:delta];
	}
}

-(void)step:(ccTime)delta
{
	for(BEUObject *obj in objects)
	{
		[obj step:delta];
	}
	
	
	[self moveObjects:delta];
	[self updateSpawners:delta];
}

-(void)dealloc
{
	_playerCharacter = nil;
	_sharedController = nil;
	
	[objects release];
	[characters release];
	[spawners release];
	
	[super dealloc];
}

@end
