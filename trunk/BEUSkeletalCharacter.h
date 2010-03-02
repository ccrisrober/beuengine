//
//  BEUSkeletalCharacter.h
//  BEUEngine
//
//  Created by Chris Mele on 3/1/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUCharacter.h"
#import "cocos2d.h"

@class BEUCharacter;

@interface BEUSkeletalCharacter : BEUCharacter {
	
	CCSprite *head;
	CCSprite *leftLeg;
	CCSprite *rightLeg;
	CCSprite *body;
	CCSprite *leftArm;
	CCSprite *rightArm;
	CCSprite *container;
	NSString *currentAnimation;
	
}

@property(nonatomic,retain) CCSprite *head;
@property(nonatomic,retain) CCSprite *leftLeg;
@property(nonatomic,retain) CCSprite *rightLeg;
@property(nonatomic,retain) CCSprite *body;
@property(nonatomic,retain) CCSprite *leftArm;
@property(nonatomic,retain) CCSprite *rightArm;
@property(nonatomic,retain) CCSprite *container;

@property(nonatomic,retain) NSString *currentAnimation;

@end
