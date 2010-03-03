//
//  BEUEnvironmentTile.h
//  BEUEngine
//
//  Created by Chris Mele on 2/17/10.
//  Copyright 2010 Invulse. All rights reserved.
//


#import "cocos2d.h"

@interface BEUEnvironmentTile : CCSprite {
	NSMutableArray *walls;
	NSMutableArray *origWalls;
}

@property(nonatomic, retain) NSMutableArray *walls;
@property(nonatomic, retain) NSMutableArray *origWalls;

-(void)createTileWallsWithOffset:(CGPoint)offset;

@end
