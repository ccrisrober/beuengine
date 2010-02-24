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

-(id)initWithFile:(NSString *)filename {
	
	
	[super initWithFile:filename];
	
	[self.texture setAliasTexParameters];
	
	origWalls = [[NSMutableArray alloc] initWithObjects:
								[NSValue valueWithCGRect:CGRectMake(0,130,480,190)],
								//[NSValue valueWithCGRect:CGRectMake(-2,0,1,320)],
								[NSValue valueWithCGRect:CGRectMake(0,-1,480,1)],
								//[NSValue valueWithCGRect:CGRectMake(480,0,1,320)],
								nil];	
	[self createTileWallsWithOffset: ccp(0,0)];
	
	self.anchorPoint = ccp(0.0f, 0.0f);
	
	return self;
}

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
	
	for(NSValue *wall in origWalls){
		[self drawRect:[wall CGRectValue]];
	}
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
