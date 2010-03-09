//
//  BEUCharacterAIIdleBehavior.h
//  BEUEngine
//
//  Created by Chris on 3/8/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "BEUCharacterAIBehavior.h"

@class BEUCharacterAIBehavior;

@interface BEUCharacterAIIdleBehavior : BEUCharacterAIBehavior {
	float minTime;
	float maxTime;
}

@property(nonatomic,assign) float minTime;
@property(nonatomic,assign) float maxTime;

-(id)initWithMinTime:(float)min maxTime:(float)max; 

+(id)behaviorWithMinTime:(float)min maxTime:(float)max;

@end
