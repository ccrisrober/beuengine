//
//  BEUEnvironment.m
//  BEUEngine
//
//  Created by Chris Mele on 2/17/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUEnvironment.h"


@implementation BEUEnvironment
@synthesize tiles;

-(id)init {
	if( (self=[super init] )) {
		
		BEUEnvironmentTile *tile = [[BEUEnvironmentTile alloc] initWithFile:@"TestTile.png"];
		[self addTile:tile];
		
		BEUCharacter *character = [[BEUCharacter alloc] init];
		[self addChild:character];
		
		/*CCSprite *character = [CCSprite spriteWithFile:@"Icon.png" rect: CGRectMake(0,0,50,50)];
		[self addChild:character];*/
		
		
	}
	
	return self;
	
}

-(void)addTile:(BEUEnvironmentTile *)tile
{
	//tile.position = ccp(tile.contentSize.width*.5, tile.contentSize.height*.5);
	
	tile.anchorPoint = ccp(-0.0f, -0.0f);
	[tiles addObject:tile];
	
	[self addChild:tile];
	
}

-(void)dealloc
{
	for(BEUEnvironmentTile *tile in tiles){
		[tile release];
	}
	
	[tiles release];
	
	[super dealloc];
}

@end
