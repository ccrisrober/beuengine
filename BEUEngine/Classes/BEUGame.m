//
//  BEUGame.m
//  BEUEngine
//
//  Created by Chris Mele on 2/17/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUGame.h"
#import "BEUActionsController.h"
#import "BEUTestCharacter.h"
#import "BEUSkeletalCharacter.h"

#import "BEUSpawner.h"

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
		
		
		 
		
		BEUCharacter *character = [[BEUTestCharacter alloc] init];
		character.x = 20;
		character.z = 50;
		character.enemy = NO;
		[[BEUObjectController sharedController] setPlayerCharacter: character];
		
		
		/*for(int i=0; i<1; i++){
			BEUCharacter *otherChar = [[BEUTestCharacter alloc] init];
			otherChar.enemy = YES;
			otherChar.x = 200 + arc4random()%350;
			otherChar.z = arc4random()%100;
			[[BEUObjectController sharedController] addCharacter:otherChar];
			
		}*/
		
		BEUSpawner *spawner = [[BEUSpawner alloc] initWithSpawnArea:CGRectMake(300, 0, 50, 100) 
															  types:[NSMutableSet setWithObjects:[BEUTestCharacter class],nil]
													  numberToSpawn:12];
		spawner.maximumSpawnableAtOnce = 1;
		[spawner start];
		[[BEUObjectController sharedController] addSpawner:spawner];
		
		
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
	[[BEUActionsController sharedController] step:delta];
}

@end
