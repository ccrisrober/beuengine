//
//  BEUEnvironment.h
//  BEUEngine
//
//  Created by Chris Mele on 2/17/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUObject.h"
#import "BEUCharacter.h"
#import "BEUEnvironmentTile.h"
#import "BEUObjectController.h"
#import "BEUArea.h"
#import "BEUInputLayer.h"
#import "cocos2d.h"
@class BEUArea;
@class BEUObject;
@class BEUCharacter;
@class BEUObjectController;
@class DebugLayer;
@interface BEUEnvironment : CCLayer {
	NSMutableArray *areas;
	CGPoint centerPoint;
	CGPoint leftCenterPoint;
	CGPoint rightCenterPoint;
	BEUArea *currentArea;
	
	CCLayer *objectsLayer;
	CCLayer *backgroundLayer;
	CCLayer *foregroundLayer;
	CCLayer *areasLayer;
	
	float environmentMoveVelocity;
	
	DebugLayer *debugLayer;
}

@property(nonatomic,retain) NSMutableArray *areas;
@property(nonatomic) CGPoint centerPoint;
@property(nonatomic, retain) BEUArea *currentArea;
@property(nonatomic) float environmentMoveVelocity;

@property(nonatomic,retain) CCLayer *objectsLayer;
@property(nonatomic,retain) CCLayer *backgroundLayer;
@property(nonatomic,retain) CCLayer *foregroundLayer;
@property(nonatomic,retain) CCLayer *areasLayer;
@property(nonatomic,retain) DebugLayer *debugLayer;

-(void)addArea:(BEUArea *)area;
-(void)addObject:(BEUObject *)obj;
-(void)removeObject:(BEUObject *)obj;
-(void)manageDepths;
-(void)moveEnvironment;

+(BEUEnvironment *)sharedEnvironment;

-(void)step:(ccTime)delta;

@end

@interface DebugLayer : CCLayer
-(void)drawRect:(CGRect)rect color:(ccColor4B)color lineWidth:(float)width;
@end

