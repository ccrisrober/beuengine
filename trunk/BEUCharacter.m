//
//  BEUCharacter.m
//  BEUEngine
//
//  Created by Chris Mele on 2/17/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUCharacter.h"


@implementation BEUCharacter

@synthesize life, body;




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
		CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"TestCharacter00%d.png",(i+1)]];
		[animFrames addObject:frame];
		
	}
	
	CCAnimation *walkingAnimation = [CCAnimation animationWithName:@"walk" delay:0.1f frames:animFrames];	
	//[body addAnimation:animation];
	
	
	NSMutableArray *standingStillFrames = [NSMutableArray array];
	[standingStillFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"TestCharacter003.png"]];
	 
	CCAnimation *standingStillAnimation = [CCAnimation animationWithName:@"stand" delay: 1.0f frames:standingStillFrames];
	
	[body addAnimation:standingStillAnimation];
	[body addAnimation:walkingAnimation];

	
	[self standStill];
	
	body.position = ccp(47.0f,0.0f);
	
	self.anchorPoint = ccp(0.0f, 0.0f);
	
	self.hitArea = CGRectMake(0, 0, 30, 60);
	self.moveArea = CGRectMake(30, 0, 40, 20);
	
	return self;
}

-(void)moveCharacterWithAngle:(double)angle percent:(double)percent 
{
	double moveSpeed = movementSpeed*percent;
	moveX = cos(angle)*moveSpeed;
	moveZ = sin(angle)*moveSpeed;
}

-(void)moveLeft
{
	if(currentAnimation != @"moveLeft"){
		currentAnimation = @"moveLeft";
		NSLog(@"MOVE LEFT");
		body.scaleX = -1;
		
	
		[body stopAllActions];
		[body runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithAnimation:[body animationByName:@"walk"] restoreOriginalFrame:NO] ]];

	}
}

-(void)moveRight
{
	if(currentAnimation != @"moveRight"){
		currentAnimation = @"moveRight";
		NSLog(@"MOVE RIGHT");
		
		body.scaleX = 1;
	
		[body stopAllActions];
		[body runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithAnimation:[body animationByName:@"walk"] restoreOriginalFrame:NO] ]];
	}
}

-(void)standStill
{
	if(currentAnimation != @"stand"){
		currentAnimation = @"stand";
		NSLog(@"STAND");
		[body stopAllActions];
		[body runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithAnimation:[body animationByName:@"stand"] restoreOriginalFrame:NO] ]];
	}
}

-(void)step:(ccTime)delta
{
	[super step:delta];
	
	if(moveX < 0){
		[self moveLeft];
	} else if(moveX > 0){
		[self moveRight];
	} else {
		[self standStill];
	}
}

-(void)draw
{
	[super draw];
	
	[self drawRect:moveArea];

	
}


-(void) drawRect:(CGRect)rect
{
	ccDrawLine(ccp(rect.origin.x, rect.origin.y), ccp(rect.origin.x + rect.size.width, rect.origin.y));
	ccDrawLine(ccp(rect.origin.x + rect.size.width, rect.origin.y), ccp(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height));
	ccDrawLine(ccp(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height), ccp(rect.origin.x, rect.origin.y + rect.size.height));
	ccDrawLine(ccp(rect.origin.x, rect.origin.y + rect.size.height), ccp(rect.origin.x, rect.origin.y));
}


@end
