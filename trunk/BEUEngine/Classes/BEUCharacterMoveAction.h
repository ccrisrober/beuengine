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
}

@property(nonatomic,assign) BEUObject *object;
	
+(id)actionWithObject:(BEUObject *)object_;
-(id)initWithObject:(BEUObject *)object_;

@end


