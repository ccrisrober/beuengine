//
//  BEUTestCharacter.m
//  BEUEngine
//
//  Created by Chris on 3/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BEUTestCharacter.h"


@implementation BEUTestCharacter

@synthesize body;

float friction = 0.0f;
float gravity = 5.0f;

-(id)init 
{
	[super init];
	
	movementSpeed = 100.0f; //30 pixels per second;
	life = 100;
	
	drawBoundingBoxes = YES;
	
	
	
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
	
	
	
	NSMutableArray *deathFrames = [NSMutableArray array];
	for(int i=42; i<=49; i++)
	{
		CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"TestCharacter%04d.png",i]];
		[deathFrames addObject:frame];
	}
	
	CCAnimation *deathAnimation = [CCAnimation animationWithName:@"death" delay:0.05f frames:deathFrames];
	
	
	[body addAnimation:hitAnimation];
	[body addAnimation:punchAnimation];
	[body addAnimation:punch2Animation];
	[body addAnimation:standingStillAnimation];
	[body addAnimation:walkingAnimation];
	[body addAnimation:deathAnimation];
	
	[self standStill];
	
	body.position = ccp(0.0f,0.0f);
	
	//self.anchorPoint = ccp(0.0f, 0.0f);
	
	self.hitArea = CGRectMake(-25, 0, 50, 70);
	self.moveArea = CGRectMake(-15, 0, 30, 25);
	
	canMove = YES;
	
	
	
	//Moves
	
	BEUMove *move1 = [BEUMove moveWithName:@"punch1" 
								 character:self 
								  sequence:[[NSArray alloc] initWithObjects:BEUInputTap,nil]			  
								  selector: @selector(punch:)];
	
	BEUMove *move2 = [BEUMove moveWithName:@"punchCombo1" 
								 character:self 
								  sequence:[[NSArray alloc] initWithObjects:BEUInputTap,BEUInputSwipeForward, nil]
								  selector: @selector(punch2:)];
	
	BEUMove *move3 = [BEUMove moveWithName:@"punchCombo2"
								 character:self 
								  sequence:[[NSArray alloc] initWithObjects:BEUInputTap,BEUInputSwipeForward, BEUInputTap, nil]
								  selector: @selector(punch2:)];

	BEUMove *move4 = [BEUMove moveWithName:@"punchCombo3" 
								 character:self 
								  sequence:[[NSArray alloc] initWithObjects:BEUInputTap,BEUInputSwipeForward, BEUInputTap, BEUInputSwipeBack, nil]
								  selector: @selector(punch:)];
	
	
	BEUMove *uppercut = [BEUMove moveWithName:@"uppercut"
									character:self	
									 sequence:[[NSArray alloc] initWithObjects:BEUInputSwipeUp, nil]
									 selector:@selector(punch2:)];
	
	[movesController addMove:move1];
	[movesController addMove:move2];
	[movesController addMove:move3];
	[movesController addMove:move4];
	[movesController addMove:uppercut];
	
	return self;
}

-(void)setEnemy:(BOOL)enemy_
{
	enemy = enemy_;
	
	if(enemy){
		ai = [[BEUCharacterAI alloc] initWithParent:self];
		//ai.moves = [[NSMutableArray alloc] initWithObjects: @"punch1",@"uppercut"];
	}
}

-(void)moveCharacterWithAngle:(float)angle percent:(float)percent 
{
	
	[super moveCharacterWithAngle:angle	percent:percent];
	
	if(canMove)
	{
		if(moveX < 0){
			[self moveLeft];
		} else if(moveX > 0){
			[self moveRight];
		} else {
			[self standStill];
		}
	}

}


-(void)moveLeft
{
	if(currentAnimation != @"moveLeft"){
		currentAnimation = @"moveLeft";
		//NSLog(@"MOVE LEFT");
		//body.scaleX = -1;
		
		
		[body stopAllActions];
		[body runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithAnimation:[body animationByName:@"walk"] restoreOriginalFrame:NO] ]];
		
	}
}

-(void)moveRight
{
	if(currentAnimation != @"moveRight"){
		currentAnimation = @"moveRight";
		//NSLog(@"MOVE RIGHT");
		
		//body.scaleX = 1;
		
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
		
		
		if(self.scaleX > 0)
		{
			moveX = 200.0f;
			friction = 2.0f;
		} else if(body.scaleX < 0)
		{
			moveX = -200.0f;
			friction = 2.0f;
		}
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
		  [CCCallFunc actionWithTarget:self	selector:@selector(sendPunchUppercut)],
		  nil]
		 ];
		
		if(self.scaleX > 0)
		{
			moveX = 200.0f;
			friction = 2.0f;
		} else if(body.scaleX < 0)
		{
			moveX = -200.0f;
			friction = 2.0f;
		}
	}
}

-(void)sendPunch
{
	CGRect punchHit = CGRectMake(self.hitArea.origin.x, 
								 self.hitArea.origin.y, 
								 self.hitArea.size.width + 50, 
								 self.hitArea.size.height);
	CGRect punchDepth = CGRectMake(self.moveArea.origin.x,
								   self.moveArea.origin.y - 10,
								   self.moveArea.size.width + 50,
								   self.moveArea.size.height + 20);
	
	
	BEUAction *punchToSend = [[BEUHitAction alloc] initWithSender:self 
														 selector:@selector(receiveHit:)duration:1 
														  hitArea: [self convertRectToGlobal: punchHit] 
														 hitDepth: [self convertRectToGlobal: punchDepth] 
															power: 20];
	[[BEUActionsController sharedController] addAction:punchToSend];
}

-(void)sendPunchUppercut
{
	CGRect punchHit = CGRectMake(self.hitArea.origin.x, 
								 self.hitArea.origin.y, 
								 self.hitArea.size.width + 50, 
								 self.hitArea.size.height);
	CGRect punchDepth = CGRectMake(self.moveArea.origin.x,
								   self.moveArea.origin.y - 10,
								   self.moveArea.size.width + 50,
								   self.moveArea.size.height + 20);
	
	
	BEUAction *punchToSend = [[BEUHitAction alloc] initWithSender:self 
														 selector:@selector(receiveHitUppercut:)duration:1 
														  hitArea: [self convertRectToGlobal: punchHit] 
														 hitDepth: [self convertRectToGlobal: punchDepth] 
															power: 20];
	[[BEUActionsController sharedController] addAction:punchToSend];
}


-(void)punchComplete
{
	//NSLog(@"makeMoveable");
	canMove = YES;
	[currentMove completeMove];
	
	moveX = 0.0f;
	friction = 0.0f;
	
	[self standStill];
	
	
}

-(void)hit:(BOOL)right
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
	
	if(right)
	{
		moveX = 100.0f;
		friction = 2.0f;
	} else {
		moveX = -100.0f;
		friction = 2.0f;
	}
}

-(void)hitUppercut:(BOOL)right
{
	currentAnimation = @"hitUppercut";
	[body stopAllActions];
	canMove = NO;
	
	[body runAction:
	 [CCSequence actions:
	  [CCAnimate actionWithAnimation:[body animationByName:@"hit"] restoreOriginalFrame: YES],
	  [CCCallFunc actionWithTarget:self selector:@selector(hitComplete)],
	  nil]
	 ];
	
	if(right)
	{
		moveX = 100.0f;
	} else {
		moveX = -100.0f;
		
	}
	moveY = 200.0f;	
	friction = 2.0f;
	
}

-(void)death
{
	currentAnimation = @"death";
	[body stopAllActions];
	canMove = NO;
	
	[body runAction: 
	 [CCSequence actions:
	  [CCAnimate actionWithAnimation:[body animationByName:@"death"] restoreOriginalFrame: NO],
	  [CCDelayTime actionWithDuration:1.2],
	  [CCCallFunc actionWithTarget:self selector:@selector(deathComplete)],
	  nil
	  ]
	 ];
}

-(void)deathComplete
{
	[self kill];
}

-(void)hitComplete
{
	canMove = YES;
	[self standStill];
	
	friction = 0.0f;
	moveX = 0.0f;
	
}

-(void)step:(ccTime)delta
{
	if(friction > 0.0f)
	{
		
		if(moveX < 0.0f)
		{
			moveX += friction*delta;
			
			if(moveX >= 0.0f)
			{
				friction = 0.0f;
				moveX = 0.0f;
			}
		} else if(moveX > 0.0f) {
			moveX -= friction*delta;
			
			if(moveX <= 0.0f)
			{
				friction = 0.0f;
				moveX = 0.0f;
			}
		}
		
	}
	
	[super step:delta];
}

-(BOOL)receiveHit:(BEUAction *)action
{
	life -= ((BEUHitAction *)action).power;
	BEUObject *sender = (BEUObject *)action.sender;
	if(action.sender != self)
	{
	
			
		if(sender.x < self.x)
		{
			[self hit:YES];
		} else {
			[self hit:NO];
		}
			
		if(life <= 0) [self death];
		
		return YES;
		
	} else {
		return NO;
	}
}


-(BOOL)receiveHitUppercut:(BEUAction *)action
{
	life -= ((BEUHitAction *)action).power;
	BEUObject *sender = (BEUObject *)action.sender;
	if(action.sender != self)
	{
		if(life > 0){
			
			if(sender.x < self.x)
			{
				[self hitUppercut:YES];
			} else {
				[self hitUppercut:NO];
			}
			
			return YES;
			
		} else {
			
			[self death];
			
			return YES;
		}
	} else {
		return NO;
	}
}


-(void)dealloc
{
	if(ai)[ai release];
	[super dealloc];
}


@end
