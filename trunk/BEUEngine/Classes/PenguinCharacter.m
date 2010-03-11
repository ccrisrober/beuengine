//
//  PenguinCharacter.m
//  BEUEngine
//
//  Created by Chris Mele on 3/10/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "PenguinCharacter.h"


@implementation PenguinCharacter

-(id)init
{
	if( (self = [super init]) )
	{
		[self buildPenguin];
		[self createAnimations];
		[self idle];
	}
	
	return self;
}

-(void)buildPenguin
{
	
	[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Penguin.plist"];
	
	penguin = [[BEUSprite alloc] init];
	penguin.anchorPoint = ccp(0.0f, 0.0f);
	//penguin.position = ccp(-20.0f,0.0f);
	
	body = [[CCSprite alloc] initWithSpriteFrame:
			[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"Penguin-Body.png"]
			];
	body.anchorPoint = ccp(0.5f, 0.0f);
	
	leftWing = [[CCSprite alloc] initWithSpriteFrame:
				[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"Penguin-LeftWing.png"]
				];
	leftWing.anchorPoint = ccp(0.86f,0.9f);
	
	rightWing = [[CCSprite alloc] initWithSpriteFrame:
				 [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"Penguin-RightWing.png"]
				 ];
	rightWing.anchorPoint = ccp(0.2f,0.8f);
	
	leftLeg = [[CCSprite alloc] initWithSpriteFrame:
			   [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"Penguin-LeftLeg.png"]
			   ];
	leftLeg.anchorPoint = ccp(0.3f, 0.75f);
	
	rightLeg = [[CCSprite alloc] initWithSpriteFrame:
				 [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"Penguin-RightLeg.png"]
				 ];
	rightLeg.anchorPoint = ccp(0.2f,0.7f);
	
	[penguin addChild:rightLeg z:0 tag:0];
	[penguin addChild:leftLeg z:1 tag:1];
	[penguin addChild:rightWing z:2 tag:2];
	[penguin addChild:body z:3 tag:3];
	[penguin addChild:leftWing z:4 tag:4];
	
	[self addChild:penguin];
	
	[movesController addMove:
	 [BEUMove moveWithName:@"punch1"
				 character:self	
				  sequence:[[NSArray alloc] initWithObjects:BEUInputTap, nil]
				  selector:@selector(punch1:)
	  ]
	 ];
	
	[movesController addMove:
	 [BEUMove moveWithName:@"punch2"
				 character:self	
				  sequence:[[NSArray alloc] initWithObjects:BEUInputTap,BEUInputTap, nil]
				  selector:@selector(punch2:)
	  ]
	 ];
	
	[movesController addMove:
	 [BEUMove moveWithName:@"punch3"
				 character:self	
				  sequence:[[NSArray alloc] initWithObjects:BEUInputTap,BEUInputTap,BEUInputTap, nil]
				  selector:@selector(punch3:)
	  ]
	 ];
	
}


-(void)moveCharacterWithAngle:(float)angle percent:(float)percent
{
	[super moveCharacterWithAngle:angle percent:percent];
	
	if(canMove)
	{
		if(fabs(moveX)>0)
		{
			[self walk];
		} else {
			[self idle];
		}
	}
	
}

-(void)createAnimations
{
	animations = [[NSMutableDictionary alloc] init];
	
	
	[animations setValue:[CCRepeatForever actionWithAction:
						  [CCSequence actions:
						   [CCRotateTo actionWithDuration:0.2f angle:7.0f],
						   [CCRotateTo actionWithDuration:0.2f angle:-7.0f],
						   nil]
						  ]
				  forKey:@"selfWalk"];
	
	[animations setValue:[CCRepeatForever actionWithAction:
						  [CCSequence actions:
						   [CCRotateTo actionWithDuration:0.3f angle:-65.0f],
						   [CCRotateTo actionWithDuration:0.35f angle:20.0f],
						   nil
						   ]
						  ]
				  forKey:@"leftWingWalk"];
	
	[animations setValue:[CCRepeatForever actionWithAction:
						  [CCSequence actions:
						   [CCRotateTo actionWithDuration:0.3f angle:20.0f],
						   [CCRotateTo actionWithDuration:0.35f angle:-35.0f],
						   nil
						   ]
						  ]
				  forKey:@"rightWingWalk"];
	
	[animations setValue:[CCRepeatForever actionWithAction:
						  [CCSequence actions:
						   [CCSpawn actions:
							[CCRotateTo actionWithDuration:0.2f angle:10.0f],
							[CCSequence actions:
							 [CCMoveTo actionWithDuration:0.1f position:ccp(27.0f,9.0f)],
							 [CCMoveTo actionWithDuration:0.1f position:ccp(27.0f,11.0f)],
							 nil
							 ],
							nil
							],
						   [CCSpawn actions:
							[CCRotateTo actionWithDuration:0.2f angle:-10.0f],
							[CCSequence actions:
							 [CCMoveTo actionWithDuration:0.1f position:ccp(27.0f,14.0f)],
							 [CCMoveTo actionWithDuration:0.1f position:ccp(27.0f,11.0f)],
							 nil
							 ],
							nil
							],
						   nil
						   ]
						  ]
				  forKey:@"leftLegWalk"];
	
	[animations setValue:[CCRepeatForever actionWithAction:
						  [CCSequence actions:
						   [CCSpawn actions:
							[CCRotateTo actionWithDuration:0.2f angle:-10.0f],
							[CCSequence actions:
							 [CCMoveTo actionWithDuration:0.1f position:ccp(46.0f,14.0f)],
							 [CCMoveTo actionWithDuration:0.1f position:ccp(46.0f,17.0f)],
							 nil
							 ],
							nil
							],
						   [CCSpawn actions:
							[CCRotateTo actionWithDuration:0.2f angle:10.0f],
							[CCSequence actions:
							 [CCMoveTo actionWithDuration:0.1f position:ccp(46.0f,10.0f)],
							 [CCMoveTo actionWithDuration:0.1f position:ccp(46.0f,14.0f)],
							 nil
							 ],
							nil
							],
						   nil
						   ]
						  ]
				  forKey:@"rightLegWalk"];
	
	[animations setValue:[CCRepeatForever actionWithAction:
						  [CCSequence actions:
						   [CCEaseInOut actionWithAction: [CCScaleTo actionWithDuration:0.5f scale:1.02f] rate:2],
						   [CCEaseInOut actionWithAction:[CCScaleTo actionWithDuration:0.5f scale:1.0f] rate:2],
						   nil
						   ]
						  ]
				  forKey:@"bodyIdle"];
	
	[animations setValue:[CCRepeatForever actionWithAction:
						  [CCSequence actions:
						   [CCMoveTo actionWithDuration:0.5f position:ccp(50.0f,46.0f)],
						   [CCMoveTo actionWithDuration:0.5f position:ccp(50.0f,43.0f)],
						   nil
						   ]
						  ]
				  forKey:@"rightWingIdle"];
	
	[animations setValue:[CCRepeatForever actionWithAction:
						  [CCSequence actions:
						   [CCMoveTo actionWithDuration:0.5f position:ccp(18.0f,46.0f)],
						   [CCMoveTo actionWithDuration:0.5f position:ccp(18.0f,43.0f)],
						   nil
						   ]
						  ]
				  forKey:@"leftWingIdle"];
	
	[animations setValue:[CCSequence actions:
						  [CCSpawn actions:
						   [CCMoveBy actionWithDuration:0.05f position:ccp(25.0f,0.0f)],
						   [CCRotateTo actionWithDuration:0.05f	angle:-120.0f],
						   nil
						   ],
						  
						  
						  
						  [CCSpawn actions:
						   [CCMoveBy actionWithDuration:0.2f position:ccp(-25.0f,0.0f)],
						   [CCRotateTo actionWithDuration:0.2f angle:-80],
						   nil
						   ],
						  
						  nil
						  
						  ] forKey:@"leftWingPunch1"];
	
	[animations setValue:[CCSequence actions:
						  [CCRotateTo actionWithDuration:0.05f angle:20],
						  [CCRotateTo actionWithDuration:0.2f angle:0],
						  nil
						  ] forKey:@"bodyPunch1"];
	
	
	[animations setValue:[CCSequence actions:
						  [CCDelayTime actionWithDuration:0.05f],
						  [CCCallFunc actionWithTarget:self selector:@selector(punch1Complete)],
						  [CCDelayTime actionWithDuration:0.2f],
						  [CCCallFunc actionWithTarget:self selector:@selector(idle)],
						  nil
						  ] forKey:@"selfPunch1"];
	
	[animations setValue:[CCSequence actions:
						  [CCMoveBy actionWithDuration:0.05f position:ccp(25.0f,0.0f)],
						  [CCMoveBy actionWithDuration:0.2f position:ccp(-25.0f,0.0f)],
						  nil
						  ] forKey:@"leftWingPunch2"];
	
	[animations setValue:[CCSequence actions:
						  [CCSpawn actions:
						   [CCMoveBy actionWithDuration:0.05f position:ccp(25.0f,0.0f)],
						   [CCRotateTo actionWithDuration:0.05f	angle:-120.0f],
						   nil
						   ],
						  
						  
						  
						  [CCSpawn actions:
						   [CCMoveBy actionWithDuration:0.2f position:ccp(-25.0f,0.0f)],
						   [CCRotateTo actionWithDuration:0.2f angle:-80],
						   nil
						   ],
						  
						  nil
						  
						  ] forKey:@"rightWingPunch2"];
	
	[animations setValue:[CCSequence actions:
						  [CCRotateTo actionWithDuration:0.05f angle:20],
						  [CCRotateTo actionWithDuration:0.2f angle:0],
						  nil
						  ] forKey:@"bodyPunch2"];
	
	[animations setValue:[CCSequence actions:
						  [CCDelayTime actionWithDuration:0.05f],
						  [CCCallFunc actionWithTarget:self selector:@selector(punch2Complete)],
						  [CCDelayTime actionWithDuration:0.2f],
						  [CCCallFunc actionWithTarget:self selector:@selector(idle)],
						  nil
						  ] forKey:@"selfPunch2"];
	
	[animations setValue:[CCSequence actions:
						  [CCSpawn actions:
						   [CCMoveBy actionWithDuration:0.12f position:ccp(25.0f,0.0f)],
						   [CCRotateTo actionWithDuration:0.12f	angle:-160.0f],
						   nil
						   ],
						  
						  
						  
						  [CCSpawn actions:
						   [CCMoveBy actionWithDuration:0.3f position:ccp(-25.0f,0.0f)],
						   [CCRotateTo actionWithDuration:0.3f angle:0],
						   nil
						   ],
						  
						  nil
						  
						  ] forKey:@"leftWingPunch3"];
	
	[animations setValue:[CCSequence actions:
						  [CCRotateTo actionWithDuration:0.12f angle:20],
						  [CCRotateTo actionWithDuration:0.3f angle:0],
						  nil
						  ] forKey:@"bodyPunch3"];
	
	[animations setValue:[CCSequence actions:
						  [CCRotateTo actionWithDuration:0.12f angle:70.0f],
						  [CCRotateTo actionWithDuration:0.3f angle:0],
						  nil
						  ] forKey:@"leftLegPunch3"];
	
	[animations setValue:[CCSequence actions:
						  [CCDelayTime actionWithDuration:0.12f],
						  [CCCallFunc actionWithTarget:self selector:@selector(punch3Complete)],
						  [CCDelayTime actionWithDuration:0.3f],
						  [CCCallFunc actionWithTarget:self selector:@selector(idle)],
						  nil
						  ] forKey:@"selfPunch3"];
}

-(void)walk
{
	if(currentAnimation != @"walking")
	{
		currentAnimation = @"walking";
		
		[self stopAllAnimations];
		[self setOrigPositions];
		
		[self runAction:
		 [animations valueForKey:@"selfWalk"]
		 ];
		
		[leftWing runAction:
		 [animations valueForKey:@"leftWingWalk"]
		 ];
		
		[rightWing runAction:
		 [animations valueForKey:@"rightWingWalk"]
		 ];
		
		[leftLeg runAction:
		 [animations valueForKey:@"leftLegWalk"]
		 ];
		
		[rightLeg runAction:
		 [animations valueForKey:@"rightLegWalk"]
		 ];
		
	}
}

-(void)stopAllAnimations
{
	[body stopAllActions];
	[self stopAllActions];
	[rightLeg stopAllActions];
	[leftLeg stopAllActions];
	[rightWing stopAllActions];
	[leftWing stopAllActions];
}

-(void)setOrigPositions
{
	
	self.rotation = 0.0f;
	
	rightLeg.position = ccp(46.0f,14.0f);
	rightLeg.rotation = 0.0f;
	rightLeg.scaleX = rightLeg.scaleY = 1;
	
	leftLeg.position = ccp(27.0f,11.0f);
	leftLeg.rotation = 0.0f;
	leftLeg.scaleX = leftLeg.scaleY = 1;
	
	rightWing.position = ccp(50.0f,46.0f);
	rightWing.rotation = 0.0f;
	rightWing.scaleX = rightWing.scaleY = 1;
	
	leftWing.position = ccp(18.0f,46.0f);
	leftWing.rotation = 0.0f;
	leftWing.scaleX = leftWing.scaleY = 1;
	
	body.position = ccp(31.0f,9.0f);
	body.rotation = 0.0f;
	body.scaleX = body.scaleY = 1;
}

-(void)idle
{
	if(currentAnimation != @"idle")
	{
		canMove = YES;
		currentAnimation = @"idle";
		[self stopAllAnimations];
		[self setOrigPositions];
		
		[body runAction:
		 [animations valueForKey:@"bodyIdle"]
		 ];
		
		[rightWing runAction:
		 [animations valueForKey:@"rightWingIdle"]
		 ];
		
		[leftWing runAction:
		 [animations valueForKey:@"leftWingIdle"]
		 ];
		
		
	}
}

-(void)punch1: (BEUMove *)move
{
	currentAnimation = @"punch1";
	currentMove = move;
	canMove = NO;
	[self stopAllAnimations];
	[self setOrigPositions];
	
	leftWing.rotation = -80;
	
	[leftWing runAction:
	 [animations valueForKey:@"leftWingPunch1"]
	 ];
	
	[body runAction:
	 [animations valueForKey:@"bodyPunch1"]
	 ];
	
	[self runAction:
	 [animations valueForKey:@"selfPunch1"]
	 ];
	
}

-(void)punch1Complete
{
	
	[currentMove completeMove];
	canMove = YES;
	currentMove = nil;
}

-(void)punch2: (BEUMove *)move
{
	currentAnimation = @"punch2";
	currentMove = move;
	canMove = NO;
	[self stopAllAnimations];
	[self setOrigPositions];
	
	rightWing.rotation = -80;
	
	[leftWing runAction:
	 [animations valueForKey:@"leftWingPunch2"]
	 ];
	
	[rightWing runAction:
	 [animations valueForKey:@"rightWingPunch2"]
	 ];
	
	[body runAction:
	 [animations valueForKey:@"bodyPunch2"]
	 ];
	
	[self runAction:
	 [animations valueForKey:@"selfPunch2"]
	 ];
}

-(void)punch2Complete
{
	[currentMove completeMove];
	canMove = YES;
	currentMove = nil;
}

-(void)punch3: (BEUMove *)move
{
	currentAnimation = @"punch3";
	currentMove = move;
	//canMove = NO;
	[self stopAllAnimations];
	[self setOrigPositions];
	
	
	[leftWing runAction:
	 [animations valueForKey:@"leftWingPunch3"]
	 ];
	
	[body runAction:
	 [animations valueForKey:@"bodyPunch3"]
	 ];
	
	[leftLeg runAction:
	 [animations valueForKey:@"leftLegPunch3"]
	 ];
	
	[self runAction:
	 [animations valueForKey:@"selfPunch3"]
	 ];
	
	moveY = 220.0f;
}

-(void)punch3Complete
{
	[currentMove completeMove];
	canMove = YES;
	currentMove = nil;
}

@end
