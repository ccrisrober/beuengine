//
//  BEUObject.h
//  BEUEngine
//
//  Created by Chris Mele on 2/18/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "cocos2d.h"

@interface BEUObject : CCSprite {
	CGFloat x;
	CGFloat y;
	CGFloat z;
	
	CGFloat moveX;
	CGFloat moveY;
	CGFloat moveZ;
	
	CGRect hitArea;
	CGRect moveArea;
}
@property(nonatomic) CGFloat moveX;
@property(nonatomic) CGFloat moveY;
@property(nonatomic) CGFloat moveZ;
@property(nonatomic) CGFloat x;
@property(nonatomic) CGFloat y;
@property(nonatomic) CGFloat z;
@property(nonatomic) CGRect moveArea;
@property(nonatomic) CGRect	hitArea;

@end
