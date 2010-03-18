//
//  BEUObject.m
//  BEUEngine
//
//  Created by Chris Mele on 2/18/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUObject.h"


@implementation BEUObject
@synthesize moveX, moveY, moveZ, 
x, y, z, hitArea, moveArea,
movementSpeed,isWall,drawBoundingBoxes,
affectedByGravity,friction;

-(id)init
{
	[super init];
	
	x = 0;
	y = 0;
	z = 0;
	
	moveX = 0;
	moveY = 0;
	moveZ = 0;
	
	friction = 500.0f;
	
	hitArea = CGRectMake(0, 0, 1, 1);
	moveArea = CGRectMake(0, 0, 1, 1);
	
	movementSpeed = 1.0f;
	
	directionMultiplier = 1;
	
	isWall = YES;
	affectedByGravity = YES;
	drawBoundingBoxes = NO;
	facingRight = YES;
	
	self.anchorPoint = ccp(0.5f,0.0f);
	self.honorParentTransform = YES;
	
	return self;
}

-(void)step:(ccTime)delta
{
	
}


-(float)applyForceX:(float)force
{
	moveX += force;
	if(force < 0 && moveX < force) moveX = force;
	else if(force > 0 && moveX > force) moveX = force;
	//moveX = force;
	return moveX;
}

-(float)applyAdjForceX:(float)force
{
	if(facingRight) return [self applyForceX:force];
	else return [self applyForceX:-force];
}

-(float)applyForceY:(float)force
{
	moveY += force;
	if(force < 0 && moveY < force) moveY = force;
	else if(force > 0 && moveY > force) moveY = force;
	//moveY = force;
	
	return moveY;
}

-(float)applyForceZ:(float)force
{
	moveZ += force;
	if(force < 0 && moveZ < force) moveZ = force;
	else if(force > 0 && moveZ > force) moveZ = force;
	//moveZ = force;
	
	return moveZ;
}


-(CGRect)convertRectToLocal:(CGRect)rect
{
	if(!self.facingRight)
	{
		return CGRectMake(-rect.origin.x - rect.size.width,rect.origin.y, rect.size.width, rect.size.height);						  
	}
	
	return rect;
}

-(CGRect)convertRectToGlobal:(CGRect)rect
{
	CGRect locRect = [self convertRectToLocal:rect];
	return CGRectMake(x + locRect.origin.x, z + y + locRect.origin.y, locRect.size.width, locRect.size.height);

}


	
-(void) drawRect:(CGRect)rect
{
	ccDrawLine(ccp(rect.origin.x, rect.origin.y), ccp(rect.origin.x + rect.size.width, rect.origin.y));
	ccDrawLine(ccp(rect.origin.x + rect.size.width, rect.origin.y), ccp(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height));
	ccDrawLine(ccp(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height), ccp(rect.origin.x, rect.origin.y + rect.size.height));
	ccDrawLine(ccp(rect.origin.x, rect.origin.y + rect.size.height), ccp(rect.origin.x, rect.origin.y));
}

-(BOOL) facingRight
{
	return facingRight;
}

-(void) setFacingRight:(BOOL)right
{
	facingRight = right;
	
	if(facingRight)
	{
		self.scaleX = 1;
		directionMultiplier = 1;
	} else {
		self.scaleX = -1;
		directionMultiplier = -1;
	}
}

-(CGRect) globalHitArea
{	
	return [self convertRectToGlobal:hitArea];
}

-(CGRect) globalMoveArea
{
	CGRect locRect = [self convertRectToLocal:moveArea];
	
	return CGRectMake(locRect.origin.x + x, locRect.origin.y + z, locRect.size.width, locRect.size.height);
}

@end
