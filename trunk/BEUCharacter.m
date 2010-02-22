//
//  BEUCharacter.m
//  BEUEngine
//
//  Created by Chris Mele on 2/17/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUCharacter.h"


@implementation BEUCharacter

@synthesize life;

-(id)init 
{
	[super init];
	
	movementSpeed = 2;
	// loads the sprite frames from a Zwoptex generated file
	[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"TestCharacterTexture.plist"];
	
	NSMutableArray *animFrames = [NSMutableArray array];
	for(int i = 0; i < 3; i++) {
		CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"TestCharacterTexture%d.png",(i+1)]];
		[animFrames addObject:frame];
		
	}
	
	CCAnimation *animation = [CCAnimation animationWithName:@"dance" delay:0.2f frames:animFrames];	
	[self addAnimation:animation];
	
	CCAnimate *animate = [CCAnimate actionWithAnimation:animation];
		 
	CCAction *action = [CCRepeatForever actionWithAction:animate];
	[self runAction:action];	
	
	self.anchorPoint = ccp(0.0f, 0.0f);
	
	self.hitArea = CGRectMake(0, 0, 30, 60);
	self.moveArea = CGRectMake(10, 0, 40, 20);
	return self;
}

-(void)moveCharacterWithAngle:(double)angle percent:(double)percent 
{
	double moveSpeed = movementSpeed*percent;
	moveX = cos(angle)*moveSpeed;
	moveZ = sin(angle)*moveSpeed;
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
