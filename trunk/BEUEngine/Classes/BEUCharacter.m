//
//  BEUCharacter.m
//  BEUEngine
//
//  Created by Chris Mele on 2/17/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUCharacter.h"

@implementation BEUCharacter

@synthesize life,canMove,movesController,currentMove,enemy,ai,updateSelectors,state,orientToObject;

NSString *const BEUCharacterStateIdle = @"idle";
NSString *const BEUCharacterStateMoving = @"moving";
NSString *const BEUCharacterStateBlocking = @"blocking";
NSString *const BEUCharacterStateAttacking = @"attacking";

-(id)init
{
	if( (self = [super init]) )
	{
		life = 100.0f;
		movementSpeed = 100.0f; //100 pixels per second
		
		canMove = YES;
		enemy = YES;
		//Create moves controller for character, make sure and store all moves for the character in here.
		//Inputs will automatically be sent into the controller
		movesController = [[BEUMovesController alloc] init];
		updateSelectors = [NSMutableArray array];
		state = BEUCharacterStateIdle;
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
		if(!orientToObject)
		{
			if(moveX > 0)
			{
				[self setFacingRight:YES];
			} else if(moveX < 0)
			{
				[self setFacingRight:NO];
			}
		} else {
			if(orientToObject.x < self.x){
				[self setFacingRight:NO];
			} else {
				[self setFacingRight:YES];
			}
		}
		
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
			//[event release];
		}
	} else {
		
		//Send input to the movesController
		//Check if input is swipeleft or swiperight, if so convert to forward and back based on orientation
		if(event.type == BEUInputSwipeLeft)
		{
			event.type = (NSString *)(self.facingRight ? BEUInputSwipeBack : BEUInputSwipeForward);
		} else if(event.type == BEUInputSwipeRight)
		{
			event.type = (NSString *)(self.facingRight ? BEUInputSwipeForward : BEUInputSwipeBack);
		}
		
		[movesController sendInput:event];
	}
}

-(void)kill
{
	[[BEUTriggerController sharedController] sendTrigger:
	 [BEUTrigger triggerWithType:BEUTriggerKilled sender:self]
	 ];
}

-(void)step:(ccTime)delta
{
	
	if(ai)[self.ai update:delta];
	
	[super step:delta];
}

-(BEUCharacterAI *)ai
{
	return ai;
}

-(void)setAi:(BEUCharacterAI *)ai_
{
	ai = ai_;
}

-(void)dealloc
{
	currentMove = nil;
	orientToObject = nil;
	
	[state release];
	[ai release];
	[movesController release];
	
	[super dealloc];
}


@end
