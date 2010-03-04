//
//  BEUCharacter.m
//  BEUEngine
//
//  Created by Chris Mele on 2/17/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUCharacter.h"

@implementation BEUCharacter

@synthesize life, canMove, movesController, currentMove;

-(id)init
{
	if( (self = [super init]) )
	{
		life = 100.0f;
		movementSpeed = 100.0f; //100 pixels per second
		
		canMove = YES;
		
		//Create moves controller for character, make sure and store all moves for the character in here.
		//Inputs will automatically be sent into the controller
		movesController = [[BEUMovesController alloc] init];
	}
	
	return self;
}

-(void)moveCharacterWithAngle:(float)angle percent:(float)percent 
{
	//If the character can move, set moveX and moveZ
	if(canMove)
	{
		double moveSpeed = movementSpeed*percent;
		moveX = cos(angle)*moveSpeed;
		moveZ = sin(angle)*moveSpeed;
		
	} else {
		moveX = moveZ = 0.0f;
	}
	
	
}

-(void)receiveInput:(BEUInputEvent *)event
{
	//Check if input event is a movement event, if not send event to the movesController
	if(event.type == BEUInputMovement)
	{
		
		BEUInputMovementEvent *moveEvent = (BEUInputMovementEvent *)event;
		
		[self moveCharacterWithAngle: moveEvent.movementTheta percent:moveEvent.movementPercent];
		
		//Release the event when its completed, do not release until then so 
		//BEUInputLayer can continue to modify the theta and percent values of it
		if(event.completed){
			[event release];
		}
	} else {
		
		//Send input to the movesController
		[movesController sendInput:event];
	}
}

-(void)kill
{
	[[BEUTriggerController sharedController] sendTrigger:
	 [[BEUTrigger alloc] initWithType:BEUTriggerKilled sender:self]
	 ];
}

-(void)dealloc
{
	currentMove = nil;
	[movesController release];
	
	[super dealloc];
}


@end
