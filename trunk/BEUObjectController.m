//
//  BEUObjectController.m
//  BEUEngine
//
//  Created by Chris Mele on 2/22/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUObjectController.h"


@implementation BEUObjectController

@synthesize objects, characters;

static BEUObjectController *_sharedController = nil;

-(id)init
{
	if( (self=[super init] )) {
		objects = [[NSMutableArray alloc] init];
		characters = [[NSMutableArray alloc] init];
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
}

-(void)removeObject:(BEUObject *)object
{	
	[objects removeObject:object];
	[[BEUEnvironment sharedEnvironment] removeObject:object];
}

-(void)addCharacter:(BEUCharacter *)character
{
	[characters addObject:character];
	[self addObject:character];
}

-(void)removeCharacter:(BEUCharacter *)character
{
	[characters removeObject:character];
	[self removeObject:character];
}
	 

//MOVE ALL OBJECTS
-(void)moveObjects
{
	
	//NSLog(@"MOVE OBJECTS:%@",objects);
	
	for ( BEUObject *obj in objects )
	{
		if(obj.moveX != 0 || obj.moveY != 0 || obj.moveZ != 0)
		{
			CGRect movedRect = CGRectMake(obj.x + obj.moveArea.origin.x, 
										  obj.z + obj.moveArea.origin.y,
										  obj.moveArea.size.width, 
										  obj.moveArea.size.height);
			
			BOOL intersectsX = NO;
			BOOL intersectsZ = NO;
			
			
			//Move objects moveRect x position the moveX amount and check for collisions
			movedRect.origin.x += obj.moveX;
			
			for(BEUArea *area in [[BEUEnvironment sharedEnvironment] areas])
			{
				if( (intersectsX = [area doesRectCollideWithTilesWalls:movedRect]) ) break;
			}
			//If object collides with wall after moving movedRect do not change objects x value
			if(!intersectsX) obj.x += obj.moveX;
			else movedRect.origin.x -= obj.moveX;
			
			//Move objects movedRect the moveZ amount and check collisions
			movedRect.origin.y += obj.moveZ;
			
			for(BEUArea *area in [[BEUEnvironment sharedEnvironment] areas])
			{
				if( (intersectsZ = [area doesRectCollideWithTilesWalls:movedRect]) ) break;
			}
			//If object collides with wall after moving movedRect do not change objects z value
			if(!intersectsZ) obj.z += obj.moveZ;
			else movedRect.origin.y -= obj.moveZ;
			
			//Move objects y value the moveY amount, no collision checking on the y axis
			obj.y += obj.moveY;
			
			//Set objects x and y positions with x,y and z properties
			obj.position = ccp(obj.x, obj.z);// + obj.y);
			
			//Reset objects move values
			obj.moveX = obj.moveY = obj.moveZ = 0;
		}
	}
}

-(void)step:(ccTime)delta
{
	for(BEUObject *obj in objects)
	{
		[obj step:delta];
	}
	
	[self moveObjects];
}



-(void)dealloc
{
	_playerCharacter = nil;
	_sharedController = nil;
	
	[objects release];
	[characters release];
	[super dealloc];
}

@end
