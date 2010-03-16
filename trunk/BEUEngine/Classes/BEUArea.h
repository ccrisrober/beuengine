//
//  BEUArea.h
//  BEUEngine
//
//  Created by Chris Mele on 2/21/10.
//  Copyright 2010 Invulse. All rights reserved.
//

//BEUArea

#import "BEUEnvironment.h"
#import "BEUEnvironmentTile.h"
#import "BEUSprite.h"
#import "cocos2d.h"

@class BEUSprite;

@interface BEUArea : BEUSprite {
	
	//Array of tiles in the area
	NSMutableArray *tiles;
	
	//Specifies the transition from this area to the next area
	NSString *transition;
	
	
	//Set when the area needs to be locked and the player should not be able to leave the area
	BOOL locked;
	
	CGRect leftEdgeWall;
	CGRect rightEdgeWall;
}

//Transition where the character must move to the right through to the next area, but will only show the next area when
//the player has moved completely into the next area
extern NSString *const BEUAreaTransitionSnap;


//Transition where the view will follow the player as normal once the current area is cleared, into the next
//area but will lock the previous area once the player has moved far enough
extern NSString *const BEUAreaTransitionContinue;

@property(nonatomic,retain) NSMutableArray *tiles;
@property(nonatomic,copy) NSString *transition;


-(id)initWithTiles:(NSMutableArray *)tiles_;
-(id)initWithTiles:(NSMutableArray *)tiles_ transition:(NSString *)transtion_;

-(void)lock;
-(void)unlock;

-(void)addTile:(BEUEnvironmentTile *)tile;
-(BOOL)doesRectCollideWithTilesWalls:(CGRect)objRect;
-(void)updateTileWalls;
@end
