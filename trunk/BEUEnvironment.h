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
#import "BEUArea.h"
#import "BEUInputLayer.h"
#import "cocos2d.h"
@class BEUArea;
@class BEUObject;
@class BEUCharacter;

@interface BEUEnvironment : CCLayer {
	NSMutableArray *areas;
	NSMutableArray *objects;
	CGPoint centerPoint;
	BEUCharacter *character;
	BEUArea *currentArea;
}

@property(nonatomic,retain) NSMutableArray *areas;
@property(nonatomic) CGPoint centerPoint;
@property(nonatomic, retain) BEUCharacter *character;
@property(nonatomic, retain) BEUArea *currentArea;

-(void)addArea:(BEUArea *)area;
-(void)addCharacter:(BEUCharacter *)character;
-(void)moveEnvironment;
-(void)moveObjects;
-(void)step:(ccTime)delta;

@end
