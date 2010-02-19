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
		[self addChild:tile];
			
		BEUCharacter *character = [[BEUCharacter alloc] init];
		NSLog([NSString stringWithFormat:@"%@",character]);
		[self addChild:character];
		
		/*CCSprite *character = [CCSprite spriteWithFile:@"Icon.png" rect: CGRectMake(0,0,50,50)];
		[self addChild:character];*/
		
		
	}
	
	return self;
	
}

@end
