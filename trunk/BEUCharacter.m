//
//  BEUCharacter.m
//  BEUEngine
//
//  Created by Chris Mele on 2/17/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUCharacter.h"

@implementation BEUCharacter

@synthesize life, body, canMove;




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
	for(int i = 0; i < 15; i++) {
		CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"TestCharacter%d.png",(i+1)]];
		[animFrames addObject:frame];
		
	}
	
	CCAnimation *walkingAnimation = [CCAnimation animationWithName:@"walk" delay:0.1f frames:animFrames];	
	//[body addAnimation:animation];
	
	
	NSMutableArray *standingStillFrames = [NSMutableArray array];
	[standingStillFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"TestCharacter3.png"]];
	 
	CCAnimation *standingStillAnimation = [CCAnimation animationWithName:@"stand" delay: 1.0f frames:standingStillFrames];
	
	NSMutableArray *punchFrames = [NSMutableArray array];
	for(int i=22; i<27; i++){
		CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"TestCharacter%d.png", (i+1)]];
		[punchFrames addObject:frame];
	}
	
	CCAnimation *punchAnimation = [CCAnimation animationWithName:@"punch" delay:0.05f frames:punchFrames];
	
	[body addAnimation:punchAnimation];
	[body addAnimation:standingStillAnimation];
	[body addAnimation:walkingAnimation];

	
	[self standStill];
	
	body.position = ccp(47.0f,0.0f);
	
	self.anchorPoint = ccp(0.0f, 0.0f);
	
	self.hitArea = CGRectMake(0, 0, 30, 60);
	self.moveArea = CGRectMake(30, 0, 40, 20);
	
	canMove = YES;
	
	return self;
}

-(void)moveCharacterWithAngle:(float)angle percent:(float)percent 
{
	
	//C
	if(canMove)
	{
		double moveSpeed = movementSpeed*percent;
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

-(void)punch
{
	if(currentAnimation != @"punch")
	{
		currentAnimation = @"punch";
		//NSLog(@"PUNCH");
		canMove = NO;
		
		[body stopAllActions];
		[body runAction: 
		 [CCSequence actions:[CCAnimate actionWithAnimation:[body animationByName:@"punch"] restoreOriginalFrame:NO],
							 [CCCallFunc actionWithTarget:self selector:@selector(punchComplete)],
							 nil]
		 ];
		
	}	
}
		 
-(void)punchComplete
{
	//NSLog(@"makeMoveable");
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
	}
			
	if(event.type == BEUInputTap)
	{
		[self punch];
		[event release];
	}
}

-(void) drawRect:(CGRect)rect
{
	ccDrawLine(ccp(rect.origin.x, rect.origin.y), ccp(rect.origin.x + rect.size.width, rect.origin.y));
	ccDrawLine(ccp(rect.origin.x + rect.size.width, rect.origin.y), ccp(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height));
	ccDrawLine(ccp(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height), ccp(rect.origin.x, rect.origin.y + rect.size.height));
	ccDrawLine(ccp(rect.origin.x, rect.origin.y + rect.size.height), ccp(rect.origin.x, rect.origin.y));
}


@end
