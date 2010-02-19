//
//  BEUGame.h
//  BEUEngine
//
//  Created by Chris Mele on 2/17/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUEnvironment.h"
#import "BEUInputLayer.h"

@class BEUEnvironment;
@interface BEUGame : CCScene {
	BEUEnvironment *environment;
	BEUInputLayer *inputLayer;
}

@property(nonatomic,retain) BEUEnvironment *environment;
@property(nonatomic,retain) BEUInputLayer *inputLayer;

@end
