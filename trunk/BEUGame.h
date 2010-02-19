//
//  BEUGame.h
//  BEUEngine
//
//  Created by Chris Mele on 2/17/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUEngine.h"
@class BEUEnvironment;
@interface BEUGame : CCScene {
	BEUEnvironment *environment;
}

@property(nonatomic,retain) BEUEnvironment *environment;

@end
