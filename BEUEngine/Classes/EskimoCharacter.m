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

-(void)step:(ccTime)delta
{
	[super step:delta];
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
	
	spear = [[CCSprite alloc] initWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"Eskimo-Spear.png"]];
	spear.anchorPoint = ccp(0.5f, 0.3f);
	spear.position = ccp(0.0f, 7.0f);
	spear.rotation = 90;
	[leftArm addChild:spear z:-1];
	
	[eskimo addChild:rightLeg z:0];
	[eskimo addChild:leftLeg z:1];
	[eskimo addChild:rightArm z:2];
	[eskimo addChild:body z:3];
	[eskimo addChild:head z:4];
	[eskimo addChild:leftArm z:5];
	
	
	[self addChild:eskimo];
	
	[self setOrigPositions];
	
	moveArea = CGRectMake(-9,0,18,10);
	hitArea = CGRectMake(-32,0,65,130);
	
	drawBoundingBoxes = YES;
	isWall = YES;
	
	
	[movesController addMove:[BEUMove moveWithName:@"attack"
										 character:self
										  sequence:[NSArray arrayWithObjects:BEUInputTap,nil]
										  selector:@selector(attack:)
							  ]
	 ];
	
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
	   [CCRotateTo actionWithDuration:0.4f angle:-35],
	   [CCRotateTo actionWithDuration:0.4f angle:30],
	   nil
	   ]
	  ]
				  forKey:@"leftLegWalk"
	 ];
	
	[animations setValue:
	 [CCRepeatForever actionWithAction:
	  [CCSequence actions:
	   [CCRotateTo actionWithDuration:0.4f angle:30],
	   [CCRotateTo actionWithDuration:0.4f angle:-30],
	   nil
	   ]
	  ]
				  forKey:@"rightLegWalk"
	 ];
	
	[animations setValue:
				  [CCRepeatForever actionWithAction:
				   [CCSequence actions:
					[CCRotateTo actionWithDuration:0.4f angle:-35],
					[CCRotateTo actionWithDuration:0.4f angle:20],
					nil
					]
				   ]
				  forKey:@"leftArmWalk"
	 ];
	
	[animations setValue:
	 [CCRepeatForever actionWithAction:
	  [CCSequence actions:
	   [CCRotateTo actionWithDuration:0.4f angle:20],
	   [CCRotateTo actionWithDuration:0.4f angle:-45],
	   nil
	   ]
	  ]
				  forKey:@"rightArmWalk"
	 ];
	
	
	[animations setValue:
	 [CCSequence actions:
	  [CCSpawn actions:
	   [CCMoveBy actionWithDuration:0.35f position: ccp(-15.0f,0.0f)],
	   [CCRotateTo actionWithDuration:0.35f angle:40.0f],
	   nil
	   ],
	  [CCSpawn actions:
	   [CCMoveBy actionWithDuration:0.15f position: ccp(25.0f,0.0f)],
	   [CCRotateTo actionWithDuration:0.15f angle: -20.0f],
	   nil
	   ],
	  [CCSpawn actions:
	   [CCMoveBy actionWithDuration:0.2f position: ccp(-10.0f,0.0f)],
	   [CCRotateTo actionWithDuration:0.2f angle: 0.0f],
	   nil
	   ],
	  nil
	  ]
				  forKey:@"leftArmAttack"
	 ];
	
	[animations setValue:
	 [CCSequence actions:
	  [CCDelayTime actionWithDuration:0.4f],
	  [CCCallFunc actionWithTarget:self selector:@selector(attackSend)],
	  [CCDelayTime actionWithDuration:0.3f],
	  [CCCallFunc actionWithTarget:self selector:@selector(attackComplete)],
	  nil
	  ]
				  forKey:@"selfAttack"
	 ];
	
	
	
	/*[animations setValue:
	 [CCSequence actions:
	  
	  ]
				  forKey:@""
	 ];*/
	
	
}

-(BOOL)attack:(BEUMove *)move
{
	currentAnimation = @"attack";
	currentMove = move;
	
	[self stopAllAnimations];
	[self setOrigPositions];
	[leftArm runAction:[animations valueForKey:@"leftArmAttack"]];
	[self runAction:[animations valueForKey:@"selfAttack"]];
	
	canMove = NO;
	
	return YES;
}

-(void)attackSend
{
	
}

-(void)attackComplete
{
	[currentMove completeMove];
	[self idle];
	
	canMove = YES;
}


-(void)setUpAI
{
	ai = [[BEUCharacterAI alloc] initWithParent:self];
	
	/*BEUCharacterAIBehavior *moveBranch = [BEUCharacterAIMove behavior];
	[moveBranch addBehavior:[BEUCharacterAIMoveToTarget behavior]];
	[moveBranch addBehavior:[BEUCharacterAIMoveAwayFromTarget behavior]];
	[moveBranch addBehavior:[BEUCharacterAIMoveAwayToTargetZ behavior]];
	[ai addBehavior:moveBranch];
	*/
	BEUCharacterAIBehavior *idleBranch = [BEUCharacterAIIdleBehavior behaviorWithMinTime:0.3f maxTime:1.0f];
	[ai addBehavior:idleBranch];
	
	BEUCharacterAIBehavior *attackBranch = [BEUCharacterAIAttackBehavior behavior];
	[attackBranch addBehavior:[BEUCharacterAIMoveToAndAttack behaviorWithMoves:[movesController moves]]];
	[ai addBehavior:attackBranch];
	
}

-(void)stopAllAnimations
{
	[self stopAllActions];
	
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
	[self stopAllAnimations];
	[self setOrigPositions];
	canMove = YES;
}

-(void)hit:(BEUAction *)action;
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
							[CCRotateTo actionWithDuration:0.35f angle:0.0f],
							[CCCallFunc actionWithTarget:self selector:@selector(idle)],
							nil
							]
							
						   forKey:@"hitAnimationEskimo"];
			[animations setObject:
			 [CCSequence actions:
			  [CCRotateTo actionWithDuration:0.35f angle:0.0f],
			  nil
			  ]
			 
						   forKey:@"hitAnimationEskimoHead"];
			[animations setObject:
			 [CCSequence actions:
			  [CCRotateTo actionWithDuration:0.35f angle:0.0f],
			  nil
			  ]
			 
						   forKey:@"hitAnimationEskimoRightArm"];
			[animations setObject:
			 [CCSequence actions:
			  [CCRotateTo actionWithDuration:0.35f angle:0.0f],
			  nil
			  ]
			 
						   forKey:@"hitAnimationEskimoLeftArm"];
			
			[animations setObject:
			 [CCSequence actions:
			  [CCRotateTo actionWithDuration:0.35f angle:0.0f],
			  nil
			  ]
			 
						   forKey:@"hitAnimationEskimoRightLeg"];
			
			[animations setObject:
			 [CCSequence actions:
			  [CCRotateTo actionWithDuration:0.35f angle:0.0f],
			  nil
			  ]
			 
						   forKey:@"hitAnimationEskimoLeftLeg"];
		}
		
		eskimo.rotation = -20.0f;
		
		head.rotation = 25.0f;
		
		leftArm.rotation = -50.0f;
		rightArm.rotation = 15.0f;
		
		leftLeg.rotation = -40.0f;
		rightLeg.rotation = -20.0f;
		
		[eskimo runAction:[animations valueForKey:@"hitAnimationEskimo"]];
		[head runAction:[animations valueForKey:@"hitAnimationEskimoHead"]];
		[rightArm runAction:[animations valueForKey:@"hitAnimationEskimoRightArm"]];
		[leftArm runAction:[animations valueForKey:@"hitAnimationEskimoLeftArm"]];
		[rightLeg runAction:[animations valueForKey:@"hitAnimationEskimoRightLeg"]];
		[leftLeg runAction:[animations valueForKey:@"hitAnimationEskimoLeftLeg"]];
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
