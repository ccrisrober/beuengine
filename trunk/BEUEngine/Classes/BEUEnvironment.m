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
		for (int i = 0; i<3; i++) {
			BEUEnvironmentTile *tile = [[BEUEnvironmentTile alloc] initWithFile:@"TestTile.png"];
			[self addChild:tile];
		}
	}
	
	return self;
	
}

@end
