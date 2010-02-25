//
//  BEUGame.m
//  BEUEngine
//
//  Created by Chris Mele on 2/17/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUGame.h"


@implementation BEUGame
@synthesize environment, inputLayer;

-(id)init {
	if( (self=[super init] )) {
		
		//ADD ENVIRONMENT TO THE STAGE
		//environment.position = CGPointMake(environment.contentSize.width/2,environment.contentSize.height/2);
		[self addChild:[BEUEnvironment sharedEnvironment]];
		
		
		
		for(int i=0; i<3; i++){
		
			NSMutableArray *tiles = [[NSMutableArray alloc] initWithObjects:
								 [[BEUEnvironmentTile alloc] initWithFile:@"TestTile.png"],
								 [[BEUEnvironmentTile alloc] initWithFile:@"TestTile.png"],
								 nil];
			BEUArea *area = [[BEUArea alloc] initWithTiles:tiles];
							
			[[BEUEnvironment sharedEnvironment] addArea:area];
		}
		
		
		 
		
		BEUCharacter *character = [[BEUCharacter alloc] init];
		[[BEUObjectController sharedController] setPlayerCharacter: character];
		
		for(int i=0; i<20; i++){
			BEUCharacter *otherChar = [[BEUCharacter alloc] init];
			otherChar.xPos = arc4random()%2000;
			otherChar.zPos = arc4random()%120;
			[[BEUObjectController sharedController] addCharacter:otherChar];
		}
		
		
		//ADD INPUT LAYER TO STAGE, ADD LAST
		inputLayer = [[BEUInputLayer alloc] init];
		[self addChild:inputLayer];
		
		//[inputLayer assignPlayer:character];
		[inputLayer addReceiver:character];
		
		[self schedule:@selector(step:)];
	}
	
	return self;
}


-(void)dealloc{
	[environment release];
	[super dealloc];
}

- (void)step:(ccTime)delta
{
	[[self inputLayer] step:delta];
	[[BEUObjectController sharedController] step:delta];
	[[BEUEnvironment sharedEnvironment] step:delta];
}

@end
