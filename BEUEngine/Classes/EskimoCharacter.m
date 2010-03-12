//
//  EskimoCharacter.m
//  BEUEngine
//
//  Created by Chris on 3/11/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "EskimoCharacter.h"


@implementation EskimoCharacter

-(id)init
{
	if( (self = [super init]) )
	{
		[self setUpEskimo];
		[self setUpAnimations];
		[self setUpAI];
	}
	
	return self;
}

-(void)setUpEskimo
{
	[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Eskimo.plist"];
	
	eskimo = [[BEUSprite alloc] init];
	eskimo.anchorPoint = ccp(0.0f,0.0f);
	
	body = [[CCSprite alloc] initWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"Eskimo-Body.png"]];
	body.anchorPoint = ccp(0.5f,0.0f);
	
	
	leftLeg = [[CCSprite alloc] initWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"Eskimo-Leg.png"]];
	leftLeg.anchorPoint = ccp(0.5f,0.9f);
		
	rightLeg = [[CCSprite alloc] initWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"Eskimo-Leg.png"]];
	rightLeg.anchorPoint = ccp(0.5f,0.9f);
	
	leftArm = [[CCSprite alloc] initWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"Eskimo-LeftArm.png"]];
	leftArm.anchorPoint = ccp(0.5f,0.9f);
	
	rightArm = [[CCSprite alloc] initWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"Eskimo-RightArm.png"]];
	rightArm.anchorPoint = ccp(0.5f,0.9f);
	
	head = [[CCSprite alloc] initWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"Eskimo-Head.png"]];
	head.anchorPoint = ccp(0.5f,0.0f);
	
	[eskimo addChild:rightLeg z:0];
	[eskimo addChild:leftLeg z:1];
	[eskimo addChild:rightArm z:2];
	[eskimo addChild:body z:3];
	[eskimo addChild:head z:4];
	[eskimo addChild:leftArm z:5];
	
	[self addChild:eskimo];
	
	[self setOrigPositions];
	
	moveArea = CGRectMake(-18,0,36,15);
	hitArea = CGRectMake(-32,0,65,130);
	
	drawBoundingBoxes = NO;
	isWall = NO;
	
}


-(void)setOrigPositions
{
	eskimo.position = ccp(0.0f,0.0f);
	eskimo.rotation = 0;
	eskimo.scaleX = eskimo.scaleY = 1;
	
	body.position = ccp(30.0f,25.0f);
	body.rotation = 0;
	body.scaleX = body.scaleY = 1;
	
	leftLeg.position = ccp(21.0f,33.0f);
	leftLeg.rotation = 0;
	leftLeg.scaleX = leftLeg.scaleY = 1;
	
	rightLeg.position = ccp(40.0f,35.0f);
	rightLeg.rotation = 0;
	rightLeg.scaleX = rightLeg.scaleY = 1;
	
	leftArm.position = ccp(10.0f,77.0f);
	leftArm.rotation = 0;
	leftArm.scaleX = leftArm.scaleY = 1;
	
	rightArm.position = ccp(51.0f,80.0f);
	rightArm.rotation = 0;
	rightArm.scaleX = rightArm.scaleY = 1;
	
	head.position = ccp(33.0f,75.0f);
	head.rotation = 0;
	head.scaleX = head.scaleY = 1;
	
}

-(void)setUpAnimations
{
	animations = [[NSMutableDictionary alloc] init];
	
	[animations setValue:
	 [CCRepeatForever actionWithAction:
	  [CCSequence actions:
	   [CCRotateTo actionWithDuration:0.2f angle:-35],
	   [CCRotateTo actionWithDuration:0.2f angle:30],
	   nil
	   ]
	  ]
				  forKey:@"leftLegWalk"
	 ];
	
	[animations setValue:
	 [CCRepeatForever actionWithAction:
	  [CCSequence actions:
	   [CCRotateTo actionWithDuration:0.2f angle:30],
	   [CCRotateTo actionWithDuration:0.2f angle:-30],
	   nil
	   ]
	  ]
				  forKey:@"rightLegWalk"
	 ];
	
	[animations setValue:
				  [CCRepeatForever actionWithAction:
				   [CCSequence actions:
					[CCRotateTo actionWithDuration:0.2f angle:-35],
					[CCRotateTo actionWithDuration:0.2f angle:20],
					nil
					]
				   ]
				  forKey:@"leftArmWalk"
	 ];
	
	[animations setValue:
	 [CCRepeatForever actionWithAction:
	  [CCSequence actions:
	   [CCRotateTo actionWithDuration:0.2f angle:20],
	   [CCRotateTo actionWithDuration:0.2f angle:-45],
	   nil
	   ]
	  ]
				  forKey:@"rightArmWalk"
	 ];
	
	/*[animations setValue:
	 [CCSequence actions:
	  
	  ]
				  forKey:@""
	 ];*/
	
	
}

-(void)setUpAI
{
	ai = [[BEUCharacterAI alloc] initWithParent:self];
	BEUCharacterAIBehavior *moveBranch = [BEUCharacterAIMove behavior];
	[moveBranch addBehavior:[BEUCharacterAIMoveToTarget behavior]];
	[moveBranch addBehavior:[BEUCharacterAIMoveAwayFromTarget behavior]];
	[ai addBehavior:moveBranch];
	
}

-(void)stopAllAnimations
{
	//[self stopAllActions];
	[leftLeg stopAllActions];
	[rightLeg stopAllActions];
	[leftArm stopAllActions];
	[rightArm stopAllActions];
	[body stopAllActions];
	[head stopAllActions];
	
}

-(void)moveCharacterWithAngle:(float)angle percent:(float)percent
{
	[super moveCharacterWithAngle:angle percent:percent];
	if(canMove){
		if(moveX > 0)
		{
			[self walk];
		} else if(moveX < 0)
		{
			[self walk];
		} else {
			[self idle];
		}
	}
}

-(void)walk
{
	if(currentAnimation != @"walk")
	{
		currentAnimation = @"walk";
		[self stopAllAnimations];
		[rightLeg runAction:[animations valueForKey:@"rightLegWalk"]];
		[leftLeg runAction:[animations valueForKey:@"leftLegWalk"]];
		[leftArm runAction:[animations valueForKey:@"leftArmWalk"]];
		[rightArm runAction:[animations valueForKey:@"rightArmWalk"]];
	}
}


-(void)idle
{
	if(currentAnimation != @"idle")
	currentAnimation = @"idle";
	canMove = YES;
}

-(void)hit
{
	canMove = NO;
	
	
	if(currentAnimation != @"hit")
	{
		currentAnimation = @"hit";
		[self stopAllAnimations];
		[self setOrigPositions];
		if(![animations valueForKey:@"hitAnimationEskimo"])
		{
			
			[animations setObject:
						   [CCSequence actions:
							[CCRotateTo actionWithDuration:0.2f angle:-20.0f],
							[CCRotateTo actionWithDuration:0.3f angle:0.0f],
							[CCCallFunc actionWithTarget:self selector:@selector(idle)],
							nil
							]
							
						   forKey:@"hitAnimationEskimo"];
		}
		
		[head runAction:[animations valueForKey:@"hitAnimationEskimo"]];
		
	}
}

-(BOOL)receiveHit:(BEUAction *)action
{
	
	BEUCharacter *sender = (BEUCharacter *)action.sender;
	BEUHitAction *hit = ((BEUHitAction *)action);
	if(sender != self && sender.enemy != self.enemy)
	{
		if(state == BEUCharacterStateBlocking) return YES;
		
		life -= hit.power;	
		canMove = 0;
		if(sender.x < self.x)
		{
			moveX = hit.xForce;
			
		} else {
			moveX = -hit.xForce;
		}
		
		moveY = hit.yForce;
		moveZ = hit.zForce;
		
		NSLog(@"RECIEVED HIT: %1.2f, %1.2f, %1.2f",hit.xForce,hit.yForce,hit.zForce);
		
		//if(life <= 0) [self death];
		
		return YES;
		
	} else {
		return NO;
	}
}

-(void)dealloc
{
	[head release];
	[leftLeg release];
	[rightLeg release];
	[leftArm release];
	[rightArm release];
	[body release];
	
	[super dealloc];
}

@end
