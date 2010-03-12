//
//  BEUHitAction.h
//  BEUEngine
//
//  Created by Chris Mele on 2/27/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUAction.h"
#import "BEUObject.h"
@class BEUAction;
@class BEUObject;

@interface BEUHitAction : BEUAction {
	
	//This is the rectangle to check against a BEUObject's hitArea rect for collisions
	CGRect hitArea;
	//This is the rectangle to check against a BEUObject's moveArea rect for collisions
	CGRect hitDepth;
	//Power value of hit
	float power;
	//amount of x force to send
	float xForce;
	//amount of y force to send
	float yForce;
	//amount of z force to send
	float zForce;
}

@property(nonatomic) CGRect hitArea;
@property(nonatomic) CGRect hitDepth;
@property(nonatomic) float power;
@property(nonatomic) float xForce;
@property(nonatomic) float yForce;
@property(nonatomic) float zForce;


-(id)initWithSender:(id)sender_ 
		   selector:(SEL)selector_ 
		   duration:(int)duration_ 
			hitArea:(CGRect) hit_ 
		   hitDepth:(CGRect) depth_
			  power:(float)power_ 
			 xForce:(float)xForce_ 
			 yForce:(float)yForce_ 
			 zForce:(float)zForce_;

@end
