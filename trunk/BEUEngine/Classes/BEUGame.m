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
#import "PenguinCharacter.h"
#import "EskimoCharacter.h"
#import "IceTile.h"
#import "BEUSpawner.h"
#import "BEUInputJoystick.h"
#import "BEUInputGestureArea.h"
#import "BEUInputButton.h"
#import "NinjaStarFish.h"
#import "SwordFish.h"

@implementation BEUGame

@synthesize environment, inputLayer;

-(id)init {
	if( (self=[super init] )) {
		
		//ADD ENVIRONMENT TO THE STAGE
		//environment.position = CGPointMake(environment.contentSize.width/2,environment.contentSize.height/2);
		[self addChild:[BEUEnvironment sharedEnvironment]];
		
		for(int i=0; i<3; i++){
		
			NSMutableArray *tiles = [[NSMutableArray alloc] initWithObjects:
								 [[IceTile alloc] initTile],
								 [[IceTile alloc] initTile],
								 nil];
			BEUArea *area = [[BEUArea alloc] initWithTiles:tiles];
							
			[[BEUEnvironment sharedEnvironment] addArea:area];
		}
		
		BEUArea *firstArea = [[[BEUEnvironment sharedEnvironment] areas] objectAtIndex:0];
		[firstArea lock];
		
				
		BEUCharacter *character = [[PenguinCharacter alloc] init];
		character.x = 50;
		character.z = 100;
		character.enemy = NO;
		[[BEUObjectController sharedController] setPlayerCharacter: character];
		
		
		SwordFish *sword = [[SwordFish alloc] init];
		sword.x = 150;
		sword.z = 100;
		[[BEUObjectController sharedController] addItem:sword];
		
		//for(int i=0; i<1; i++){
			BEUCharacter *otherChar = [[EskimoCharacter alloc] init];
			otherChar.enemy = YES;
			otherChar.x = 200 + arc4random()%350;
			otherChar.z = 100 + arc4random()%100;
			[[BEUObjectController sharedController] addCharacter:otherChar];
		[[BEUTriggerController sharedController] addListener:firstArea type:BEUTriggerAllEnemiesKilled selector:@selector(unlock)];
		//}
		
		/*BEUSpawner *spawner = [[BEUSpawner alloc] initWithSpawnArea:CGRectMake(300, 0, 50, 100) 
															  types:[NSMutableSet setWithObjects:[BEUTestCharacter class],nil]
													  numberToSpawn:12];
		spawner.maximumSpawnableAtOnce = 1;
		[spawner start];
		[[BEUObjectController sharedController] addSpawner:spawner];*/
		
		
		//ADD INPUT LAYER TO STAGE, ADD LAST
		BEUInputJoystick *joystick = [[BEUInputJoystick alloc] initWithRadius:50 minZone:0 maxZone:30];
		joystick.position = ccp(100,85);
		joystick.tag = 0;
		
		
		BEUInputGestureArea *gestureArea = [[BEUInputGestureArea alloc] initWithArea:CGRectMake(240,120,240,200)];
		gestureArea.tag = 1;
		
		BEUInputButton *button = [[BEUInputButton alloc] 
								  initWithUpSprite: [CCSprite spriteWithFile:@"TestButton-Up.png"] 
										downSprite:[CCSprite spriteWithFile:@"TestButton-Down.png"]
								  ];
		button.position = ccp(400,100);
		button.tag = 2;
		button.scale = 1.6;
		
		
		inputLayer = [[BEUInputLayer alloc] init];
		[inputLayer addInput:joystick];
		[inputLayer addInput:gestureArea];
		[inputLayer addInput:button];
		
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
