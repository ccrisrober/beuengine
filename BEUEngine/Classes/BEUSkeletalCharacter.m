//
//  BEUSkeletalCharacter.m
//  BEUEngine
//
//  Created by Chris Mele on 3/1/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUSkeletalCharacter.h"


@implementation BEUSkeletalCharacter

@synthesize head, body, leftArm, rightArm, leftLeg, rightLeg, container, currentAnimation;

-(id)init
{

	[super init];
	
	movementSpeed = 80.0f;
	life = 100.0f;
	
	drawBoundingBoxes = YES;
	
	[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"SkeletalCharacter.plist"];
	
	head = [CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"head.png"]];
	body = [CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"body.png"]];
	leftArm = [CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"arm.png"]];
	rightArm = [CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"arm.png"]];
	leftLeg = [CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"leg.png"]];
	rightLeg = [CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"leg.png"]];
	
	leftLeg.anchorPoint = ccp(0.15f,0.82f);
	leftLeg.position = ccp(5.0f, 42.0f);
	rightLeg.anchorPoint = ccp(0.15f,0.82f);
	rightLeg.position = ccp(5.0f, 42.0f);
	
	leftArm.anchorPoint = ccp(0.14f,0.81f);
	leftArm.position = ccp(6.0f, 78.0f);
	rightArm.anchorPoint = ccp(0.14f,0.81f);
	rightArm.position = ccp(6.0f, 78.0f);
	
	body.anchorPoint = ccp(0.5f,0.2f);
	body.position = ccp(11.0f,50.0f);
	
	head.anchorPoint = ccp(0.5f,0.0f);
	head.position = ccp(11.0f, 93.0f);
	
	container = [[CCSprite alloc] init];
	
	[container addChild:rightArm z:0];
	[container addChild:rightLeg z: 1];
	[container addChild:body z:2];
	[container addChild:leftArm z:3];
	[container addChild:leftLeg z:4];
	[container addChild:head z:5];
	
	[self addChild:container];
	
	self.moveArea = CGRectMake(-20,0,40,30);
	self.hitArea = CGRectMake(-20,0,40,60);
	self.container.position = ccp(-5.0f,0.0f);
	//self.anchorPoint = ccp(0.0f,0.0f);
	
	return self;
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

-(void)moveRight
{
	
	
	
	if(currentAnimation != @"moveRight"){
		currentAnimation = @"moveRight";
		[leftLeg stopAllActions];
		[rightLeg stopAllActions];
		[leftArm stopAllActions];
		[rightArm stopAllActions];
		
		[leftLeg runAction:
		 [CCRepeatForever actionWithAction:
		  [CCSequence actions:
		   [CCRotateTo actionWithDuration:0.2f angle:15.0f],
		   [CCRotateTo actionWithDuration:0.2f angle:-15.f],
		   nil
		   ]
		  ]
		 ];
		
		[rightLeg runAction:
		 [CCRepeatForever actionWithAction:
		  [CCSequence actions:
		   [CCRotateTo actionWithDuration:0.2f angle:-15.0f],
		   [CCRotateTo actionWithDuration:0.2f angle:15.0f],
		   nil
		   ]
		  ]
		 ];
		
		
		
		[leftArm runAction:
		 [CCRepeatForever actionWithAction:
		  [CCSequence actions:
		   [CCRotateTo actionWithDuration:0.2f angle:-12.0f],
		   [CCRotateTo actionWithDuration:0.2f angle:12.0f],
		   nil
		   ]
		  ]
		 ];
		
		[rightArm runAction:
		 [CCRepeatForever actionWithAction:
		  [CCSequence actions:
		   [CCRotateTo actionWithDuration:0.2f angle:12.0f],
		   [CCRotateTo actionWithDuration:0.2f angle:-12.0f],
		   nil
		   ]
		  ]
		 ];
		
		//container.scaleX = 1;
		//container.position = ccp(0,0);
	}
}

-(void)moveLeft
{
	if(currentAnimation != @"moveLeft"){
		currentAnimation = @"moveLeft";
		[leftLeg stopAllActions];
		[rightLeg stopAllActions];
		[leftArm stopAllActions];
		[rightArm stopAllActions];
		
		[leftLeg runAction:
		 [CCRepeatForever actionWithAction:
		  [CCSequence actions:
		   [CCRotateTo actionWithDuration:0.2f angle:15.0f],
		   [CCRotateTo actionWithDuration:0.2f angle:-15.f],
		   nil
		   ]
		  ]
		 ];
		
		[rightLeg runAction:
		 [CCRepeatForever actionWithAction:
		  [CCSequence actions:
		   [CCRotateTo actionWithDuration:0.2f angle:-15.0f],
		   [CCRotateTo actionWithDuration:0.2f angle:15.0f],
		   nil
		   ]
		  ]
		 ];
		
		[leftArm runAction:
		 [CCRepeatForever actionWithAction:
		  [CCSequence actions:
		   [CCRotateTo actionWithDuration:0.2f angle:-12.0f],
		   [CCRotateTo actionWithDuration:0.2f angle:12.0f],
		   nil
		   ]
		  ]
		 ];
		
		[rightArm runAction:
		 [CCRepeatForever actionWithAction:
		  [CCSequence actions:
		   [CCRotateTo actionWithDuration:0.2f angle:12.0f],
		   [CCRotateTo actionWithDuration:0.2f angle:-12.0f],
		   nil
		   ]
		  ]
		 ];
		
		//container.scaleX = -1;
		//container.position = ccp(50,0);
		
	}
}

-(void)standStill
{
	if(currentAnimation != @"standStill"){
		currentAnimation = @"standStill";
		[leftLeg stopAllActions];
		[rightLeg stopAllActions];
		[leftArm stopAllActions];
		[rightArm stopAllActions];
		leftLeg.rotation = -5.0f;
		rightLeg.rotation = 5.0f;
	}
}




@end
