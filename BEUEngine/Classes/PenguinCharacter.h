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
#import "NinjaStarFish.h"
#import "SwordFish.h"

@class BEUCharacter;
@class BEUSprite;
@class NinjaStarFish;
@class SwordFish;


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
-(void)stopAllAnimations;
-(void)setOrigPositions;
-(void)completeCurrentMove;

-(BOOL)punch1:(BEUMove *)move;
-(void)punch1Complete;
-(BOOL)punch2:(BEUMove *)move;
-(void)punch2Complete;
-(BOOL)punch3:(BEUMove *)move;
-(void)punch3Complete;

-(BOOL)kick1:(BEUMove *)move;
-(void)kick1Complete;
-(BOOL)kick2:(BEUMove *)move;
-(void)kick2Complete;

-(BOOL)throwNinjaStar:(BEUMove *)move;
-(void)throwStar;
-(void)throwComplete;

-(BOOL)swingWeapon1:(BEUMove *)move;
-(void)swingWeapon1Send;
-(void)swingWeapon1Complete;

-(BOOL)swingWeapon2:(BEUMove *)move;
-(void)swingWeapon2Send;
-(void)swingWeapon2Complete;

-(BOOL)swingWeapon3:(BEUMove *)move;
-(void)swingWeapon3Send;
-(void)swingWeapon3Complete;

-(void)jump;
-(void)block;

@end
