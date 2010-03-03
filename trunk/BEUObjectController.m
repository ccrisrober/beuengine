//
//  BEUObjectController.m
//  BEUEngine
//
//  Created by Chris Mele on 2/22/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUObjectController.h"


@implementation BEUObjectController

@synthesize objects, characters, _playerCharacter, gravity;

static BEUObjectController *_sharedController = nil;

-(id)init
{
	if( (self=[super init] )) {
		objects = [[NSMutableArray alloc] init];
		characters = [[NSMutableArray alloc] init];
		gravity = 10.0f;
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
	[objects removeObject:object];
	[[BEUEnvironment sharedEnvironment] removeObject:object];
	[[BEUActionsController sharedController] removeReceiver:object];
}

-(void)addCharacter:(BEUCharacter *)character
{
	[characters addObject:character];
	[[BEUTriggerController sharedController] addListener:self 
													type:BEUTriggerKilled 
												selector:@selector(characterKilled:)
	 ];
	
	[self addObject:character];
}

-(void)removeCharacter:(BEUCharacter *)character
{
	[characters removeObject:character];
	[[BEUTriggerController sharedController] removeListener:self 
													   type:BEUTriggerKilled
												   selector:@selector(characterKilled:) 
												 fromSender:character];
	[self removeObject:character];
}
	

-(void)characterKilled:(BEUTrigger *)trigger
{
	[self removeCharacter: ((BEUCharacter *)trigger.sender)];
}

//MOVE ALL OBJECTS
-(void)moveObjects:(ccTime)delta
{
	
	//NSLog(@"MOVE OBJECTS:%@",objects);
	
	for ( BEUObject *obj in objects )
	{
		if(obj.moveX != 0 || obj.moveY != 0 || obj.moveZ != 0)
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
				for(BEUObject *object in objects)
				{
					if( (object != obj) && (object.isWall) ) 
						if( (intersectsX = CGRectIntersectsRect([object globalMoveArea], movedRect)) ) break;
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
				for(BEUObject *object in objects)
				{
					if( (object != obj) && (object.isWall) ) 
						if( (intersectsZ = CGRectIntersectsRect([object globalMoveArea], movedRect)) ) break;
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
				if(obj.affectedByGravity) obj.moveY -= gravity;
			}
			
			
		}
		
		//Set objects x and y positions with x,y and z properties
		obj.position = ccp(obj.x, obj.z + obj.y);
		
	}
}

-(void)step:(ccTime)delta
{
	for(BEUObject *obj in objects)
	{
		[obj step:delta];
	}
	
	[self moveObjects:delta];
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
