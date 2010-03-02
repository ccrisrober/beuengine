//
//  BEUObject.h
//  BEUEngine
//
//  Created by Chris Mele on 2/18/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "cocos2d.h"

@interface BEUObject : CCSprite {
	//x,y,z positions of the object, these positions are converted in BEUObjectController in to x,y positions
	float x;
	float y;
	float z;

	//the current movement speed for x,y,z which moveX and moveZ are applied in BEUObjectController, moveY is not
	float moveX;
	float moveY;
	float moveZ;
	
	//the hitbox of the object, used to test collisions on the object in its x,y space
	CGRect hitArea;
	//the movement hitbox of the object, used to test collisions on the object in its x,z space
	CGRect moveArea;
	
	//the movement speed of the object, used mostly in BEUCharacter
	float movementSpeed;
	
	//Should the move area be applied as a wall to stop objects from moving through this object
	BOOL isWall;
	
	//debug value to draw hit and move boxes of object, defaults to NO
	BOOL drawBoundingBoxes;
}

@property(nonatomic) float moveX;
@property(nonatomic) float moveY;
@property(nonatomic) float moveZ;

@property(nonatomic) float x;
@property(nonatomic) float y;
@property(nonatomic) float z;

@property(nonatomic) CGRect moveArea;
@property(nonatomic) CGRect	hitArea;
@property(nonatomic) float movementSpeed;
@property(nonatomic) BOOL drawBoundingBoxes;
@property(nonatomic) BOOL isWall;

-(void)step:(ccTime)delta;

-(CGRect)globalHitArea;
-(CGRect)globalMoveArea;
-(CGRect)convertRectToGlobal:(CGRect)rect;

-(void)drawRect:(CGRect)rect;

@end
