//
//  SwordFish.m
//  BEUEngine
//
//  Created by Chris Mele on 3/16/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "SwordFish.h"


@implementation SwordFish

-(id)init
{
	if( (self = [super init]) )
	{
		sword = [CCSprite spriteWithFile:@"SwordFish.png"];
		sword.anchorPoint = ccp(0.5f, 0.0f);
		
		[self addChild:sword];
	}
	
	return self;
}

@end
