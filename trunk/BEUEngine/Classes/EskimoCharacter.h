//
//  EskimoCharacter.h
//  BEUEngine
//
//  Created by Chris on 3/11/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "BEUCharacter.h"
#import "BEUSprite.h"
#import "BEUCharacterAIIdleBehavior.h"
#import "BEUHitAction.h"
#import "cocos2d.h"
#import "BEUCharacterAIMoveBehavior.h"

#import "BEUCharacterAIAttackBehavior.h"

@interface EskimoCharacter : BEUCharacter {
	BEUSprite *eskimo;
	CCSprite *body;
	CCSprite *head;
	CCSprite *leftArm;
	CCSprite *rightArm;
	CCSprite *leftLeg;
	CCSprite *rightLeg;
	CCSprite *spear;
	
	NSString *currentAnimation;
	NSMutableDictionary *animations;
}

-(void)setUpEskimo;
-(void)setUpAnimations;
-(void)setOrigPositions;
-(void)setUpAI;
-(void)stopAllAnimations;

-(BOOL)attack:(BEUMove *)move;
-(void)attackSend;
-(void)attackCcomplete;

-(void)block;

@end
