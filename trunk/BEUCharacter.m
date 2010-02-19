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
	[super init];
	
	
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
	
	return self;
}

@end
