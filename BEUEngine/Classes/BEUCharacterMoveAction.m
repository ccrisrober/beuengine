//
//  BEUCharacterMoveAction.m
//  BEUEngine
//
//  Created by Chris on 3/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BEUCharacterMoveAction.h"


@implementation BEUCharacterMoveTo

@synthesize point;

+(id)actionWithPoint:(CGPoint)point_
{
	return [[[BEUCharacterMoveTo alloc] initWithPoint:point_] autorelease];
}

-(id)initWithPoint:(CGPoint)point_
{
	if( (self = [super init]) ) 
	{
		point = point_;
	}
	
	return self;
}



-(void)update:(ccTime)delta
{
	BEUCharacter *character = (BEUCharacter *)target;
	
	float dist = ccpDistance(ccp(character.x,character.z), ccp(point.x,point.y));
	
	if( dist < 5 )
	{
		[self complete];
	} else {
		
		
		character.movingAngle = [BEUMath angleFromPoint:ccp(character.x,character.z)
												toPoint:ccp(point.x,point.y)];
		character.movingPercent = 1;
	}
	
}

-(void)complete
{
	[super complete];
	BEUCharacter *character = (BEUCharacter *)target;
	[character moveCharacterWithAngle:0 percent:0];
}

@end


@implementation BEUCharacterMoveToObject

@synthesize object,distance;

+(id)actionWithObject:(BEUObject *)object_ distance:(float)distance_
{
	return [[[BEUCharacterMoveToObject alloc] initWithObject:object_ distance:distance_] autorelease];
}

-(id)initWithObject:(BEUObject *)object_ distance:(float)distance_
{
	if( (self = [super init]) )
	{
		object = object_;
		distance = distance_;
	}
	
	
	return self;
}


-(void)update:(ccTime)delta
{
	BEUCharacter *character = (BEUCharacter *)target;
	if( ccpDistance(ccp(character.x,character.z), ccp(object.x,object.z)) < distance )
	{
		character.movingAngle = 0;
		character.movingPercent = 0;
		[self complete];
	} else {
		character.movingAngle = [BEUMath angleFromPoint:ccp(character.x,character.z)
												toPoint:ccp(object.x,object.z)];
		character.movingPercent = 1;
	}
}

-(void)complete
{
	[super complete];
	BEUCharacter *character = (BEUCharacter *)target;
	[character moveCharacterWithAngle:0 percent:0];
}

@end

