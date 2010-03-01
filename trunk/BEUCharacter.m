//
//  BEUCharacter.m
//  BEUEngine
//
//  Created by Chris Mele on 2/17/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUCharacter.h"

@implementation BEUCharacter

@synthesize life, body, canMove, movesController, currentMove;


-(id)init 
{
	[super init];
	
	movementSpeed = 2;
	
	body = [[CCSprite alloc] init];
	body.anchorPoint = ccp(0.5f,0.0f);
	[self addChild:body];
	// loads the sprite frames from a Zwoptex generated file
	[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"TestCharacter.plist"];
	
	NSMutableArray *animFrames = [NSMutableArray array];
	for(int i = 1; i <= 15; i++) {
		CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"TestCharacter%04d.png",i]];
		[animFrames addObject:frame];
		
	}
	
	CCAnimation *walkingAnimation = [CCAnimation animationWithName:@"walk" delay:0.1f frames:animFrames];	
	//[body addAnimation:animation];
	
	
	NSMutableArray *standingStillFrames = [NSMutableArray array];
	[standingStillFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"TestCharacter0003.png"]];
	 
	CCAnimation *standingStillAnimation = [CCAnimation animationWithName:@"stand" delay: 1.0f frames:standingStillFrames];
	
	NSMutableArray *punchFrames = [NSMutableArray array];
	for(int i=22; i<=27; i++){
		CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"TestCharacter%04d.png", i]];
		[punchFrames addObject:frame];
	}
	
	CCAnimation *punchAnimation = [CCAnimation animationWithName:@"punch" delay:0.05f frames:punchFrames];
	
	
	NSMutableArray *punch2Frames = [NSMutableArray array];
	for(int i=36;i<41;i++)
	{
		CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"TestCharacter%04d.png", i]];
		[punch2Frames addObject:frame];
	}
	CCAnimation *punch2Animation = [CCAnimation animationWithName:@"punch2" delay:0.05f frames: punch2Frames];
	
	
	NSMutableArray *hitFrames = [NSMutableArray array];
	for(int i=27; i<=35; i++){
		CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"TestCharacter%04d.png", i]];
		[hitFrames addObject:frame];
	}
	CCAnimation *hitAnimation = [CCAnimation animationWithName:@"hit" delay:0.05f frames:hitFrames];
	
	[body addAnimation:hitAnimation];
	[body addAnimation:punchAnimation];
	[body addAnimation:punch2Animation];
	[body addAnimation:standingStillAnimation];
	[body addAnimation:walkingAnimation];

	
	[self standStill];
	
	body.position = ccp(47.0f,0.0f);
	
	self.anchorPoint = ccp(0.0f, 0.0f);
	
	self.hitArea = CGRectMake(25, 0, 50, 70);
	self.moveArea = CGRectMake(25, 0, 50, 25);
	
	canMove = YES;
	
	
	
	//Moves
	
	movesController = [[BEUMovesController alloc] init];
	
	BEUMove *move1 = [[BEUMove alloc] initWithCharacter:self 
											   sequence:[NSArray arrayWithObjects:BEUInputTap,nil]
											   selector: @selector(punch:)];
	
	BEUMove *move2 = [[BEUMove alloc] initWithCharacter:self 
											   sequence:[NSArray arrayWithObjects:BEUInputTap,BEUInputSwipeRight, nil]
											   selector: @selector(punch2:)];
	
	BEUMove *move3 = [[BEUMove alloc] initWithCharacter:self 
											   sequence:[NSArray arrayWithObjects:BEUInputTap,BEUInputSwipeRight, BEUInputTap, nil]
											   selector: @selector(punch2:)];
	
	BEUMove *move4 = [[BEUMove alloc] initWithCharacter:self 
											   sequence:[NSArray arrayWithObjects:BEUInputTap,BEUInputSwipeRight, BEUInputTap, BEUInputSwipeLeft, nil]
											   selector: @selector(punch:)];
	
	[movesController addMove:move1];
	[movesController addMove:move2];
	[movesController addMove:move3];
	[movesController addMove:move4];
	
	return self;
}

-(void)moveCharacterWithAngle:(float)angle percent:(float)percent 
{
	
	//C
	if(canMove)
	{
		double moveSpeed = movementSpeed*percent * [[CCScheduler sharedScheduler] timeScale];
		moveX = cos(angle)*moveSpeed;
		moveZ = sin(angle)*moveSpeed;
		
		
		if(moveX < 0){
			[self moveLeft];
		} else if(moveX > 0){
			[self moveRight];
		} else {
			[self standStill];
		}
	} else {
		moveX = moveZ = 0.0f;
	}
	
	
}

-(void)moveLeft
{
	if(currentAnimation != @"moveLeft"){
		currentAnimation = @"moveLeft";
		//NSLog(@"MOVE LEFT");
		body.scaleX = -1;
		
	
		[body stopAllActions];
		[body runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithAnimation:[body animationByName:@"walk"] restoreOriginalFrame:NO] ]];

	}
}

-(void)moveRight
{
	if(currentAnimation != @"moveRight"){
		currentAnimation = @"moveRight";
		//NSLog(@"MOVE RIGHT");
		
		body.scaleX = 1;
	
		[body stopAllActions];
		[body runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithAnimation:[body animationByName:@"walk"] restoreOriginalFrame:NO] ]];
	}
}

-(void)standStill
{
	if(currentAnimation != @"stand"){
		currentAnimation = @"stand";
		//NSLog(@"STAND STILL");
		[body stopAllActions];
		[body runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithAnimation:[body animationByName:@"stand"] restoreOriginalFrame:NO] ]];
	}
}

-(void)punch: (BEUMove *)move
{
	
	currentMove = move;
	
	if(currentAnimation != @"punch")
	{
		currentAnimation = @"punch";
		//NSLog(@"PUNCH");
		canMove = NO;
		
		[body stopAllActions];
		[body runAction: 
		 [CCSequence actions:[CCAnimate actionWithAnimation:[body animationByName:@"punch"] restoreOriginalFrame:YES],
		  [CCCallFunc actionWithTarget:self selector:@selector(punchComplete)],
							 nil]
		 ];
		[body runAction:
		 [CCSequence actions:[CCDelayTime actionWithDuration:0.05f],
		  [CCCallFunc actionWithTarget:self	selector:@selector(sendPunch)],
		 nil]
		 ];
		
	}	
}

-(void)punch2: (BEUMove *)move
{
	currentMove = move;
	
	if(currentAnimation != @"punch2")
	{
		currentAnimation = @"punch2";
		//NSLog(@"PUNCH");
		canMove = NO;
		
		[body stopAllActions];
		[body runAction: 
		 [CCSequence actions:[CCAnimate actionWithAnimation:[body animationByName:@"punch2"] restoreOriginalFrame:YES],
		  [CCCallFunc actionWithTarget:self selector:@selector(punchComplete)],
		  nil]
		 ];
		[body runAction:
		 [CCSequence actions:[CCDelayTime actionWithDuration:0.05f],
		  [CCCallFunc actionWithTarget:self	selector:@selector(sendPunch)],
		  nil]
		 ];
		
	}
}

-(void)sendPunch
{
	CGRect punchHit = CGRectMake(self.xPos + self.hitArea.origin.x, 
								 self.yPos + self.hitArea.origin.y, 
								 self.hitArea.size.width + 40, 
								 self.hitArea.size.height);
	CGRect punchDepth = CGRectMake(self.xPos + self.moveArea.origin.x,
								   self.zPos + self.moveArea.origin.y - 10,
								   self.moveArea.size.width + 20,
								   self.moveArea.size.height + 20);
	
	BEUAction *punchToSend = [[BEUHitAction alloc] initWithSender:self 
														 selector:@selector(receiveHit:)duration:1 
														  hitArea: punchHit 
														 hitDepth: punchDepth 
															power: 1];
	[[BEUActionsController sharedController] addAction:punchToSend];
}
		 
-(void)punchComplete
{
	//NSLog(@"makeMoveable");
	canMove = YES;
	[currentMove completeMove];
	
	[self standStill];
	
	
}

-(void)hit
{
	currentAnimation = @"hit";
	[body stopAllActions];
	
	canMove = NO;
	
	[body runAction:
	 [CCSequence actions:
	  [CCAnimate actionWithAnimation:[body animationByName:@"hit"] restoreOriginalFrame: YES],
	  [CCCallFunc actionWithTarget:self selector:@selector(hitComplete)],
	  nil]
	 ];
				
}

-(void)hitComplete
{
	canMove = YES;
	[self standStill];
}

-(void)step:(ccTime)delta
{
	[super step:delta];
}

-(void)draw
{
	[super draw];
	[self drawRect:moveArea];
	[self drawRect:hitArea];

}

-(void)receiveInput:(BEUInputEvent *)event
{
	
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
		[movesController sendInput:event];
	}

			
	if(event.type == BEUInputTap)
	{
		//[self punch];
		//[event release];
	}
}

-(BOOL)receiveHit:(BEUAction *)action
{
	if(action.sender != self)
	{
		[self hit];
		return YES;
	}
	
	return NO;
}


-(void) drawRect:(CGRect)rect
{
	ccDrawLine(ccp(rect.origin.x, rect.origin.y), ccp(rect.origin.x + rect.size.width, rect.origin.y));
	ccDrawLine(ccp(rect.origin.x + rect.size.width, rect.origin.y), ccp(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height));
	ccDrawLine(ccp(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height), ccp(rect.origin.x, rect.origin.y + rect.size.height));
	ccDrawLine(ccp(rect.origin.x, rect.origin.y + rect.size.height), ccp(rect.origin.x, rect.origin.y));
}


@end
