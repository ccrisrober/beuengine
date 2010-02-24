//
//  BEUObject.h
//  BEUEngine
//
//  Created by Chris Mele on 2/18/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "cocos2d.h"

@interface BEUObject : CCSprite {
	CGFloat xPos;
	CGFloat yPos;
	CGFloat zPos;
	
	CGFloat moveX;
	CGFloat moveY;
	CGFloat moveZ;
	
	CGRect hitArea;
	CGRect moveArea;
	
	double movementSpeed;
}
@property(nonatomic) CGFloat moveX;
@property(nonatomic) CGFloat moveY;
@property(nonatomic) CGFloat moveZ;
@property(nonatomic) CGFloat xPos;
@property(nonatomic) CGFloat yPos;
@property(nonatomic) CGFloat zPos;
@property(nonatomic) CGRect moveArea;
@property(nonatomic) CGRect	hitArea;

-(void)step:(ccTime)delta;

@end
