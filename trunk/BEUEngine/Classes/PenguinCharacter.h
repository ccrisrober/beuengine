//
//  PenguinCharacter.h
//  BEUEngine
//
//  Created by Chris Mele on 3/10/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUCharacter.h"
#import "BEUMove.h"
#import "BEUMovesController.h"
#import "BEUSprite.h"
#import "cocos2d.h"

@class BEUCharacter;
@class BEUSprite;

@interface PenguinCharacter : BEUCharacter {
	
	NSString *currentAnimation;
	
	BEUSprite *penguin;
	BEUSprite *leftWing;
	BEUSprite *rightWing;
	BEUSprite *body;
	BEUSprite *leftLeg;
	BEUSprite *rightLeg;
	
	NSMutableDictionary *animations;
	
}

-(void)buildPenguin;
-(void)createAnimations;
-(void)walk;
-(void)idle;
-(void)stopAllAnimations;
-(void)setOrigPositions;

-(void)punch1:(BEUMove *)move;
-(void)punch1Complete;
-(void)punch2:(BEUMove *)move;
-(void)punch2Complete;
-(void)punch3:(BEUMove *)move;
-(void)punch3Complete;

-(void)kick1:(BEUMove *)move;
-(void)kick1Complete;
-(void)kick2:(BEUMove *)move;
-(void)kick2Complete;


@end
