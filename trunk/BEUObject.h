//
//  BEUObject.h
//  BEUEngine
//
//  Created by Chris Mele on 2/18/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "cocos2d.h"

@interface BEUObject : CCSprite {
	float xPos;
	float yPos;
	float zPos;
	
	
	
	float moveX;
	float moveY;
	float moveZ;
	
	CGRect hitArea;
	CGRect moveArea;
	
	float movementSpeed;
	
	//Should the move area be applied as a wall to stop objects from moving through this object
	BOOL isWall;
	
	BOOL drawBoundingBoxes;
}

@property(nonatomic) float moveX;
@property(nonatomic) float moveY;
@property(nonatomic) float moveZ;

@property(nonatomic) float xPos;
@property(nonatomic) float yPos;
@property(nonatomic) float zPos;

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
