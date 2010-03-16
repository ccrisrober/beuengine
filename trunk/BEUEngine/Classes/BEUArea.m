//
//  BEUArea.m
//  BEUEngine
//
//  Created by Chris Mele on 2/21/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUArea.h"


@implementation BEUArea

@synthesize tiles, transition;


NSString *const BEUAreaTransitionSnap = @"area_transition_snap";
NSString *const BEUAreaTransitionContinue = @"area_transition_continue";


-(id)init
{
	if( (self=[super init]) ) {
		
		self.anchorPoint = ccp(0.0f,0.0f);
		transition = BEUAreaTransitionContinue;
		locked = NO;
		tiles = [[NSMutableArray alloc] init];
	}
	
	return self;
}

-(id)initWithTiles:(NSMutableArray *)tiles_
{
	[self init];
	
	for(BEUEnvironmentTile *tile in tiles_){
		[self addTile:tile];
	}
	
	return self;
}

-(id)initWithTiles:(NSMutableArray *)tiles_ transition:(NSString *)transtion_
{
	[self initWithTiles:tiles_];
	
	transition = transtion_;
	
	return self;
}

-(void)lock
{
	locked = YES;
}

-(void)unlock
{
	locked = NO;
}

-(void)addTile:(BEUEnvironmentTile *)tile
{
	float offset = 0.0f;
	[tiles addObject:tile];
	//NSLog(@"ADD TILE: %1.2f, TO: %1.2f",tile.contentSize.width,self.contentSize.width);
	tile.position = ccp(self.contentSize.width - offset, 0.0f);
	[self addChild:tile];
	
}

-(void)updateTileWalls
{
	for(BEUEnvironmentTile *tile in tiles)
	{
		CGPoint offset = ccp(self.position.x, self.position.y);
		[tile createTileWallsWithOffset:offset];
	}
	
	leftEdgeWall = CGRectMake(self.position.x - 1, 0, 1, [[CCDirector sharedDirector] winSize].height);
	rightEdgeWall = CGRectMake(self.position.x + self.contentSize.width, 0, 1, [[CCDirector sharedDirector] winSize].height);
}

-(BOOL)doesRectCollideWithTilesWalls:(CGRect)objRect
{
	for(BEUEnvironmentTile *tile in self.tiles){
		for(NSValue *wall in tile.walls){
			if(CGRectIntersectsRect(objRect, [wall CGRectValue])){
				return YES;
			}
		}
	}
	if(locked)
	{
		if(CGRectIntersectsRect(objRect, leftEdgeWall)) return YES;
		if(CGRectIntersectsRect(objRect, rightEdgeWall)) return YES;
	}
	
	return NO;
}

-(void)dealloc
{
	[tiles release];	
	[super dealloc];
}



@end
