//
//  NinjaStarFish.m
//  BEUEngine
//
//  Created by Chris on 3/16/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "NinjaStarFish.h"


@implementation NinjaStarFish



-(id)initWithPower:(float)power_ weight:(float)weight_ fromCharacter:(BEUCharacter *)character
{
	[super initWithPower:power_ weight:weight_ fromCharacter:character];
	
	sprite = [[CCSprite alloc] initWithFile:@"NinjaStarFish.png"];
	sprite.anchorPoint = ccp(0.5f,0.5f);
	
	self.anchorPoint = ccp(0.0f,0.0f);
	
	moveArea = CGRectMake(-sprite.contentSize.width/2,-sprite.contentSize.height/2,sprite.contentSize.width,sprite.contentSize.height);
	hitArea = CGRectMake(moveArea.origin.x, moveArea.origin.y, moveArea.size.width, moveArea.size.height);
	
	[self addChild:sprite];
	
	return self;
}

-(void)moveWithAngle:(float)angle magnitude:(float)mag_
{
	[super moveWithAngle:angle magnitude:mag_];
	
	[self runAction: [CCRepeatForever actionWithAction:
					  [CCRotateBy actionWithDuration:0.3f angle:360.0f]
					  ]
	 ];
}


-(void)step:(ccTime)delta
{
	
	[super step:delta];
}

-(void)dealloc
{
	[self stopAllActions];
	
	[super dealloc];
}





@end
