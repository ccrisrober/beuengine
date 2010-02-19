//
//  BEUGame.m
//  BEUEngine
//
//  Created by Chris Mele on 2/17/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUGame.h"


@implementation BEUGame
@synthesize environment;

-(id)init {
	if( (self=[super init] )) {
		
		//ADD ENVIRONMENT TO THE STAGE
		environment = [[BEUEnvironment alloc] init];
		//environment.position = CGPointMake(environment.contentSize.width/2,environment.contentSize.height/2);
		[self addChild:environment];
		
		//ADD INPUT LAYER TO STAGE, ADD LAST
		inputLayer = [[BEUInputLayer alloc] init];
		[self addChild:inputLayer];					
		
	}
	
	return self;
}


-(void)dealloc{
	[environment release];
	[super dealloc];
}

@end
