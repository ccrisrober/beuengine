//
//  BEUArea.m
//  BEUEngine
//
//  Created by Chris Mele on 2/21/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUArea.h"


@implementation BEUArea

@synthesize tiles;

-(id)init
{
	if( (self=[super init]) ) {
		
		self.anchorPoint = ccp(0.0f,0.0f);
		
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

-(void)addTile:(BEUEnvironmentTile *)tile
{
	[tiles addObject:tile];
	tile.position = ccp(self.contentSize.width, 0.0f);
	[self addChild:tile];
	
}

-(void)updateTileWalls
{
	for(BEUEnvironmentTile *tile in tiles)
	{
		CGPoint offset = ccp(self.position.x, self.position.y);
		[tile createTileWallsWithOffset:offset];
	}
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
	
	return NO;
}

-(void)dealloc
{
	[tiles release];	
	[super dealloc];
}

typedef struct {
	float x1, y1, x2, y2;
} BBox;

- (void)updateContentSize {
	BBox outline = {0, 0, 0, 0};
	
	for (CCNode* child in self.children) {
		CGPoint position = child.position;
		CGSize size = child.contentSize;
		
		BBox bbox;
		bbox.x1 = position.x;
		bbox.y1 = position.y;
		bbox.x2 = position.x + size.width;
		bbox.y2 = position.y + size.height;
		
		if (bbox.x1 < outline.x1) { outline.x1 = bbox.x1; }
		if (bbox.y1 < outline.y1) { outline.y1 = bbox.y1; }
		if (bbox.x2 > outline.x2) { outline.x2 = bbox.x2; }
		if (bbox.y2 > outline.y2) { outline.y2 = bbox.y2; }
	}
	
	CGSize newContentSize;
	newContentSize.width = outline.x2 - outline.x1;
	newContentSize.height = outline.y2 - outline.y1;
	self.contentSize = newContentSize;
}

-(id) addChild: (CCNode*) child z:(int)z tag:(int) aTag {
	id result = [super addChild:child z:z tag:aTag];
	[self updateContentSize];
	return result;
}

-(void) removeChild: (CCNode*)child cleanup:(BOOL)cleanup {
	[super removeChild:child cleanup:cleanup];
	[self updateContentSize];
}




@end
