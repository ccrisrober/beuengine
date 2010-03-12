//
//  BEUEnvironmentTile.m
//  BEUEngine
//
//  Created by Chris Mele on 2/17/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUEnvironmentTile.h"


@implementation BEUEnvironmentTile
@synthesize walls, origWalls;




-(void)createTileWallsWithOffset:(CGPoint)offset
{
	NSMutableArray *newWalls = [[NSMutableArray alloc] init];
	
	for(NSValue *wallVal in origWalls){
		CGRect wall = [wallVal CGRectValue];
		CGRect updatedWall = CGRectMake(self.position.x + wall.origin.x + offset.x, 
										self.position.y + wall.origin.y + offset.y, 
										wall.size.width, 
										wall.size.height);
		[newWalls addObject:[NSValue valueWithCGRect:updatedWall]];
	
	}
	
	if(walls) [walls release];
	walls = newWalls;
}

-(void)draw
{
	[super draw];
	
	/*for(NSValue *wall in origWalls){
		[self drawRect:[wall CGRectValue]];
	}*/
}


-(void) drawRect:(CGRect)rect
{
	ccDrawLine(ccp(rect.origin.x, rect.origin.y), ccp(rect.origin.x + rect.size.width, rect.origin.y));
	ccDrawLine(ccp(rect.origin.x + rect.size.width, rect.origin.y), ccp(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height));
	ccDrawLine(ccp(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height), ccp(rect.origin.x, rect.origin.y + rect.size.height));
	ccDrawLine(ccp(rect.origin.x, rect.origin.y + rect.size.height), ccp(rect.origin.x, rect.origin.y));
}


-(void)dealloc
{
	[walls release];
	[origWalls release];
	[super dealloc];
}

@end
