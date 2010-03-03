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
}

@property(nonatomic) CGRect hitArea;
@property(nonatomic) CGRect hitDepth;
@property(nonatomic) float power;


-(id)initWithSender:(id)sender_ 
		   selector:(SEL)selector_ 
		   duration:(int)duration_ 
			hitArea:(CGRect) hit_ 
		   hitDepth:(CGRect) depth_
			  power:(float)power_;

@end
