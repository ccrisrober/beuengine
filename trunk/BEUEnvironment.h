//
//  BEUEnvironment.h
//  BEUEngine
//
//  Created by Chris Mele on 2/17/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUObject.h"
#import "BEUCharacter.h"
#import "BEUEnvironmentTile.h"
#import "cocos2d.h"


@interface BEUEnvironment : CCScene {
	NSMutableArray *tiles;
}

@property(nonatomic,retain) NSMutableArray *tiles;

-(void)addTile:(BEUEnvironmentTile *)tile;

@end
