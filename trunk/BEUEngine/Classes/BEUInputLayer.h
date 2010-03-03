//
//  BEUInputLayer.h
//  BEUEngine
//
//  Created by Chris Mele on 2/18/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "cocos2d.h"
#import "CGPointExtension.h";
#import "BEUCharacter.h"
#import "BEUMath.h"
#import "BEUInputEvent.h"
#import "BEUInputReceiverProtocol.h"
#import "BEUInputMovementEvent.h"

@interface BEUInputLayer : CCLayer {
	CGRect movementArea;
	CGRect gestureArea;
	UITouch *movementTouch;
	UITouch *gestureTouch;
	NSValue *gestureStart;
	
	// Maximum distance a movement can be away from its start
	float maximumMovementDist;
	
	// Maximum distance that the start of a gesture can move before it is not a tap
	float maximumTapDist;
	
	//Array of receivers to send inputs to
	NSMutableArray *receivers;
	
	//Input Events to store while inputs are happening
	BEUInputEvent *gestureEvent;
	BEUInputMovementEvent *movementEvent;
}

@property(nonatomic,retain) UITouch *movementTouch;
@property(nonatomic,retain) UITouch *gestureTouch;
@property(nonatomic,retain) NSMutableArray *receivers;
@property(nonatomic,retain) BEUInputEvent *gestureEvent;
@property(nonatomic,retain) BEUInputMovementEvent *movementEvent;

@property(nonatomic, retain) NSValue *gestureStart;
@property(nonatomic) CGRect movementArea;
@property(nonatomic) CGRect gestureArea;

-(void)addReceiver:(id <BEUInputReceiverProtocol>)receiver;
-(void)removeReceiver:(id <BEUInputReceiverProtocol>)receiver;
-(void)dispatchEvent:(BEUInputEvent *)event;

-(void)step:(ccTime)delta;

@end
