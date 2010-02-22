//
//  BEUInputLayer.h
//  BEUEngine
//
//  Created by Chris Mele on 2/18/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "cocos2d.h"
#import "BEUCharacter.h"
#import "BEUMath.h"

@interface BEUInputLayer : CCLayer {
	CGRect movementArea;
	CGRect gestureArea;
	UITouch *movementTouch;
	UITouch *gestureTouch;
	CGPoint gestureStart;
	CGPoint movementStart;
	CGPoint movementDelta;
	double movementPercent;
	double movementTheta;
	double maximumMovementDist;
	BEUCharacter *character;
}

@property(nonatomic,retain) UITouch *movementTouch;
@property(nonatomic,retain) UITouch *gestureTouch;
@property(nonatomic,retain) BEUCharacter *character;

-(void)assignPlayer:(BEUCharacter *)char_;
-(void)step:(ccTime)delta;

@end
