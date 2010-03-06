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

-(BOOL)isDone
{
	return completed;
}

-(void)update:(ccTime)delta
{
	BEUCharacter *character = (BEUCharacter *)target;
	
	if( character.x == point.x && character.z == point.y )
	{
		completed = YES;
	} else {
		[character moveCharacterWithAngle:
		 [BEUMath angleFromPoint:ccp(character.x,character.z)
						 toPoint:ccp(point.x,point.y)] 
								  percent: 1];		
	}
	
}

@end


@implementation BEUCharacterMoveToObject

@synthesize object;

+(id)actionWithObject:(BEUObject *)object_
{
	
}

-(id)initWithObject:(BEUObject *)object_
{
	
}

-(BOOL)isDone
{
	
}

-(void)update:(ccTime)delta
{
	
}

@end

