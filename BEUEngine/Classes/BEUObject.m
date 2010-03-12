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
	
	friction = 5.0f;
	
	hitArea = CGRectMake(0, 0, 1, 1);
	moveArea = CGRectMake(0, 0, 1, 1);
	
	movementSpeed = 1.0f;
	
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

-(void)draw
{
	[super draw];
/*	if(drawBoundingBoxes)
	{
		
		
		
		[[[BEUEnvironment sharedEnvironment] debugLayer] drawRect:[self convertRectToGlobal:moveArea] color: ccc4(0, 255, 0, 125) lineWidth:2.0f];
		[[[BEUEnvironment sharedEnvironment] debugLayer] drawRect:[self convertRectToGlobal:hitArea] color: ccc4(0, 0, 255, 125) lineWidth:2.0f];
		
		
	}*/
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
	} else {
		self.scaleX = -1;
	}
}

-(CGRect) globalHitArea
{
	return [self convertRectToGlobal:hitArea];
}

-(CGRect) globalMoveArea
{
	return [self convertRectToGlobal:moveArea];
}

@end
