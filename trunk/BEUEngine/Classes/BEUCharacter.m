//
//  BEUCharacter.m
//  BEUEngine
//
//  Created by Chris Mele on 2/17/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUCharacter.h"


@implementation BEUCharacter


-(id)init {
	
	// loads the sprite frames from a Zwoptex generated file
	
	[super init];
	
	/*CCSprite *body = [CCSprite spriteWithFile:@"TestCharacterTexture.png"
										 rect:CGRectMake(0,0,60,60)];*/
	
	[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"TestCharacterTexture.plist"];
	
	NSMutableArray *animFrames = [NSMutableArray array];
	for(int i = 0; i < 3; i++) {		
		CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"TestCharacter%02d.png",(i+1)]];
		[animFrames addObject:frame];
	}
	
	CCAnimation *animation = [CCAnimation animationWithName:@"walk" delay:0.2f frames:animFrames];
	
	[self addAnimation:animation];
	
	id action = [CCAnimate actionWithAnimation: animation];
	id repeating = [CCRepeatForever actionWithAction:action];
	
	[self runAction:repeating];
	
	
	//[self addChild:body];
	
	return self;
}

@end
