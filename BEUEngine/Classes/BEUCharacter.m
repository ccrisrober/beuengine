//
//  BEUCharacter.m
//  BEUEngine
//
//  Created by Chris Mele on 2/17/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUCharacter.h"

@implementation BEUCharacter

@synthesize life,canMove,movesController,currentMove,enemy,ai,updateSelectors,state,orientToObject,movingAngle,movingPercent;

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
		float moveSpeed = movementSpeed*percent;
		float newMoveX = cos(angle)*moveSpeed;
		if(newMoveX > 0)
		{
			[self setFacingRight:YES];
		} else if(newMoveX < 0)
		{
			[self setFacingRight:NO];
		}
		[self applyForceX: newMoveX];
		[self applyForceZ: sin(angle)*moveSpeed*.5];
		
	}
	
	
}

-(BOOL)receiveHit:(BEUAction *)action
{
	
	BEUCharacter *sender = (BEUCharacter *)action.sender;
	BEUHitAction *hit = ((BEUHitAction *)action);
	
	//Make sure the sender is not self, and make sure its an enemy
	if(sender != self && sender.enemy != self.enemy)
	{
		//Check if a move is currently being run
		if(movesController.currentMove)
		{
			//If a move is being run and the move cannot be interrupted, exit the hit
			if(!movesController.currentMove.interruptible)
			{
				//Hit was not received
				return NO;
			} else {
				[movesController.currentMove cancelMove];
			}
		}
		
		
		
		//Apply x and z forces of the move to the character
		moveX = hit.xForce;
		moveZ = hit.zForce;
		
		//If character is blocking, return 
		if(state != BEUCharacterStateBlocking)
		{
			
			//If the character is AI Controlled, cancel the current behavior
			if(ai)
			{
				[ai cancelCurrentBehavior];
			}
			
			[self hit:action];
			moveY = hit.yForce;
			life -= hit.power;	
			
			if(life <= 0) [self death:action];
		}
		
		//Hit was successfully received
		return YES;
		
	} else {
		//Hit was not received
		return NO;
	}
}

-(void)hit:(BEUAction *)action
{
	//Override me and place hit animations and character specific actions here
}

-(void)walk
{
	//Override me with walk animation here
}

-(void)idle
{
	//Override me with idle animation here
}

-(void)receiveInput:(BEUInputEvent *)event
{
	//Check if input event is a movement event, if not send event to the movesController
	
	if(event.type == BEUInputJoystickMove && event.sender.tag == 0)
	{
		BEUInputMovementEvent *moveEvent = (BEUInputMovementEvent *)event;
		movingAngle	= moveEvent.angle;
		movingPercent = moveEvent.percent;
		//[self moveCharacterWithAngle:moveEvent.angle percent:moveEvent.percent];		
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

-(void)death:(BEUAction *)action
{
	[self kill];
}

-(void)kill
{
	[[BEUTriggerController sharedController] sendTrigger:
	 [BEUTrigger triggerWithType:BEUTriggerKilled sender:self]
	 ];
}

-(BOOL)pickUpItem:(BEUObject *)item
{
	return NO;
}

-(void)step:(ccTime)delta
{
	
	
	if(canMove)
	{
		
		[self moveCharacterWithAngle:movingAngle percent:movingPercent];
		
		if(fabsf(movingPercent) > 0)
		{
			[self walk];
		} else {
			[self idle];
		}
		
		if(orientToObject)
		{
			if(orientToObject.x < self.x){
				[self setFacingRight:NO];
			} else {
				[self setFacingRight:YES];
			}
		}
	}
	
	if(ai){
		[self.ai update:delta];
	}
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
