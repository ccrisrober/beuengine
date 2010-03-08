//
//  BEUCharacterMoveAction.h
//  BEUEngine
//
//  Created by Chris on 3/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BEUCharacterAction.h"
#import "cocos2d.h"
#import "BEUCharacter.h"
#import "BEUMath.h"

@class BEUCharacterAction;

@interface BEUCharacterMoveTo : BEUCharacterAction
{
	//point to move to
	CGPoint point;
}

@property(nonatomic) CGPoint point;

+(id)actionWithPoint:(CGPoint)point_;
-(id)initWithPoint:(CGPoint)point_;

@end

@interface BEUCharacterMoveToObject : BEUCharacterAction
{
	//Object to move to
	BEUObject *object;
	
	//distance from the object that the character must be for action to be completed
	float distance;
}

@property(nonatomic,assign) BEUObject *object;
@property(nonatomic) float distance;

+(id)actionWithObject:(BEUObject *)object_ distance:(float)distance_;
-(id)initWithObject:(BEUObject *)object_ distance:(float)distance_;

@end


