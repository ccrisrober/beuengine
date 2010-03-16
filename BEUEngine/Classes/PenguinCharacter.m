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
	
	movementSpeed = 200.0f;
	friction = 500.0f;
	
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
	
	[penguin addChild:rightWing z:0 tag:2];
	[penguin addChild:rightLeg z:1 tag:0];
	[penguin addChild:leftLeg z:2 tag:1];
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
	
	[movesController addMove:
	 [BEUMove moveWithName:@"kick1"
				 character:self
				  sequence:[[NSArray alloc] initWithObjects:BEUInputSwipeForward, nil]
				  selector:@selector(kick1:)
	  ]
	 ];
	
	hitArea = CGRectMake(-35, 0, 70, 75);
	moveArea = CGRectMake(-10,0,20,5);
	
	drawBoundingBoxes = YES;
	isWall = YES;
	
}


-(void)createAnimations
{
	animations = [[NSMutableDictionary alloc] init];
	
	
	[animations setValue:[CCRepeatForever actionWithAction:
						  [CCSequence actions:
						   [CCRotateTo actionWithDuration:0.3f angle:15.0f],
						   [CCRotateTo actionWithDuration:0.35f angle:-0.0f],
						   nil]
						  ]
				  forKey:@"bodyWalk"];
	
	[animations setValue:[CCRepeatForever actionWithAction:
						  [CCSequence actions:
						   [CCSpawn actions:
							[CCRotateTo actionWithDuration:0.3f angle:-65.0f],
							[CCMoveBy actionWithDuration:0.3f position: ccp(6.0f,0.0f)],
							nil
							],
						   [CCSpawn actions:
							[CCRotateTo actionWithDuration:0.35f angle:25.0f],
							[CCMoveBy actionWithDuration:0.35f position: ccp(-6.0f, 0.0f)],
							nil
							],
						   nil
						   ]
						  ]
				  forKey:@"leftWingWalk"];
	
	[animations setValue:[CCRepeatForever actionWithAction:
						  [CCSequence actions:
						   [CCSpawn actions:
							[CCRotateTo actionWithDuration:0.3f angle:20.0f],
							[CCMoveBy actionWithDuration:0.3f position: ccp(5.0f,0.0f)],
							nil
							],
						   [CCSpawn actions:
							
							[CCRotateTo actionWithDuration:0.35f angle:-55.0f],
							[CCMoveBy actionWithDuration:0.3f position: ccp(-5.0f,0.0f)],
							nil],
						   nil
						   ]
						  ]
				  forKey:@"rightWingWalk"];
	
	[animations setValue:[CCRepeatForever actionWithAction:
						  [CCSequence actions:
						   [CCSpawn actions:
							[CCRotateTo actionWithDuration:0.2f angle:20.0f],
							[CCSequence actions:
							 [CCMoveBy actionWithDuration:0.1f position:ccp(0.0f,-3.0f)],
							 [CCMoveBy actionWithDuration:0.1f position:ccp(0.0f,3.0f)],
							 nil
							 ],
							nil
							],
						   [CCSpawn actions:
							[CCRotateTo actionWithDuration:0.2f angle:-20.0f],
							[CCSequence actions:
							 [CCMoveBy actionWithDuration:0.1f position:ccp(0.0f,4.0f)],
							 [CCMoveBy actionWithDuration:0.1f position:ccp(0.0f,-4.0f)],
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
							[CCRotateTo actionWithDuration:0.2f angle:-20.0f],
							[CCSequence actions:
							 [CCMoveBy actionWithDuration:0.1f position:ccp(0.0f,-4.0f)],
							 [CCMoveBy actionWithDuration:0.1f position:ccp(0.0f,4.0f)],
							 nil
							 ],
							nil
							],
						   [CCSpawn actions:
							[CCRotateTo actionWithDuration:0.2f angle:20.0f],
							[CCSequence actions:
							 [CCMoveBy actionWithDuration:0.1f position:ccp(0.0f,-4.0f)],
							 [CCMoveBy actionWithDuration:0.1f position:ccp(0.0f,4.0f)],
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
						   [CCEaseInOut actionWithAction: [CCScaleTo actionWithDuration:0.5f scale:1.0f] rate:2],
						   nil
						   ]
						  ]
				  forKey:@"bodyIdle"];
	
	[animations setValue:[CCRepeatForever actionWithAction:
						  [CCSequence actions:
						   [CCMoveBy actionWithDuration:0.5f position:ccp(0.0f,4.0f)],
						   [CCMoveBy actionWithDuration:0.5f position:ccp(0.0f,-4.0f)],
						   nil
						   ]
						  ]
				  forKey:@"rightWingIdle"];
	
	[animations setValue:[CCRepeatForever actionWithAction:
						  [CCSequence actions:
						   [CCMoveBy actionWithDuration:0.5f position:ccp(0.0f,4.0f)],
						   [CCMoveBy actionWithDuration:0.5f position:ccp(0.0f,-4.0f)],
						   nil
						   ]
						  ]
				  forKey:@"leftWingIdle"];
	
	[animations setValue:[CCSequence actions:
						  [CCSpawn actions:
						   [CCMoveBy actionWithDuration:0.05f position:ccp(25.0f,0.0f)],
						   [CCRotateBy actionWithDuration:0.05f	angle:-40.0f],
						   nil
						   ],
						  
						  
						  
						  [CCSpawn actions:
						   [CCMoveBy actionWithDuration:0.2f position:ccp(-25.0f,0.0f)],
						   [CCRotateBy actionWithDuration:0.2f angle:40.0f],
						   nil
						   ],
						  
						  nil
						  
						  ] forKey:@"leftWingPunch1"];
	
	[animations setValue:[CCSequence actions:
						  [CCRotateBy actionWithDuration:0.05f angle:20],
						  [CCRotateBy actionWithDuration:0.2f angle:-20],
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
						   [CCRotateBy actionWithDuration:0.05f	angle:-40.0f],
						   nil
						   ],
						  
						  
						  
						  [CCSpawn actions:
						   [CCMoveBy actionWithDuration:0.2f position:ccp(-25.0f,0.0f)],
						   [CCRotateBy actionWithDuration:0.2f angle:40.0f],
						   nil
						   ],
						  
						  nil
						  
						  ] forKey:@"rightWingPunch2"];
	
	[animations setValue:[CCSequence actions:
						  [CCRotateBy actionWithDuration:0.05f angle:20],
						  [CCRotateBy actionWithDuration:0.2f angle:-20],
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
						   [CCMoveBy actionWithDuration:0.2f position:ccp(25.0f,0.0f)],
						   [CCRotateBy actionWithDuration:0.2f	angle:-190.0f],
						   nil
						   ],
						  
						  
						  
						  [CCSpawn actions:
						   [CCMoveBy actionWithDuration:0.45f position:ccp(-25.0f,0.0f)],
						   [CCRotateBy actionWithDuration:0.45f angle:190.0],
						   nil
						   ],
						  
						  nil
						  
						  ] forKey:@"leftWingPunch3"];
	
	[animations setValue:[CCSequence actions:
						  [CCRotateBy actionWithDuration:0.2f angle:20],
						  [CCRotateBy actionWithDuration:0.45f angle:-20],
						  nil
						  ] forKey:@"bodyPunch3"];
	
	[animations setValue:[CCSequence actions:
						  [CCRotateBy actionWithDuration:0.2f angle:70.0f],
						  [CCRotateBy actionWithDuration:0.45f angle:-70],
						  nil
						  ] forKey:@"leftLegPunch3"];
	[animations setValue:[CCSequence actions:
						  [CCRotateBy actionWithDuration:0.2f angle:70.0f],
						  [CCRotateBy actionWithDuration:0.45f angle:-70],
						  nil
						  ] forKey:@"rightLegPunch3"];
	
	[animations setValue:[CCSequence actions:
						  [CCDelayTime actionWithDuration:0.2f],
						  [CCCallFunc actionWithTarget:self selector:@selector(punch3Complete)],
						  [CCDelayTime actionWithDuration:0.45f],
						  [CCCallFunc actionWithTarget:self selector:@selector(idle)],
						  nil
						  ] forKey:@"selfPunch3"];
	
	
	
	[animations setValue:[CCSequence actions:
						  [CCSpawn actions:
						   [CCRotateBy actionWithDuration:0.12f angle:-80],
						   [CCMoveBy actionWithDuration:0.12f position:ccp(25.0f,20.0f)],
						   nil
						  ],
						  [CCCallFunc actionWithTarget:self selector:@selector(kick1Complete)],
						  
						  [CCSpawn actions:
						   [CCRotateBy actionWithDuration:0.3f angle:80],
						   [CCMoveBy actionWithDuration:0.3f position:ccp(-25.0f,-20.0f)],
						   nil
						   ],
						  [CCCallFunc actionWithTarget:self selector:@selector(idle)],
						  
						  nil
						  ]
				  forKey:@"rightLegKick1"];
	
}

-(void)walk
{
	if(currentAnimation != @"walking")
	{
		currentAnimation = @"walking";
		
		[self stopAllAnimations];
		[self setOrigPositions];
		
		[body runAction:
		 [animations valueForKey:@"bodyWalk"]
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
	
	rightWing.position = ccp(54.0f,46.0f);
	rightWing.rotation = -30.0f;
	rightWing.scaleX = rightWing.scaleY = 1;
	
	leftWing.position = ccp(25.0f,46.0f);
	leftWing.rotation = 30.0f;
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
	
	moveX = self.scaleX*100.0f;
	
}

-(void)punch1Complete
{
	
	CGRect punchHit = CGRectMake(self.hitArea.origin.x + 30, 
								 self.hitArea.origin.y, 
								 self.hitArea.size.width, 
								 self.hitArea.size.height);
	CGRect punchDepth = CGRectMake(self.moveArea.origin.x + 30,
								   self.moveArea.origin.y - 10,
								   self.moveArea.size.width,
								   self.moveArea.size.height + 20);
	
	
	BEUAction *punchToSend = [[BEUHitAction alloc] initWithSender:self 
														 selector:@selector(receiveHit:)duration:1 
														  hitArea: [self convertRectToGlobal: punchHit] 
														 hitDepth: [self convertRectToGlobal: punchDepth] 
															power: 20 
														   xForce: (self.scaleX * 120.0f) 
														   yForce: 0.0f
														   zForce: 0.0f];
	[[BEUActionsController sharedController] addAction:punchToSend];
	
	[currentMove completeMove];
	//canMove = YES;
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
	
	moveX = self.scaleX*120.0f;
}

-(void)punch2Complete
{
	CGRect punchHit = CGRectMake(self.hitArea.origin.x+ 30, 
								 self.hitArea.origin.y, 
								 self.hitArea.size.width, 
								 self.hitArea.size.height);
	CGRect punchDepth = CGRectMake(self.moveArea.origin.x + 30,
								   self.moveArea.origin.y - 10,
								   self.moveArea.size.width,
								   self.moveArea.size.height + 20);
	
	
	BEUAction *punchToSend = [[BEUHitAction alloc] initWithSender:self 
														 selector:@selector(receiveHit:)duration:1 
														  hitArea: [self convertRectToGlobal: punchHit] 
														 hitDepth: [self convertRectToGlobal: punchDepth] 
															power: 20 
														   xForce: (self.scaleX * 120.0f)
														   yForce: 0.0f
														   zForce: 0.0f];
	[[BEUActionsController sharedController] addAction:punchToSend];
	
	[currentMove completeMove];
	//canMove = YES;
	currentMove = nil;
}

-(void)punch3: (BEUMove *)move
{
	currentAnimation = @"punch3";
	currentMove = move;
	canMove = NO;
	
	[self stopAllAnimations];
	[self setOrigPositions];
	
	[leftWing setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"Penguin-LeftWingFist.png"]]; 
	[leftWing runAction:
	 [animations valueForKey:@"leftWingPunch3"]
	 ];
	
	[body runAction:
	 [animations valueForKey:@"bodyPunch3"]
	 ];
	
	[leftLeg runAction:
	 [animations valueForKey:@"leftLegPunch3"]
	 ];
	
	[rightLeg runAction:
	 [animations valueForKey:@"rightLegPunch3"]
	 ];
	
	[self runAction:
	 [animations valueForKey:@"selfPunch3"]
	 ];
	
	moveX = self.scaleX*120.0f;
	moveY = 220.0f;
}

-(void)punch3Complete
{
	CGRect punchHit = CGRectMake(self.hitArea.origin.x + 30, 
								 self.hitArea.origin.y, 
								 self.hitArea.size.width, 
								 self.hitArea.size.height);
	CGRect punchDepth = CGRectMake(self.moveArea.origin.x + 30,
								   self.moveArea.origin.y - 30,
								   self.moveArea.size.width,
								   self.moveArea.size.height + 60);
	
	
	BEUAction *punchToSend = [[BEUHitAction alloc] initWithSender:self 
														 selector:@selector(receiveHit:)duration:1 
														  hitArea: [self convertRectToGlobal: punchHit] 
														 hitDepth: [self convertRectToGlobal: punchDepth] 
															power: 20 
														   xForce: (self.scaleX * 120.0f)
														   yForce: 170.0f
														   zForce: 0.0f];
	[[BEUActionsController sharedController] addAction:punchToSend];
	
	[leftWing setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"Penguin-LeftWing.png"]]; 
	[currentMove completeMove];
	//canMove = YES;
	currentMove = nil;
}

-(void)kick1:(BEUMove *)move
{
	currentAnimation = @"kick1";
	currentMove = move;
	canMove = NO;
	
	[self stopAllAnimations];
	[self setOrigPositions];
	
	[rightLeg runAction:
	 [animations valueForKey:@"rightLegKick1"]
	 ];
	
	
	
	moveY = 120.0f;
}

-(void)kick1Complete
{
	CGRect punchHit = CGRectMake(self.hitArea.origin.x, 
								 self.hitArea.origin.y, 
								 self.hitArea.size.width + 50, 
								 self.hitArea.size.height);
	CGRect punchDepth = CGRectMake(self.moveArea.origin.x,
								   self.moveArea.origin.y - 10,
								   self.moveArea.size.width + 50,
								   self.moveArea.size.height + 20);
	
	
	BEUAction *punchToSend = [[BEUHitAction alloc] initWithSender:self 
														 selector:@selector(receiveHit:)duration:1 
														  hitArea: [self convertRectToGlobal: punchHit] 
														 hitDepth: [self convertRectToGlobal: punchDepth] 
															power: 20 
														   xForce: 100.0f 
														   yForce: 0.0f
														   zForce: 0.0f];
	[[BEUActionsController sharedController] addAction:punchToSend];
	
	
	
	[currentMove completeMove];
	canMove = NO;
	currentMove = nil;
}

-(void)kick2:(BEUMove *)move
{
	
}

-(void)kick2Complete
{
	
}

-(void)jump
{
	if(y == 0)
	{
		[self applyForceY: 200.0f];
	}
}

-(void)receiveInput:(BEUInputEvent *)event
{
	if(event.type == BEUInputButtonDown && event.sender.tag == 2)
	{
		[self jump];
	} else {
		[super receiveInput:event];
	}
}



-(void)step:(ccTime)delta
{
	[super step:delta];
	

}

@end
