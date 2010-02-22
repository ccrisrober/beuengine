//
//  BEUArea.h
//  BEUEngine
//
//  Created by Chris Mele on 2/21/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUEnvironment.h"
#import "BEUEnvironmentTile.h"
#import "cocos2d.h"

@interface BEUArea : CCSprite {
	NSMutableArray *tiles;
}

@property(nonatomic,retain) NSMutableArray *tiles;

-(id)initWithTiles:(NSMutableArray *)tiles;
-(void)addTile:(BEUEnvironmentTile *)tile;
-(BOOL)doesRectCollideWithTilesWalls:(CGRect)objRect;
@end
